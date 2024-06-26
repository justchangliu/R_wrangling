###### Here are the notes/reminders for myself #####
##### Select Columns

# use1: data %>% select(colname1, colname2, colname3,...) %>% glimpse() 
# Note: use pipe; select based on column names; order matters

# use2: data %>% select(colname1:colname4,colname7:colname10) 
# Note: select a range of columns

# use3: data %>% select(-(colname1:colname4),-colname7, column3) 
# Note: data deselection and re-add the deselected column in the end

# use4: data %>% select( colname1,starts_with("a") ) 
# Note: use start_with();end_with();contains(); matches() to select based on matching column names

# use5: data %>% select(!!vector_column_names)
# Note: vector_column_names is a vector c("colname1","colname3","colnam5")

# use6: data %>% select_if(is.numeric) %>% glimpse
# Note: select based on the type of the data; need to input a function that outputs boolean value
# is.character();is.numeric();is.integer();is.double();is.logical();is.factor();is.Date()

# 


