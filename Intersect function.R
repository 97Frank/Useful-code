#these lines of code clears the environment. It is a good practice to start with these
rm(list = ls())
cat("\014")


library(dplyr)

#we define two string vectors
vector_a<-c("a","b","c","d","e","f","g","h","i","j","k","l")

vector_b<-c("a","b","c","e","g","h","i","j","k","l","x","y","z")


#we use the instersect function from dplyr
intersec<-intersect(vector_a,vector_b)

#we find the non overlapping elements in each vector and then combine them
non_overlap_a<-vector_a[! vector_a %in% intersec]
non_overlap_b<-vector_b[! vector_b %in% intersec]

non_overlap<-c(non_overlap_a,non_overlap_b)

