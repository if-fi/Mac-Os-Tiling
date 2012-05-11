--Run via quicksilver trigger to tile all windows

--found in comments here: http://www.macosxhints.com/article.php?story=20060105082728937

property numCols : 2
property screenWidth : 1920
property screenHeight : 1080
-- If you don't want to hard-code your screen width, because eg. you use multiple screens with differing properties at different times, then uncomment the 2 lines below:
--set screenWidth to word 3 of (do shell script "defaults read /Library/Preferences/com.apple.windowserver | grep -w Width") as number
--set screenHeight to word 3 of (do shell script "defaults read /Library/Preferences/com.apple.windowserver | grep -w Height") as number

set menubarHeight to 22

tell application "System Events"
	set frontApp to name of first application process whose frontmost is true
end tell

--some apps are wacky and put the windows higher for some reason, adjust for this bug.
if (frontApp is equal to "Finder" or frontApp is equal to "Microsoft Entourage") then
	set menubarHeight to 44
end if
--leave room for the Excel Toolbar
if (frontApp is equal to "Microsoft Excel") then
	set menubarHeight to 55
end if

try
	-- For some reason Finder calls minimized windows "collapsed" while other apps call them "miniaturized", so I deal with this by duplacating lots of code and having this big if/else. It's okay though because Finder's menubarHeight of 44 bug requires some tweaking of the numbers to resize the windows right. So the duplicate code isn't a total waste, but I'm sure there's a way to do this with list repeating.
	if frontApp is "Finder" then
		tell application "Finder"
			-- Ignore windows that are minimized, invisible or that don't have a title
			set windowCount to count of (windows whose visible is true and name is not "" and collapsed is false)
			set allWindowCount to count of windows
			
			-- Set number of rows appropriately
			set numRows to round (windowCount / numCols) rounding up
			
			-- Special case if the number of windows is less than the number of columns preference
			if windowCount is less than or equal to numCols then
				set numRows to 2
				set numCols to windowCount
			end if
			
			-- Special case is there's only one window
			if windowCount = 1 then
				set numRows to 1
				set numCols to 2
			end if
			
			-- skipWindow is for skipping over windows which are invisible or titleless
			set skipWindow to 0
			repeat with j from 0 to numRows - 1
				repeat with i from 0 to numCols - 1
					-- If we've done all the windows, then just get out
					if (j * numCols + i + 1) > windowCount then
						exit repeat
					end if
					-- Get a handle to the window we might want to resize
					set theWindow to window (j * numCols + i + 1 + skipWindow)
					-- Check that the window is visible and titled -- if it's not, then skip it
					repeat while (visible of theWindow is false or name of theWindow is "")
						set skipWindow to skipWindow + 1
						set theWindow to window (j * numRows + i + 1 + skipWindow)
					end repeat
					
					-- resize the window
					set bounds of theWindow to {�
						round (i * screenWidth / numCols), �
						menubarHeight + (round (j * (screenHeight - 22) / numRows)), �
						round ((i * screenWidth / numCols) + (screenWidth / numCols)), �
						round ((22 + (round (j * (screenHeight - 22) / numRows))) + (screenHeight - 22) / numRows) �
							}
				end repeat
			end repeat
		end tell
	else
		tell application frontApp
			-- Ignore windows that are minimized, invisible or that don't have a title
			set windowCount to count of (windows whose visible is true and name is not "" and miniaturized is false)
			set allWindowCount to count of windows
			
			-- Set number of rows appropriately
			set numRows to round (windowCount / numCols) rounding up
			
			-- Special case if the number of windows is less than the number of columns preference
			if windowCount is less than or equal to numCols then
				set numRows to 1
				set numCols to windowCount
			end if
			
			-- Special case is there's only one window
			if windowCount = 1 then
				set numRows to 1
				set numCols to 1
			end if
			
			-- skipWindow is for skipping over windows which are invisible or titleless
			set skipWindow to 0
			repeat with j from 0 to numRows - 1
				repeat with i from 0 to numCols - 1
					-- If we've done all the windows, then just get out
					if (j * numCols + i + 1) > windowCount then
						exit repeat
					end if
					-- Get a handle to the window we might want to resize
					set theWindow to window (j * numCols + i + 1 + skipWindow)
					-- Check that the window is visible and titled -- if it's not, then skip it
					repeat while (visible of theWindow is false or name of theWindow is "")
						set skipWindow to skipWindow + 1
						set theWindow to window (j * numRows + i + 1 + skipWindow)
					end repeat
					
					-- resize the window
					set bounds of theWindow to {�
						round (i * screenWidth / numCols), �
						menubarHeight + (round (j * (screenHeight - menubarHeight) / numRows)), �
						round ((i * screenWidth / numCols) + (screenWidth / numCols)), �
						round ((menubarHeight + (round (j * (screenHeight - menubarHeight) / numRows))) + (screenHeight - menubarHeight) / numRows) �
							}
				end repeat
			end repeat
		end tell
	end if
on error the error_message number the error_number
	display dialog "Error: " & the error_number & ". " & the error_message buttons {"OK"} default button 1
end try
