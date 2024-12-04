get_aoc <- function(day, dir = "data") {
        day <- sprintf("%02d", day)  # Ensure day is two digits
        pattern <- paste0("day_", day, ".*\\.txt$")
        
        files <- list.files(path = dir, pattern = pattern, full.names = TRUE)
        
        # Check if no matching files are found
        if (length(files) == 0) {
            message("No data for day ", day, " is saved in the directory yet.")
        }
        
        return(files)    
}
