## 

## Constructs a matrix in an environment containg auxillary variables which cache a mean value 

makeCacheMatrix <- function(x = matrix()) {
	inverse <- NULL
	set <- function(y) {
		x <<- y
		inverse <- NULL	
	}
	get <- function() x
	setinverse <- function(set) inverse <<- set
	getinverse <- function() inverse
	list(set = set, get = get, 
		setinverse = setinverse, 
		getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
