#!/bin/sh
JETBRAINS_PATH=$HOME/JetBrains
EDITOR=IntelliJIdea14
APP_PATH=$HOME/Applications/IntelliJ\ IDEA\ 14\ EAP.app
DIRNAME=`/bin/date '+%Y%m%d-%H%M%S'`

# Check JETBRAINS_PATH directory
if [ -e $JETBRAINS_PATH/$EDITOR ]; then
  echo "\033[32m✔\033[m $JETBRAINS_PATH/$EDITOR/ found."
else
  mkdir -p $JETBRAINS_PATH$EDITOR
  echo "mkdir $JETBRAINS_PATH/$EDITOR directory."
fi

# Check JETBRAINS_PATH/backup directory
if [ -e $JETBRAINS_PATH/$EDITOR/backup/ ]; then
  echo "\033[32m✔\033[m $JETBRAINS_PATH/$EDITOR/backup/ found."
else
  mkdir -p $JETBRAINS_PATH/$EDITOR/backup/
  echo "mkdir $JETBRAINS_PATH/$EDITOR/backup/ directory"
fi

# Backup original file.
mkdir $JETBRAINS_PATH/$EDITOR/backup/$DIRNAME
cp "$APP_PATH/Contents/Info.plist" "$JETBRAINS_PATH/$EDITOR/backup/$DIRNAME"
cp "${APP_PATH}/Contents/bin/idea.vmoptions" "$JETBRAINS_PATH/$EDITOR/backup/$DIRNAME"
cp "${APP_PATH}/Contents/bin/idea.properties" "$JETBRAINS_PATH/$EDITOR/backup/$DIRNAME"
echo "\033[32m✔\033[m Backup Info.plist & idea.vmoptions & idea.properties from $APP_PATH"

# Delete original data.
  rm "$APP_PATH/Contents/Info.plist" "$APP_PATH/Contents/bin/idea.vmoptions $APP_PATH/Contents/bin/idea.properties"
  rm -r "$HOME/Library/Preferences/$EDITOR"
  rm -r "$HOME/Library/Application\ Support/$EDITOR"

# Make Alias
ln -s "${JETBRAINS_PATH}/$EDITOR/Contents/Info.plist" "$APP_PATH/Contents/Info.plist"
ln -s "${JETBRAINS_PATH}/$EDITOR/Contents/bin/idea.vmoptions" $APP_PATH/Contents/bin/idea.vmoptions
ln -s "${JETBRAINS_PATH}/$EDITOR/Contents/bin/idea.properties" $APP_PATH/Contents/bin/idea.properties
ln -s "${JETBRAINS_PATH}/$EDITOR/Application\ Support/" "$HOME/Library/Application\ Support/$EDITOR"
ln -s "${JETBRAINS_PATH}/$EDITOR/Preferences/" "$HOME/Library/Preferences/$EDITOR"
