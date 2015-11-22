## Put comments here that give an overall description of what your
## functions do


#These two functioins are wrote by Hoda Sabeti for Programming 
#Assigment 2 in R programming course in Coursera. 
# In this assigment we learnt about <<- , which can assign a value to some other enviroment . 
# In these two function, we save a useful value of a matrix ,the inverse of it, in some other 
# enviroment using <<- . We can save the time of calculating the inverse of matrix each time it 
# is calles.



## Write a short comment describing this function
# First function, get a matrix as an input and gives a list as an output. In this list there are
# four items(functions):
# The First item of the output list,Set, is the funtion of assigning the value of input matrix
# into cache and make the inverse of it equal to null. because this is a new matrix and we do not
# have an invese for it.
# The second item in the output list , Get, is a function which return the input matrix. 
# The 3rd item is setInvesre which is a function that save the inverse of the given matrix into chache. 
# It does not calculate the inverse. this function just save the input of it,inverse, into a cache
# Finally the last Item of the output list returns the inverse from cache.
makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) s <<- inverse
        getInverse <- function() s
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## Write a short comment describing this function
# This function input is the output of above function. This function return 
# the invesre using the getInverse function defined in previous function. 
# If this value is not null and has been saved in cache using the above function, 
# then cacheSolve, will print it with message indicating that it was retrived from cache.
# if the inverse valu is null, then cacheSolve will get the values of the matrix and calculate
# the inverse and save it chache and also return it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s <- x$getInverse()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data,...)
        x$setInverse(s)
        s
}
