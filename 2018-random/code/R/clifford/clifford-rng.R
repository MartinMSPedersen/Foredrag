# http://mathworld.wolfram.com/CliffRandomNumberGenerator.html


clifford <- function(seed = 0.1, m = 100) {
		prev <- seed
		function() {
			prev <<- abs(100*log(prev)%%1)
			floor(2**16*(prev/100))
		}
}

s <- clifford()
repeat {
	cat(s(), "\n")
}

			
