@echo off
set working_name=working
set original_name=orig
set working_iso=Mask_of_Death_Working.iso

echo Clearing out the old files and create a clean workspace...
del /s /q cd\%working_name%\* 1>nul
Xcopy /E /q cd\%original_name%\ cd\%working_name%\ 1>nul
echo:

echo Converting all images to cels and inserting...
python tools\BMPToCEL.py images\ cd\%working_name%\
copy images\BannerScreen cd\%working_name%\ 1>nul
echo:

echo Copying all script files over...
python tools\CopyFileWithUnixEndings.py scripts\girford\fight.com cd\%working_name%\girford
python tools\CopyFileWithUnixEndings.py scripts\girford\item.com cd\%working_name%\girford
echo:

echo Copying... Launchme over and insert the translations...
copy cd\%original_name%\Launchme exe\Launchme
tools\atlas exe\Launchme exe\exe_translations.txt >> exe_error.txt
copy exe\Launchme cd\%working_name%\Launchme
echo:

echo Copying over the new font...
copy font\kanji.fnt cd\%working_name%\kanji.fnt
echo:

echo Moving over the terrible voice acting...
copy voices\serifu\*.aifc cd\%working_name%\serifu\
echo:

echo Adding less obnoxious background music...
copy music\house1.aifc cd\%working_name%\house1.aifc
echo:

::echo Convert bmp sprite sheets to anims
::tools\BMPTo3DOAnim.exe 24 24 anims\SUB_TITLE01.bmp cd\working\jyanpai\AnimationData\sub_title\SUB_TITLE01.ANIM
::echo:

echo Creating final iso...
tools\3doiso.exe -in cd\working -out "cd\%working_iso%"
echo:

echo Signing release...
tools\3DOHomebrewSigning.exe genromtags "cd\%working_iso%"
echo:

echo #######################################################
echo "Build complete!"
echo #######################################################
echo:

pause