## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## creates methods for setting a matrix, retrieving the matrix,
## setting an inverse, retrieving an inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function( matrix ) { 
    x <<- matrix 
    i <<- NULL
  }
  get <- function() x
  setinverse <- function( inverse ) { i <<- inverse }
  getinverse <- function() i
  list( set = set, get = get, setinverse = setinverse, getinverse = getinverse )
}


## Write a short comment describing this function
## tries to retrieve a cached inverse
## if does not exist, computes the inverse and caches it
## returns the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) { 
    message("getting cached inverse")
  }
  else
  {
    matrix <- x$get()
    inv <- solve(matrix)
    x$setinverse( inv )
  }
  
  return( inv )
}
