## 

## Constructs a matrix in an environment containg auxillary variables which cache a mean value 

makeCacheMatrix <- function(x = matrix()) {
	inverse <- NULL
	set <- function(y) {
		x <<- y
		inverse <- NULL	
	}
	get <- function() x
	setInverse <- function(set) inverse <<- set
	getInverse <- function() inverse
	list(set = set, get = get, 
		setInverse = setInverse, 
		getInverse = getInverse)
}


## Write a short comment describing this function

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
