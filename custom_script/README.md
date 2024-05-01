# Run Custom script from anywhere

You can your Custom script from anywhere all you have to do is add the path of that script to path variable of your shell.

## zsh
### Usecase
There are lot of task which I need to be automated but I will focus on *_copy path to clipboard_* which I use very frequently.SO to do that these are the steps.
1. Create a folder for all your custom script.
I am creating ~/myFiles/myScript

```
(base) ~ » mkdir ~/myFiles/myScript

```

2. Create custom script inside that folder.

```
(base) ~ » cd ~/myFiles/myScript
(base) myScript » touch pathcopy.sh
```

#### Content of pathcopy.sh

```
#!/bin/bash
CURRENT_DIR=$(pwd)
echo -n "$CURRENT_DIR" | pbcopy
echo "$CURRENT_DIR copied to clipboard"
```
I have used pbcopy which is available for macOS. You can simply use echo(printing) of current path to verify

```
#!/bin/bash
CURRENT_DIR=$(pwd)
echo "$CURRENT_DIR is your current directory“
```

3. Try to run from same directory
You might face this problem

```
(base) myScript » pathcopy.sh
zsh: permission denied: pathcopy.sh
```
change file permission

```
(base) myScript » chmod +x pathcopy.sh
```

Now it should run.

4. Add <script directory path\> which is _~/myFiles/myScript_ in my case
5. Run it from anywhere

```
(base) myFiles » pathcopy.sh                                                     
/Users/jitendra/myFiles copied to clipboard
```