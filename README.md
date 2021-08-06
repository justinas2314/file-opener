# file-opener
Searches specific directories for a file with a matching filename and opens it with the default application for the selected file type
### How to use it
The easiest method would be to set up an alias inside your `.bashrc` file like so  
`alias opener='crystal run --release "DIRECTORY/WITH/YOUR/FILE/find.cr" --'` 
and then search by writing `opener \find.cr` or `opener -l \find.cr` the slash is necessary because otherwise linux might not pass this argument as the same string.
The directories need to be seperated with `/` while the escaping char needs to be `\`.  
The `-l` argument specifies if the script should search in the current working directory (this would be with `-l`) or in the directories hardcoded inside `find.cr`.  
The directories inside `find.cr` are in a hierarchical order so the script will not search other directories if it finds a matching file inside the first one.  
If multiple matching files are found inside one directory it will print all of them.  
If you notice a bug after searching with an argument such as `opener \src/main.rs` you need to change it to `opener \*src/main.rs` and it should work. This is caused by the weird implementation of glob inside crystal std.
