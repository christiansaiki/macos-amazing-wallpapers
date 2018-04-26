[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

# MacOS Amazing Wallpapers
You can easily display a fresh amazing wallpaper from
[Unsplash](https://unsplash.com)

## Installation
 1. Clone the repository:

    ```
    git clone https://github.com/christiansaiki/macos-amazing-wallpapers.git
    ```

 2. Optionally, you can test the correct working of the script, by opening the Terminal app and running the following command:

    ```
    sh macos-amazing-wallpapers.sh
    ```

 3. Put the script on your crontab, by opening the Terminal app and running the following command:

    ```
    crontab -e
    ```

 4. Now you have to append the following line (press `i` button to insert data):

    ```
    0 12 * * * sh /directory_path/macos-amazing-wallpapers.sh
    ```

    where `/directory_path/` identifies the path of the directory containing the script (to be configured as value of the `$DIR` directory on the script), while `00 12` specifies the program has to be called every day at noon
    
 5. Hit `:wq` to close, saving the file
 6. Check if the crontab is correct by running `crontab -l`
 7. Enjoy!
