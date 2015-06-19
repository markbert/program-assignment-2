## From the assignment instructions: This function creates a 
## special "matrix" object that can cache its inverse.
## get used to get the matrix
## setinverse stores the inversed matrix, getinverse can get the inversed matrix.
makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        get <- function() {
                x
        }
        setinverse <- function(inverse){
                m <<- inverse
        }
        getinverse <- function(){
                m
        }
        
        list(get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## This function computes the inverse of the special
##"matrix" returned by `makeCacheMatrix` above. If the inverse has
## already been calculated (and the matrix has not changed), then
##`cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        inverse<-x$getinverse() ## Getting the inverse from the matrix getinverse
        if(!is.null(inverse)) { ## no matrix no calculation
                message("getting cached data") ## improve UX
                return(inverse)
        }
        data<-x$get()
        inverse<-solve(data, ...)## now we compute it with solve
        x$setinverse(inverse)
        inverse
}
