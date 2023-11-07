# Ghost Hunters Series: Mask of the Black Death (3DO)
## Building
- These instructions expect a Windows environment at this time.
- A Python 3 installation is required for the build.

### First time prep
1. Create a folder called `cd` in the root of the project. Inside that, create an `orig` folder.
2. Open `OperaFS [De]Compiler [EN].exe` in the `tools` folder.
3. Select `De-Compile`, then navigate to your original copy of Ghost Hunters: Mask of the Black Death Rev. 1.
4. Next to your game will be a folder called `PARSE_<name_of_image>`. Copy the contents of that folder into the `cd/orig/` folder. Do not copy the PARSE_ folder itself, just the contents.

### Creating the English-patched version
Run `build.bat` to prepare the translated files and insert them automatically. The resulting English iso will be created under `cd` with the name `Mask_of_Death_Working.iso`.

## Adding to the build
- The build process works by copying over images, voices, etc. from their respective folders into the working folder. File structure should be preserved for image and video.
- All voices are under `voices/serifu/`. Anything in this folder will be copied automatically into the build. Verify your new file matches the filename in the game's files.
- *Outdated! Replace with 3it image tool instead!* All images are under `images/girford` and the `Opening` subfolder. BMPs here will be converted to CELs as long as they're 24-bit bmp files, have widths that are multiplies of 4, and heights multiple of 2. #FF00FF acts as a transparent color. Filenames must match the original filename with `.bmp` appended. For example, `save1.cel" becomes `save1.cel.bmp`.
- Text lines are in `scripts/girford`. `fight.com` and `item.com` can be opened in a text editor that supports the Shift/JIS character encoding. Saving in a different encoding will corrupt the files.
- System text lines like character names are in the `exe/exe_translations.txt` folder.
- The `music` folder's `house1.aifc` replaces the 19-second tedious song with one I wrote. You can swap in the one I wrote for Doctor Hauzer by changing the file inside `build.bat` to `hauzer-house1.aifc`.

## Known bugs
- Adding the new title screen to the build causes the game to hang on the banner screen.
- Adding the "Please wait..." image message to the build causes the main menu to glitch out and display the graphics incorrectly.
- The above two errors are due to using the old BMP to CEL tool, which is now outdated and superceded by 3it. Using that, we should be able to redo those images and make them work.