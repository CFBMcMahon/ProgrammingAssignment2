## A small matrix library which caches the result of an inverse matrix solve() operation in order 
## to optimise operations.  

## Constructs a matrix in an environment containg auxillary variables which cache a mean value 

makeCacheMatrix <- function(x = matrix()) {
	inverse <- NULL
	set <- function(y) {
		x <<- y
		inverse <<- NULL	
	}
	get <- function() x
	setInverse <- function(set) inverse <<- set
	getInverse <- function() inverse
	list(set = set, get = get, 
		setInverse = setInverse, 
		getInverse = getInverse)
}


## Returns a matrix that is the inverse of 'x' and cache the result. If the inverse calculation succeeds,
## it is not repeated. This means that if the right hand 'b' is changed, or any other settings, one must
## clear the cache by using 'x$set(x$get)' before running cacheSolve again. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inverse <- x$getInverse()
	if(!is.null(inverse)) {
		message("getting cached data")
		return(inverse)
	}
	data <- x$get()
	inverse <- solve(data, ...)
	x$setInverse(inverse)
	inverse
}
