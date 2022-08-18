@echo off
set original="Ghost Hunter Series - Kuroki Shi no Kamen (Japan) (Rev 1).bin"
set working=Mask_of_Death_Working.iso

:: Check that the files exist
if not exist cd\%original% (
	echo Could not find the original iso
	echo Please verify a file named %original% exists in the cd folder
	echo and try again.
	goto :EXIT
)

if not exist cd\%working% (
	echo Could not find the translated iso
	echo Please verify a file named %working% exists in the cd folder
	echo and try again.
	goto :EXIT
)

:: Create a patch with the two isos
echo Creating patch, please wait...
release\patch_data\xdelta.exe -9 -S djw -B 1812725760 -e -vfs cd\%original% cd\%working% release\patch_data\ghost-hunters-patch.xdelta3

echo Patch created successfully in the release\patch_data folder!

:EXIT
echo Press any key to close this window
pause >nul
exit