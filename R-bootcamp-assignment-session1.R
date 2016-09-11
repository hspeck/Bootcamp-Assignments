#Appendix B 341-352 minus simple matrix algerbra 

#B.1 Help
#this is the example text "this will calculate the mean of 10 random standard normal variables
mean(rnorm(10))
#submit from the script direcly to the console by selecting the line and hitting Ctrl-r
#access help for specific functions with `?`(mean)
#the sign ` is from the button near the line of numbers
`?`(mean)
#the command "help(mean)" also works
help(mean)
#if you don't know the exact name of the R function you want help with, you can try help.search("mean") and the next line is apropos(mean)
#these provide lists of places you can look for functions related to this keyword
help.search("mean")
apropos("mean")
#for packages of R online, help for functions not yet downloaded retrieved with RSiteSearch("violin") and RSiteSearch("violin", restrict = c("functions"))
RSiteSearch("violin")
#opens web page seaching violin
RSiteSearch("violin", restrict = c("function"))
help(RSiteSearch)
#c("functions") restricts the search for help views


#B.2 Assignment
#assign results of action to new object, use arrow aka "<-" to do so
# to reveal contents of the object, enter name of object
#perform two actions on one line by separating them with semicolon aka ";"
a<- 2+3
a
b<- a+a
b
a+a; a+b
#semicolon sometimes refered to as an "end of line" operator


#B.3 Data Structures
#single real number is a scalar, more complex objects exist in R
#B.3.1 Vectors
#vector critical to R, most operations in R on vectors, vector is column of scalars
#to enter data into R use "c()" an create an R object (vector in this case)
Y<-c(8.3, 8.6, 10.7, 10.8, 11, 11, 11.1, 11.2, 11.3, 11.4)
#could also use
Y=c(8.3, 8.6, 10.7, 10.8, 11, 11, 11.1, 11.2, 11.3, 11.4)
#R operates on objects, objects can be vectors, matrices, lists or other type of object
#using the ":" sign between two integers gives a list of the integers between them
1:4
4:1
-1:3
-(1:3)
#note for the above, order of operations seems to apply aka it goes"list 1:3" then "multiply everything in parenthesis by -1"
seq(from=1, to = 3, by = 0.2)
#Note: don't forget equal signs between signifiers and numbers, abov gives numbers in sequence and everything between by specied interval
seq(1,3, by =0.2)
#same as above
seq(1,3, length=7)
#Above gives sequence with set number of points along it, includes the bounds
#repetive sequences with the "rep" command
rep(1,3)
#above gives 1 three times in a row
rep(1:3, 2)
#above gives 1-3 twice, aka  1 2 3 1 2 3
rep(1:3, each = 2)
#above gives each number from 1-3 repeated twice aka 1 1 2 2 3 3
#B.3.2 Getting Info about Vectors
sum(Y)
mean(Y)
max(Y)
length(Y)
summary(Y)
#summary includes min, max, 1st/3rdQuartile, Median, Mean
#vectors can be a character or logical/boolean thing
Names<-c("Sarah", "Yunluan")
b<-c(TRUE, FALSE)
#use "class()" to determine type of class of data it belongs to, displayed on top right in R studion for values you've assigned
class(Y)
class(b)
#can test if each element of vector is greater than a particular value using ">"
#when testing object, will get back a logical vector with appropriate response for each value
Y>10
Y>mean(Y)
# test with, <, >, >=, <=, ==, != and other conditions
#== tests if vector equal to a number
Y==11
#!= tests of "not equal to"
Y!=11
#Algerbra with vectors
#when adding/multiplying vectors actually operaing on elements of the vectors
a<-1:3
b<-4:6
a+b
#mulitplication acts on each pair of vector
a*b
a/b
#scalars operate on vectors
a+1
#adds one to each element
a*2
#mutiplies each element by two
1/a
#R recycles the scalar as many times as needed in order to match the length of the vector
#Note: if try to multiply vectors of unequal length, R perform operation but may not give warning
#should warn if multiply 3 by 2 vectors ex below
a * 1:2
#gives the warningWarning message: "In a * 1:2 :   longer object length is not a multiple of shorter object length"
#R suppossedly recycles the shorter vector enough to match the length of longer vector, supposedly same as 
a*c(1,2,1)
#if multiply vectors with length that is multiple of other, get no error, ex 4 and 2
1:4*1:2
#worked fine
#above same as below
1:4*c(1,2,1,2)
#B.3.3 Extraction and Missing Values
#two ways to extract
#1-id which row/column wanted
Y[1]
Y[1:3]
#2-provide logical vector (e.g. of TRUE's and FALSE's) of same length of vector you want to subset
Y>mean(Y)
#above line is just reminder, not necessary)
Y[Y>mean(Y)]
#extracts all values in Y for which the statement "value>mean(Y)" is TRUE
#missing data is of type "NA" aka "not available", R won't let you calc mean of a vector with missing data ordinarily,
#can deal with elements missing with special function is.na
a<-c(5,3,6,NA)
a
is.na(a)
#gives back logic vector to the question "is the value=NA?"
!is.na(a)
#gives back logic vector to the question "is the value not=NA?"
#can use these functions to call up only non-NA data like so
a[!is.na(a)]
#same with belwo
na.exclude(a)
#more example
mean(a)
mean(a, na.rm=TRUE)
d<-na.exclude(a)
mean(d)
#B.3.4 Matrices
#2-d set of elements, all elements of same type
#character matrix
matrix(letters[1:4], ncol = 2)
#letters 1:4 gives a b c d, ncol gives number of columns
#numeric matrix
M<-matrix(1:4, nrow =2)
M
#Note:matrix filled by columns in column major order, can also do my row
M2<-matrix(1:4, nrow =2, byrow=TRUE)
M2
#matrix with 1's on diagonal
I<-diag(1, nrow=2)
I
#Note, the column and rows are labeled with an integer and comma, likely specifies order aka 1, and ,1 intersect at 1,1
#Identity matrix important in matrix algerbra, equiv to scalar 1
#inverse of matrix M is matrix such that can mult with M and equal I (I has 1's along diagonal, 0's elsewhere)
Minv<-solve(M)
M %*% Minv
#QR decomposition available (e.g. qr.solve())
qr.solve(M)
help(qr.solve)
#extraction in matrices, same as in vectors, but specify both rows and columns
M[1,2]
M[1,1:2]
#if leave either row/column blank, R extract all row/columns
M[,2]
M[, ]
#skipping simple matrix algerbra
#B.3.5 Data frames
#data frames are 2-d, sim to spreadsheet/matrices.  All columns have same #rows
#unlike matrix, each column can be different data type
dat<-data.frame(species =c("S. altissima", "S. rugosa", "E. graminifolia", "A. pilosus"), treatment=factor(c("Control", "Water", "Control", "Water")),height=c(1.1, 0.8, 0.9, 1), width=c(1, 1.7, 0.6, 0.2))
dat
#so eac vector in the "data.frame()" is a column, with the vector name as the header
#extract data like in matrices
dat[2,]
#above brings out the the column header too
dat[3,4]
#can test elements in dataframes, below tests if each element in column 2 is "Water", can extract rows associated with this criterion
dat[,2]=="Water"
dat[dat[,2]=="Water",]
#can use subset function
subset(dat,treatment=="Water")
