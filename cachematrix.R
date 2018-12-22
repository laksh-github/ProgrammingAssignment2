## the following functions create a special object that stores the matrix and cache's the inverse of the matrix 

## makeCacheMatrix() creates a special matrix with a list of get and set methods

makeCacheMatrix <- function(x = matrix()) {
y <- matrix()
i <- matrix()
set <- function(y) {
    x <<- y
    i <<- NULL
}
get <- function() x 
setinverse <- function(solve) { 
     i <<- solve
}

getinverse <- function() i
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## cacheSolve() calculates the inverse of the matrix from the above function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
                }
        data_i <- x$get()
        i <- solve(data_i, ...)
        x$setinverse(i)
}
