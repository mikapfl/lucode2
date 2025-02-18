#' piamPackages
#'
#' Fetches the names of packages available on https://pik-piam.r-universe.dev/ui#builds
#'
#' @return A character vector of names of packages available on https://pik-piam.r-universe.dev/ui#builds
#'
#' @export
piamPackages <- function() {
  packagesUrl <- "https://pik-piam.r-universe.dev/src/contrib/PACKAGES"
  return(tryCatch({
    sort(sub("^Package: ", "", grep("^Package: ", readLines(packagesUrl), value = TRUE)))
  }, warning = function(w) piamPackagesStatic))
}

# this runs only when building the package
tryCatch({
  piamPackagesStatic <- piamPackages()
}, error = function(e) stop("https://pik-piam.r-universe.dev/src/contrib/PACKAGES not reachable"))
