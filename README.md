# R_exercises
A repo for storing R exercises code

week1 quiz

第 11 个问题
Use the Week 1 Quiz Data Set to answer questions 11-20.

In the dataset provided for this Quiz, what are the column names of the dataset?


Ozone, Solar.R, Wind, Temp, Month, Day

正确 
You can get the column names of a data frame with the `names()' function.


Month, Day, Temp, Wind


1, 2, 3, 4, 5, 6


Ozone, Solar.R, Wind

第 12 个问题
正确
1/1 分
12. 第 12 个问题
Extract the first 2 rows of the data frame and print them to the console. What does the output look like?







正确 
You can extract the first two rows using the [ operator and an integer sequence to index the rows.







第 13 个问题
正确
1/1 分
13. 第 13 个问题
How many observations (i.e. rows) are in this data frame?


129


153

正确 
You can use the `nrows()' function to compute the number of rows in a data frame.


160


45

第 14 个问题
正确
1/1 分
14. 第 14 个问题
Extract the last 2 rows of the data frame and print them to the console. What does the output look like?




正确 
The `tail()' function is an easy way to extract the last few elements of an R object.










第 15 个问题
正确
1/1 分
15. 第 15 个问题
What is the value of Ozone in the 47th row?


63


34


21

正确 
The single bracket [ operator can be used to extract individual rows of a data frame.


18

第 16 个问题
正确
1/1 分
16. 第 16 个问题
How many missing values are in the Ozone column of this data frame?


43


37

正确 
The `is.na' function can be used to test for missing values.


9


78

第 17 个问题
正确
1/1 分
17. 第 17 个问题
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.


18.0


42.1

正确 
The `mean' function can be used to calculate the mean.


53.2


31.5

第 18 个问题
正确
1/1 分
18. 第 18 个问题
Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?


334.0


212.8

正确 
You need to construct a logical vector in R to match the question's requirements. Then use that logical vector to subset the data frame.


185.9


205.0

第 19 个问题
正确
1/1 分
19. 第 19 个问题
What is the mean of "Temp" when "Month" is equal to 6?


75.3


90.2


79.1

正确 

85.6

第 20 个问题
正确
1/1 分
20. 第 20 个问题
What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?


115

正确 

18


97


100
