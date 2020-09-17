# https://github.com/csgillespie/dotfiles
if (requireNamespace("rprofile", quietly = TRUE)) {
  rprofile::set_repos(
    CRAN       = "https://packagemanager.rstudio.com/all/__linux__/focal/latest",
    jrpublic   = "https://rstudio.jumpingrivers.cloud/package-manager/jumpingrivers/latest",
    jrpackages = "https://jr-packages.github.io/drat/"
  )
  rprofile::set_startup_options(browser = "google-chrome")
}

if (interactive() && requireNamespace("rprofile", quietly = TRUE)) {
  rprofile::create_make_functions()
  # Not RStudio OR RStudio console
  if (rprofile::is_terminal()) {
    rprofile::set_terminal()
  } else {
    rprofile::set_rstudio()
  }
  .env = rprofile::set_functions()
  attach(.env)
  rprofile::set_startup_info()
}

if (file.exists("/data/ncsg3/rstudio/bin/pandoc")) {
  Sys.setenv(RSTUDIO_PANDOC = "/data/ncsg3/rstudio/bin/pandoc")
} else {
  Sys.setenv(RSTUDIO_PANDOC = "/usr/lib/rstudio/bin/pandoc")
}

if (interactive() && requireNamespace("startup", quietly = TRUE)) {
  try(startup::startup())
}
