## These two functions will help to avoid repeating computations by
## caching already computed results.

## This function will create a matrix object ready to be cached. 

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        set_inverse <- function(solve) m <<- solve
        get_inverse <- function() m
        list(set = set, get = get,
             set_inverse = set_inverse,
             get_inverse = get_inverse)
}

## This function will just create the inverse of the matrix object computed at step 1.
## If this function has already been run on a matrix and the matrix has not changed,
## the data will be retrieved from the cache and a message indicating this will be 
## displayed.

cacheSolve <- function(x, ...) {
      m <- x$get_inverse()
      if(!is.null(m)) {
            message("value already assigned and cached")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$set_inverse(m)
      m
}