Getting-and-Cleaning-Data
=========================
The code is for cleaning and creating a tidy data frame. The data was collected from Samsung Galaxy S II 
accelerometers. The data is contained within and loaded from six separate files. The code takes these files and 
creates three data frames, one “test”, one “train”, and one "action". Within the "test" and "train" data 
frames the data is truncated to include only those variables that include a mean or standard deviation.  
A separate data frame for the actions is the third data frame created. The code converts the numeric index 
of "action" to a descriptive action. The data frames are then combined to create one tidy data frame that has 
means and standard deviation as well as the actions. Lastly, the code properly allocates names to each 
column of the tidy data frame.
