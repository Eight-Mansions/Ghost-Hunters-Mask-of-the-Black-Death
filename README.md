# Ghost Hunters Series: Mask of the Black Death (3DO)
## Building
- These instructions expect a Windows environment at this time.
- A python 3 installation is required for the build.

### First time prep
1. Open OperaFS [De]Compiler [EN].exe in the tools folder.
2. Select "De-Compile", then navigate to your original copy of Ghost Hunters: Mask of the Black Death Rev. 1.
3. Next to your game will be a folder called "PARSE_<name_of_image>". Copy the contents of that folder into "cd/orig/". Do not copy the PARSE_ folder itself, just the contents.

### Creating the patched version
1. Run "1-build.bat" to prepare the translated files.
2. Open OperaFS [De]Compiler [EN].exe in the tools folder. Select "Compile", then navigate to "cd/working/". Double click on the "working" folder to verify it's selected, then hit OK.
3. Save the iso to the "cd" folder as "Mask_of_Death_Working.iso". If you save with a different name, edit "create_patch.bat" later with the new name if you intend to make an xdelta patch.
4. Run "3-sign.bat" to sign the game for consoles. The game should now be ready to go.

## Adding to the build
- The build process works by copying over images, voices, etc. from their respective folders into the working folder. File structure should be preserved for image and video.
- All voices are under "voices/serifu/". Anything in this folder will be copied automatically into the build. Verify your new file matches the filename in the game's files.
- All images are under "images/girford" and the "Opening" subfolder. BMPs here will be converted to CELs as long as they're 24-bit bmp files, have widths that are multiplies of 4, and heights multiple of 2. #FF00FF acts as a transparent color. Filenames must match the original filename with ".bmp" appended. For example, "save1.cel" becomes "save1.cel.bmp".
- Text lines are in "scripts/girford". "fight.com" and "item.com" can be opened in a text editor that supports the Shift/JIS character encoding. Saving in a different encoding will corrupt the files.
- System text lines like character names are in the "exe/exe_translations.txt" folder.
- The "music" folder's "house1.aifc" replaces the 19-second tedious song with one I wrote for Doctor Hauzer.

## Known bugs
- Adding the new title screen to the build causes the game to hang on the banner screen.
- Adding the "Please wait..." image message to the build causes the main menu to glitch out and display the graphics incorrectly.
- The above two errors are most likely from the simple BMP to CEL tool we have that doesn't have many of the CEL options the original 3DO tools did. We'd need to wait for better tools, or attempt to make better ones in the Mac VM environment.