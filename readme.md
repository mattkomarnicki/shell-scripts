## Shell Scripts (Helpers)

The purpose of this repository is to collect frequently used Unix commands and wrap them into shell scripts, 
so that the end user doesn't have to memorize any additional arguments before running them. 

Scripts should:
* have clear name (ideally one world)
* be executable `chmod +x script_name`
* have a symlink in `/usr/local/bin` like `sudo ln -s /absolute/path/to/the/script /usr/local/bin/new_command_name`

## Installation

Is extremely easy. My idea was to be able to trigger all scripts globally from every place inside the OS.
To achieve that, for each script a new symlink will be created in `/usr/local/bin` automatically.

All you have to do is to:
1. be sure that **install** script is executable (`chmod +x install`)
2. you have root access since all symlinks are created with `sudo`
3. simply call `./install`

## Example usage

Let's assume we have a directory with a bunch of files in `~/Desktop/my_images`. We'll compress everything using 
one single command called `pack` with no additional flags. All we have to tell to the script is:
* how our archive should should be named
* where the source directory is located

Go to the destination location
`cd ~/Desktop`

Call the script, first argument is the name you want to call your archive, seconds is obviously the location of your images
`pack my_compressed_images my_images/`

After a while you should get new archive `my_compressed_images_2015-10-14_21_20_06.tar.bz2`. Current timestamp will be
automatically added. You don't have to add the `tar.bz2` extension.

Call `pack` with no arguments to see simple hint.
