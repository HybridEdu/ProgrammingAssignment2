## Make cached matrix and solve(get inverse of) the matrix

## make cached matrix containing cached inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinv <- function(inv_) inv <<- inv_
	getinv <- function() inv
	
	list(set = set, get = get,
		 setinv = setinv,
		 getinv = getinv)
}


## get inverse of matrix

cacheSolve <- function(x, ...) {
	inv <- m$getinv()
	if( !is.null(inv) ) {
		message("getting cached data")
		return(inv)
	}
	data <- m$get()
	inv <- solve(data, ...)
	m$setinv(inv)
	inv
}