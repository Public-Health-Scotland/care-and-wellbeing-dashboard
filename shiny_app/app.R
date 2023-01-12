##########################################################
# Covid_Recovery_Dashboard_JE
# Original author(s): Jennifer Evans
# Original date: 2022-12-21
# Written/run on RStudio server 1.1.463 and R 3.6.1
# Description of content
##########################################################

##############################################.
# LOAD SET-UP ----
##############################################.


source("setup.R")

# UI
ui <- shinymanager::secure_app(
fluidPage(
tagList(
# Specify most recent fontawesome library - change version as needed
tags$style("@import url(https://use.fontawesome.com/releases/v6.1.2/css/all.css);"),
navbarPage(
    id = "intabset", # id used for jumping between tabs
    title = div(
        tags$a(img(src = "phs-logo.png", height = 40),
               href = "https://www.publichealthscotland.scot/",
               target = "_blank"), # PHS logo links to PHS website
    style = "position: relative; top: -5px;"),
    windowTitle = "Covid_Recovery_Dashboard_JE",# Title for browser tab
    header = tags$head(includeCSS("www/styles.css"),  # CSS stylesheet
    tags$link(rel = "shortcut icon", href = "favicon_phs.ico") # Icon for browser tab
),

##############################################.
# HOME ----
##############################################.
tabPanel(title = "Home",
    icon = icon_no_warning_fn("lemon"),
    value = "home",

    source(file.path("indicators/home/UI_home.R"), local = TRUE)$value

), # tabpanel

##############################################.
# SUMMARY ----
##############################################.
tabPanel(title = "Summary",
         icon = icon_no_warning_fn("lemon"),
         value = "summary",

         source(file.path("indicators/summary/UI_summary.R"), local = TRUE)$value

), # tabpanel

##############################################.
# COVID RECOVERY ----
##############################################.
navbarMenu("Covid Recovery", icon = icon_no_warning_fn("lemon"),


           tabPanel(title = "Wellbeing of children and young people",
                    icon = icon_no_warning_fn("lemon"),
                    value = "wellbeing",
                    source(file.path("indicators/covid_recovery/wellbeing/UI_wellbeing.R"), local = TRUE)$value),

           tabPanel(title = "Financial security for low income households",
                    icon = icon_no_warning_fn("lemon"),
                    value = "financial_security",
                    source(file.path("indicators/covid_recovery/financial_security/UI_financial_security.R"), local = TRUE)$value),

           tabPanel(title = "Good, green jobs and fair work",
                    icon = icon_no_warning_fn("lemon"),
                    value = "good_green",
                    source(file.path("indicators/covid_recovery/good_green/UI_good_green.R"), local = TRUE)$value)


), # navbarMenu

##############################################.
# CARE AND WELLBEING ----
##############################################.

navbarMenu(title = "Care and Wellbeing", icon = icon_no_warning_fn("lemon"),


           tabPanel(title = "Adult risk of health",
                    icon = icon_no_warning_fn("lemon"),
                    value = "adult_risk",
                    source(file.path("indicators/care_and_wellbeing/adult_risk/UI_adult_risk.R"), local = TRUE)$value),


           tabPanel(title = "Giving every child the best start in life",
                    icon = icon_no_warning_fn("lemon"),
                    value = "child_start",
                    source(file.path("indicators/care_and_wellbeing/child_start/UI_child_start.R"), local = TRUE)$value),

           tabPanel(title = "Hospital admissions",
                    icon = icon_no_warning_fn("lemon"),
                    value = "hospital_admissions",
                    source(file.path("indicators/care_and_wellbeing/hospital_admissions/UI_hospital_admissions.R"), local = TRUE)$value),

           tabPanel(title = "Mortality",
                    icon = icon_no_warning_fn("lemon"),
                    value = "mortality",
                    source(file.path("indicators/care_and_wellbeing/mortality/UI_mortality.R"), local = TRUE)$value),

           tabPanel(title = "Social Carers Survey",
                    icon = icon_no_warning_fn("lemon"),
                    value = "carers_survey",
                    source(file.path("indicators/care_and_wellbeing/carers_survey/UI_carers_survey.R"), local = TRUE)$value)

), # navbarMenu


##############################################.
# INFORMATION AND NOTES ----
##############################################.
tabPanel(title = "Information and Notes",
    icon = icon_no_warning_fn("lemon"),
    value = "info_notes",

    source(file.path("indicators/info_notes/UI_info_notes.R"), local = TRUE)$value

    ) # tabpanel
    ) # navbar
  ) # taglist
) # ui fluidpage
) # secureapp

# ----------------------------------------------
# Server

server <- function(input, output, session) {

  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )


    # Get functions
    # source(file.path("functions/core_functions.R"), local = TRUE)$value
    # source(file.path("functions/generic_charts.R"), local = TRUE)$value
    source(file.path("indicators/covid_recovery/wellbeing/functions_wellbeing.R"), local = TRUE)$value
    source(file.path("indicators/covid_recovery/financial_security/functions_financial_security.R"), local = TRUE)$value
    source(file.path("indicators/covid_recovery/good_green/functions_good_green.R"), local = TRUE)$value
    source(file.path("indicators/care_and_wellbeing/mortality/functions_mortality.R"), local = TRUE)$value
    source(file.path("indicators/summary/functions_summary.R"), local = TRUE)$value


    #Navigation buttons
    source(file.path("functions/navigation_buttons.R"), local = TRUE)$value

    #Modals
    source(file.path("functions/modals.R"), local = TRUE)$value

    # Get content for pages
    source(file.path("indicators/home/server_home.R"), local = TRUE)$value
    source(file.path("indicators/summary/server_summary.R"), local = TRUE)$value
    source(file.path("indicators/info_notes/server_info_notes.R"), local = TRUE)$value

    # Get content for Covid Recovery pages
    source(file.path("indicators/covid_recovery/wellbeing/server_wellbeing.R"), local = TRUE)$value
    source(file.path("indicators/covid_recovery/financial_security/server_financial_security.R"), local = TRUE)$value
    source(file.path("indicators/covid_recovery/good_green/server_good_green.R"), local = TRUE)$value

    # Get content for Care and Wellbeing pages
    source(file.path("indicators/care_and_wellbeing/adult_risk/server_adult_risk.R"), local = TRUE)$value
    source(file.path("indicators/care_and_wellbeing/carers_survey/server_carers_survey.R"), local = TRUE)$value
    source(file.path("indicators/care_and_wellbeing/child_start/server_child_start.R"), local = TRUE)$value
    source(file.path("indicators/care_and_wellbeing/hospital_admissions/server_hospital_admissions.R"), local = TRUE)$value
    source(file.path("indicators/care_and_wellbeing/mortality/server_mortality.R"), local = TRUE)$value
}

# Run the application
shinyApp(ui=ui, server=server)

### END OF SCRIPT ###
