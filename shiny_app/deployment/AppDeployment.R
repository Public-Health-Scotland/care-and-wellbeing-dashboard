########################################
#Deploying app

# Source this file to deploy the app
# Set this to TRUE to deploy for development (password protected)
# Set this to FALSE to deploy to the public app
development <- TRUE

# Get deployment functions
source("shiny_app/deployment/DeploymentFunctions.R")

# Get secrets for deployment
# NB: you must set this file up using information from colleagues
source("shiny_app/deployment/DeploymentSecrets.R")

# This deploys the app
deploy(app_loc, development = development)

# Check logs of deployed app
check_logs(app_loc, development = development)


#######################################
