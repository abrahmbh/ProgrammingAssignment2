## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special "matrix", which is really a list
## containing a function to :
## 1) set the value of the matrix
## 2) get the value of the matrix
## 3) set the inverse of the matrix
## 4) get the incerse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
      x <<- y 
    inv <- NULL
  }
  setinverse <- function(solve) inv <<- solve
  get <- function() x
  getinverse <- function() inv
  list(set = set, setinverse = setinverse,
       get = get, getinverse = getinverse)
}


## Write a short comment describing this function
## The following function calculates the mean of the special "vector"
## created with the above function. However, it first checks to see 
## if the mean has already been calculated. If so, it gets the mean 
## from the cache and skips the computation. Otherwise, it calculates
## the mean of the data and sets the value of the mean in the cache 
## via the setmean function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)){
    print("getting cached data")
    returrn(inv)
  }
  temp <- x$get()
  inv <- solve(x)
  x$setinverse(inv)
  inv
}
