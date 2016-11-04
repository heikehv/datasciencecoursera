## These two functions will help to avoid repeating computations by
## caching already computed results.

## This function will create a matrix based on user input. 

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

## Write a short comment describing this function

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