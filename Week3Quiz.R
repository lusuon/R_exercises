#There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? Please round your answer to the nearest whole number.

print('The answer of No.1:')
round(tapply(iris$Sepal.Length, iris$Species, mean,na.rm = TRUE))


#What R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

print('The answer of No.2:')
apply(iris[, 1:4], 2, mean)


#How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.

print('The answer of No.3:')

tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)


#What is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?


print('The answer of No.4:')
#Version_1
classified_by_cyl<-split(mtcars,mtcars$cyl)

cyl_4_hp<-classified_by_cyl$`4`$hp
cyl_8_hp<-classified_by_cyl$`8`$hp

temp=(mapply(mean,list(cyl_4_hp,cyl_8_hp),MoreArgs = list(na.rm = TRUE)))#Should not use C(cyl_4_hp,cyl_8_hp) as the input
print(round(abs(temp[1]-temp[2])))

#Version_2_recommend
new <- tapply(mtcars$hp, mtcars$cyl, mean)
round(abs(new[3]-new[1]))