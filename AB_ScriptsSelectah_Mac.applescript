-- AB_OpenAdobeScriptsFolder_Mac.applescript
-- Finds installed Adobe apps in /Applications and opens the chosen Scripts folder.

set adobeAppPrefixes to {"Adobe After Effects", "Adobe Premiere Pro", "Adobe Illustrator", "Adobe Photoshop"}

set foundApps to {}

tell application "Finder"
	set appsFolder to POSIX file "/Applications/" as alias
	set appFolders to folders of appsFolder

	repeat with f in appFolders
		set folderName to name of f

		repeat with appPrefix in adobeAppPrefixes
			if folderName starts with appPrefix then
				set end of foundApps to folderName
			end if
		end repeat
	end repeat
end tell

if (count of foundApps) is 0 then
	display dialog "No supported Adobe app folders found in /Applications." buttons {"OK"} default button "OK"
	return
end if

set chosenApp to choose from list foundApps with prompt "Choose Adobe version:" OK button name "Open" cancel button name "Cancel"

if chosenApp is false then
	return
end if

set chosenAppName to item 1 of chosenApp

set folderOptions to {"Scripts", "ScriptUI Panels"}

set chosenFolder to choose from list folderOptions with prompt "Open which folder?" OK button name "Open" cancel button name "Cancel"

if chosenFolder is false then
	return
end if

set chosenFolderName to item 1 of chosenFolder

if chosenFolderName is "Scripts" then
	set targetPath to "/Applications/" & chosenAppName & "/Scripts"
else
	set targetPath to "/Applications/" & chosenAppName & "/Scripts/ScriptUI Panels"
end if

tell application "System Events"
	if not (exists folder targetPath) then
		display dialog "Folder does not exist:" & return & return & targetPath buttons {"OK"} default button "OK"
		return
	end if
end tell

tell application "Finder"
	open POSIX file targetPath
	activate
end tell
