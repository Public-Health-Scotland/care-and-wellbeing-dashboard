

password_protect <- function(protect = TRUE){

  if(protect){
    message("Deploying development app")
  } else {
    message("No password protection on app")
  }

  saveRDS(protect, paste0(app_loc, "/data/Password_Protect.rds"))

}



## Function that deploys the app
deploy <- function(app_loc, development = TRUE){

  if(development) {
    app_name = "phs-covid19-recovery-dashboard"
    password_protect(TRUE)

  } else {
    app_name = "phs-care-and-wellbeing-dashboard"
    password_protect(FALSE)

  }

  rsconnect::deployApp(appDir = app_loc,
                       # appFiles = public_files,
                       appName = app_name,
                       account = "scotland",
                       logLevel = "verbose"
  )

}

check_logs <- function(app_loc, development = TRUE){

  if(development) {
    app_name = "phs-covid19-recovery-dashboard"

  } else {
    app_name = "phs-care-and-wellbeing-dashboard"

  }

  rsconnect::showLogs(appPath = app_loc,
                      appName = app_name,
                      account = "scotland")
}
