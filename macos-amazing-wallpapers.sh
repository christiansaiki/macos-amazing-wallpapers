#!/bin/bash

# 
# macos-amazing-wallpapers
# Author: Christian Saiki
# Email: chr.saiki@gmail.com
# 

# --- --- --- --- ---
# CONFIGURATION BEGIN
# --- --- --- --- ---

function wallpaper() {
  sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock
}
# set to 0 if you want to use (also) portrait photos as background
ONLY_LANDSCAPE_MODE=1

# script directory (without final '/' slash)
DIR="/tmp"
IMG_PATH=$DIR/unsplash.png
# --- --- --- --- ---
#  CONFIGURATION END
# --- --- --- --- ---

# cycling until a "good" image if found
FOUND=0
for i in $(seq 1 5); do
	# printing basic information
	echo "Getting image"

	# getting a random element index
	RND=$(( $RANDOM % 10 ))
  BASE_URL="https://api.unsplash.com/collections/curated/170/photos/?client_id=c9781ab261d75919e183a4a294f7702cb5d2e38f4e5ba0c352abb1480043425f"
	# getting the image url from index
	IMG=`curl -s $BASE_URL | jq --arg rnd $RND -r '.[$rnd | tonumber].urls.full'`

	# getting image data from url
	wget "$IMG" -O $IMG_PATH

	# getting image dimensions
	IMG_W=`sips -g pixelWidth $IMG_PATH|tail -n 1|awk '{print $2}'`
	IMG_H=`sips -g pixelHeight $IMG_PATH|tail -n 1|awk '{print $2}'`
	echo "Image size is ${IMG_W} x ${IMG_H}"

	# checking if image is "good"
	if [ ! $ONLY_LANDSCAPE_MODE ] || [ $IMG_W -gt $IMG_H ]; then
		FOUND=1
		break
	fi
done

if [ $FOUND ]; then
	# setting image as background
	echo "Setting downloaded image as background"
  wallpaper $IMG_PATH

else
	echo "No image found"
fi

