#!/usr/bin/env bash

# Check root
sudo echo "Obtained root privileges!"

PLYMOUTH_THEMES=/usr/share/plymouth/themes/
LOGIN_THEMES=/usr/share/sddm/themes/
LOGIN_CONFIG=/etc/sddm.conf.d/kde_settings.conf

SPLASH_THEMES=~/.local/share/plasma/look-and-feel/
SPLASH_CONFIG=~/.config/ksplashrc

PROJECT_NAME=wd_boot_screen

# Install plymouth
echo "Installing plymouth boot screen"

sudo rm -r $PLYMOUTH_THEMES$PROJECT_NAME
sudo cp -r plymouth/$PROJECT_NAME $PLYMOUTH_THEMES
sudo plymouth-set-default-theme -R wd_boot_screen

echo "Successfully installed plymouth boot screen"

# Install login screen
echo "Installing login screen"

sudo rm -r $LOGIN_THEMES$PROJECT_NAME
sudo cp -r sddm-login-screen/$PROJECT_NAME $LOGIN_THEMES

found=0

if [ -e $LOGIN_CONFIG ]; then
  sudo cp $LOGIN_CONFIG $LOGIN_CONFIG.old
  sudo chmod 777 $LOGIN_CONFIG
  echo "" > $LOGIN_CONFIG
  while read -r line; do
    if [[ "$line" == "Current=*" ]]; then
      found=1
      echo "Current=$PROJECT_NAME" >> $LOGIN_CONFIG
    else
      echo "$line" > $LOGIN_CONFIG
    fi
  done < $LOGIN_CONFIG.old
  sudo chmod 600 $LOGIN_CONFIG
fi

if [ $found == 0 ]; then
  sudo chmod 777 $LOGIN_CONFIG
  echo "[Theme]" >> $LOGIN_CONFIG
  echo "Current=$PROJECT_NAME" >> $LOGIN_CONFIG
  sudo chmod 600 $LOGIN_CONFIG
fi

echo "Successfully installed login screen"

# Install splash screen
echo "Installing splash screen"

sudo rm -r $SPLASH_THEMES$PROJECT_NAME
sudo cp -r plasma-splash-screen/$PROJECT_NAME $SPLASH_THEMES

sudo mv $SPLASH_CONFIG $SPLASH_CONFIG.old
echo "[KSplash]" >> $SPLASH_CONFIG
echo "Theme=wd_boot_screen" >> $SPLASH_CONFIG

echo "Successfully installed splash screen"
