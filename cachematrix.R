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


## get iverse of matrix if cached exists or solve(calculate) inverse of matrix

cacheSolve <- function(x, ...) {
	inv <- x$getinv()
	if( !is.null(inv) ) {
		message("getting cached data")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data, ...)
	x$setinv(inv)
	inv
}