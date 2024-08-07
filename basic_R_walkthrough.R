###### Here are the notes/reminders for myself #####


#####                 ------------ Enviroment SetUp -----------             #####
### Wrapper functions : decorate a function, like subfunction in MATLAB
# Check out this page: https://www.runoob.com/w3cnote/python-func-decorators.html
### quoting functions : 



#####                 ------------ Quoting Functions ----------             #####
# use1: 


#####                 ------------ 
Functions ----------             #####
# 



#####                 ------------ Select Columns -----------               #####

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

#####                 ------------ Column Names -----------             #####
# use1: data %>% select(colname1, colname2, colname3 = new_colname3) %>% glimpse() 
# rename the column within select function

# use2: data %>% rename(colname1 = new1, colname2=new2, colname3 = new_colname3) %>% glimpse() 
# rename the column within rename function without selection 

# use3: data %>% select_all(~str_replace(., " ", "_"))
# replace the "dot" in all column names from white space to _

# use4: data %>% tibble::rownames_to_column("colname") %>% head 
# to turn a rowname into a specific column

#####                 ------------ Column Transformation -----------             #####

### use MUTATE function in dplyr package ###
## Mutate: to make a change of the original data frame; 

# use1: data %>% select(colname1,colname2) %>% mutate(colname3 = colname1 - 20) 
# Note: can add new columns from basic operations, such as "max","min","sum","avg","round"

# use2: data %>% select(colname1,contains("key")) %>% rowwise() %>% mutate(avg = mean(c(col1,col2)))
# Note: can add new columns based on rowwise operation rowwise()
# to calculate the mean of two vectors we need to use c(vec1,vec2)
# use contain() to select specific rows

# use3: data %>% select(colname1,colname2) %>% mutate(newcolmn = ifelse(colname1>4,NA,colname1)) %>% arrange(desc(colname1))
# Note: use ifelse to mutate part of the rows ; or use str_extract() function 
# str_extract(name,pattern = "\\w+$")

# use4: data %>% mutate_all(tolower)
# example: newdata <- data %>% msleep %>% mutate_all(~paste(.,"  /n"))
# Note: mutate all columns 
# ~str_replace_all(.,"/n","")
# 

# use5: data %>% select(col1,col3:col7) %>% mutate_if(is.numeric, round)
# use mutate_if with the first argument being a boolean array and the second argument as function
# 

# use6: data %>% mutate_at(vars(contains("sleep")),~(.*60))
# use all possible selection method and wrap it inside vars()
# 

### WORK WITH DISCRETE COLUMNS ###
## Columns that contain no-numerical values
# use7: data %>% mutate(newcol = recode_factor(oldcol, 
"keyword1" = "newkeyword1"
"keyword2" = "newkeyword2"
.default = "other"
.missing = "no data"
.ordered = TRUE )) %>% count(newcol)
# Note: .default is for the rest of the columns
# .missing is to rename NA into a category
# .ordered = TRUE is to return a factored column


# use8: data %>% select(col1,col2) %>% mutate(col3 = ifelse( col3>10, "long","short"))
# use ifelse to make two levels discrete column

# use9: data %>% select(col1,col2) %>% mutate(col2_discrete = case_when(
col2 > num1 ~ "level1",
col2 > num2 ~ "level2",
col2 > num3 ~ "level3",
TRUE ~ "level4")) %>% 
mutate(col2_discrete = factor(col2_discrete, levels = c("level1","level2","level3","level4")))
# Note: see how this can be used to refactor the column level

# use10: new_table <- old_table %>% separate("col_name", into = c("col","name",sep = "_")
# we can replace separate() with unite()




### use GATHER()/SPREAD() function in dplyr package ###
# gather() and spread()
# gather() is used to create a long table and concatenate several columns together
# spread() is used to split a long table back to wide table

# Use1: data %>% select(colname1,contains("keyword")) %>% gather(key="new_colname",value = "col2",-col3,factor_key=TRUE) 
# key - create a new column that cover the contents of the columns, use values from col2.
# value - the column that we extract values from 
# factor_key = TRUE can make the new column into an ordered column

# Use2: data %>% select(col1:col2) %>% na_if("keyword_matching")
#






#####                 ------------ Row Operations -----------             #####
## filter(dataset,condition)
## operators can be used: >, >= , < , <=, ==, != 

## Use1: data %>% select(col1,col2) %>% filter(between(col1,num1,num2))
# Note1:use between() or two logical requirements to select rows within a range
#  can also use near(col1,value1, tol = value2),will select values between value +/- 
# for example can calcaculate tol = sd() as a standard deviation

## use2: data %>% select(col1,col2,col3) %>% filter(col1 == "match_key_word")
# Note: col1 != "keyword"
# Note: name > "v" will select the rows with a name in the alphabet after the letter v
# col1 %in% c("keyword1","keyword2")
# !col1 %in% c("keyword1","keyword2","keyword3")  -> use exclamation sign "!" to deselect rows  

## use3: data %>% select(col1,col2) %>% filter()
# use str_detect(tolower(col1),pattern = "keyword")
# use grepl(pattern = "mouse", tolower())

## use4: data %>% select(col1,col2,col3) %>% filter( col1> value1, (col2 > num2 | col3 != "keyword))
# Note: filter(condition1, condition2) : get rows meet both conditions
# filter(condition1, !condition2) 
# xor() 
# !is.na(): will generate a table without empty rows 

## use5: data %>% select(col1,col2,col3) %>% filter_all(any)vars(str_detect(.,pattern = "")))  
# any_vars()
# filter_if(any_vars(is.na(.)))
# filter_at(is.character,any_vars(is.na()))

## use6: 




