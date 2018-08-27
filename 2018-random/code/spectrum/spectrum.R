spectrum <- function(seed = 1, p = 65537, a = 75) {
		prev <- seed
		function() {
			prev <<- ((a*(prev+1)-1)%%p)
			prev
		}
}

s <- spectrum(1)
cat(replicate(65536, s()), sep = "\n")
			
