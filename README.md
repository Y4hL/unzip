# unzip  
Minimalistic Unzipper for Windows  
  
Only uses built in Windows file types  
Works only on .zip files  
  
# Format:  
  
``unzip.cmd path_to_zip_file destination``  
  
If values are not given, it will automatically ask for them.  
  
It also asks for values, if the files is opened.  
  
# Example:  
  
``unzip.cmd %userprofile%\Desktop\download.zip %userprofile%\Desktop\download``  
>> unzips download.zip into %userprofile%\Desktop\download  
