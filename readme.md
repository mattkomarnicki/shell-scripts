## Shell Scripts (Helpers)

The pourpose of this repository is to collect frequently used Unix commands and wrap them into shell scripts, so that the end user doesn't have to memorize additional arguments to run them. 

Scripts should:
* have clear name (ideally one world)
* be executable `chmod +x script_name`
* have a symlink in `/usr/local/bin` like `sudo ln -s /absolute/path/to/the/script /usr/local/bin/new_command_name`