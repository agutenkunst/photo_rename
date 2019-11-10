# photo_rename
Rename images and videos from booth Google Pixel and iPhone consistently and sortable

Note: Tested with Mac OS, should work with most Unix Systems. Otherwise PR welcome!

## Requirements
Make sure you have rename installed otherwise install it with

**Mac OS**
```
brew install rename
```

**Ubuntu**
```
sudo apt install rename
```

## Usage
This script renames the files in the current directory.

Test with
```
photo_rename.sh *.{jpg,mp4,gif} --dry-run
```

Run with (non-reversible!)
```
photo_rename.sh *.{jpg,mp4,gif}
```
