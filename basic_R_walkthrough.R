###### Here are the notes/reminders for myself #####

#####                 ------------Select Columns-----------             #####

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

# use7: data %>% select_if(~!is.numeric(.)) %>% glimpse
# Note: ~ is the shorthand to create an anonymous function; . is to represent each column
# ~ is to wrap a statement as a function to be passed into a function
# ! is to negate; na.rm is to remove NA values
# ~mean(.,na.rm=TRUE)>10 
# ~n_distinct(.) <20 ; n_distinct is used to count the amount of distinct values in a column

# use8: data %>% select(colname3,colname2,everything()) %>% glimpse
# can arrange order and append everything else in the end


# use9: data %>% select_all(toupper/tolower)
# can use select_all to select all columns

#####                 ------------Column Names -----------             #####
# use1: data %>% select(colname1, colname2, colname3 = new_colname3) %>% glimpse() 
# rename the column within select function

# use2: data %>% rename(colname1 = new1, colname2=new2, colname3 = new_colname3) %>% glimpse() 
# rename the column within rename function without selection 

# use3: data %>% select_all(~str_replace(., " ", "_"))
# replace the "dot" in all column names from white space to _

# ues4: data %>% tibble::rownames_to_column("colname") %>% head 
# to turn a rowname into a specific column


