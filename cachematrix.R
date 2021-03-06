#Caching the Inverse of a Matrix


#Creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  
  setinv <- function(solve) inv <<- solve
  
  getinv <- function() inv
  
  
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


# Computes the inverse of the special "matrix" returned by `makeCacheMatrix` above. 
# If the inverse has already been calculated (and the matrix has not changed), then
# `cacheSolve` will retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  
  if(!is.null(inv)) {
    message("Getting cached data")
    return(inv)
  }
  
  data <- x$get()
  
  inv <- solve(data, ...)
  
  x$setinv(inv)
  
  inv
}
