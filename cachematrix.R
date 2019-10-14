## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
       										 ## Return a matrix that is the inverse of 'x'
invM <- NULL                         				                 ## initialize invM as NULL; will hold value of inverse matrix 
    set <- function(y) {               				     
        x <<- y                           	
        invM <<- NULL                        				         ## if there is a new matrix, reset invM to NULL
    }
    get <- function() x                     				        ## define the get fucntion - returns value of the matrix argument

    setinverse <- function(inverse) invM <<- inverse 					         ## assigns value of inv in parent environment
    getinverse <- function() invM                     						## gets the value of inv where called
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)		  ## we need this in order to refer 
                                                                                 		 ## to the functions with the $ operator
}

## This function calculates the inverse of the "matrix" returned by makeCacheMatrix above.
## If the inverse matrix has already been calculated (and the matrix has not changed),
## then cacheSolve will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {										 ## Return a matrix that is the inverse of 'x'
    invM <- x$getinverse()
    if(!is.null(invM)) {
        message("getting cached data")
        return(invM)
    }
    data <- x$get()
    invM <- solve(data, ...)
    x$setinverse(invM)
    invM
}
