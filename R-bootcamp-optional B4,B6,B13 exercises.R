#B4,B6, B13


#B4 Functions
#functions are commands that do things, they have names, arguements and values, ex below
help(mean)
#on help page, shows the arguements, first object=x, (object to calc mean for), second arg is trim=0 (fraction of observations to trim from each end of x) note that as it is already 0 this is default, meaning below are equivalent
mean(1:4)
mean(1:4,trim=0)
#R is "object oriented language" so same function name do different things on different classes of object 
class(1:10)
class(warpbreaks)
summary(1:10)
summary(warpbreaks)
#for warpbreaks data frame, summary give six number summary for each numeric integer column but gives "tables" of the factors-i.e. count occurrences of each level of a factor and sorts levels. Summary or linear model gets output of regression
summary(lm(breaks ~ wool, data =warpbreaks))
#B.4.1 writing own functions
#making own function to calculate mean but tilt it as described
MyBogusMean<-function(x, cheat=0.05) {
  SumOfX<-sum(x)
  n<-length(x)
  trueMean<-SumOfX/n
  (1+cheat)*trueMean
}
RealSales<-c(100,200,300)
MyBogusMean(RealSales)
#function can take any input and do things, x and cheat are the arguements for the function
#we supplied arguement for cheat, this means that cheat has a default value, and don't need to supply it, if arguement not have default will have to supply it. Even if have one can change it ex below
MyBogusMean(RealSales, cheat = 0.1)


#B.6 Iterated Actions: the apply Family and Loops
#want to perform action many times, some cases is independent, for this we have many options
#if want action depend on previous action, then guide suggests for-loops
#B.6.1 Iterations of independent actions
#ex: have matrix want to do same thing to each row/column, use "apply", to apply function to each column/row
#tell "apply" what data to use, tell it the "margin" to focus on, tell it the function, "margin" is side of the matrix, matrices described by #rows then columns, so rows are first margin, columns are second margin
m<-matrix(1:10, nrow=2)
m
apply(m, MARGIN =1, mean)
apply(m, MARGIN = 2, sum)
#see ?rowMeans for simple/faster operations
#lapply will "apply" a function to each list element or column of dataframe, and return a list. "saplly" is sim, but simplifies result to less complex data structure
sapply(1:10, function(i) mean(rnorm(5)))
#i in function for independent? 
#6.2 Dependent iterations
#use "for loops" for repeated actions dependent on previous outcomes
#for R for loops, computation is fastest if make holder for the output
#simulating random walk, start with 25 individuals, increase/decrease by some amount drawn randomly form normal distribution (mean 0, standard deviation 2) round "amount" to nearest integer (i.e. 0th decimal place)
#output differs due to random process
gens<-10
#defining gens allows us to change this for function
output<-numeric(gens+1)
output[1]<-25
#assigning output to begin with and running through as t goes?
for (t in 1:gens) output[t+1]<-output[t] +round(rnorm(n=1, mean=0, sd=2), 0)
output
