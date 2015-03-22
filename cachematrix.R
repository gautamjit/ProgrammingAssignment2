## Assignment 2: Caching the Inverse of a Matrix

## In this R program, we can cache the inverse of a square, non-singular matrix
## by creating a matrix using the makeCacheMatrix function and then 
## calling the cacheSolve function to return the inverse.


## The makeCacheMatrix function is a list containing a function to
##   - set the value of the matrix
##   - get the value of the matrix
##   - set the value of the inverse matrix
##   - get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) i <<- inv
  getinverse <- function() i
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}


## cacheSolve function will calculate the inverse of the anonymous square matrix 
## created in the makeCacheMatrix function, assuming it is non-singulat,
## reusing cache data if it is available

cacheSolve <- function(x, ...) {   
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
}
