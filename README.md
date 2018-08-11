# R_exercises
A repo for storing R exercises code

week1 quiz

返回
Week 1 Quiz

第 10 个问题
错误
0/1 分
10. 第 10 个问题
Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this? Select all that apply.


x[x != 6] <- 0

未选择的是正确的 

x[x == 0] <- 6

未选择的是正确的 

x[x < 6] <- 0

正确 
You can create a logical vector with the expression x < 6 and then use the [ operator to subset the original vector x.


x[x >= 6] <- 0

未选择的是正确的 

x[x > 6] <- 0

未选择的是正确的 

x[x < 6] == 0

未选择的是正确的 

x[x > 0] <- 6

未选择的是正确的 

x[x %in% 1:5] <- 0

这应该被选择 

x[x == 6] <- 0

未选择的是正确的 

x[x <= 5] <- 0

这应该被选择 

x[x == 0] < 6

未选择的是正确的 

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



