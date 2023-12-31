##########################################################
# Care & Wellbeing Portfolio
# Original author(s): Jennifer Evans
# Original date: 2022-12-21
# Written/run on RStudio server 1.1.463 and R 3.6.1
# Description of content
##########################################################

##############################################.
# LOAD SET-UP ----
##############################################

source(file.path("modules/plot_info/plot_info_ui.R"), local = TRUE)$value
source(file.path("modules/alt_text/alt_text_ui.R"), local = TRUE)$value
source(file.path("modules/data_download/data_download_ui.R"), local = TRUE)$value
source(file.path("modules/summary_boxes/summary_boxes_ui.R"), local = TRUE)$value
source(file.path("modules/defintions/defintions_ui.R"), local = TRUE)$value

source("setup.R")

# UI
ui <- fluidPage(
  tagList(
    # Specify most recent fontawesome library - change version as needed
    tags$style("@import url(https://use.fontawesome.com/releases/v6.1.2/css/all.css);"),
    navbarPage(
      position = "fixed-top",
      collapsible = "true",
      id = "intabset", # id used for jumping between tabs
      title = div(
        tags$a(img(src = "phs-logo.png", height = 40,
                   alt ="Go to Public Health Scotland (external site)"),
               href = "https://www.publichealthscotland.scot/",
               target = "_blank"), # PHS logo links to PHS website
        style = "position: relative; top: -10px;"),

      windowTitle = "Care & Wellbeing Dashboard",# Title for browser tab
      header = source(file.path("header.R"), local=TRUE)$value,

      ##############################################.
      # HOME ----
      ##############################################.
      tabPanel(title = tags$b("Home"),
               #icon = icon_no_warning_fn("house"),
               value = "home",

               source(file.path("indicators/home/UI_home.R"), local = TRUE)$value

      ), # tabpanel

      ##############################################.
      # SUMMARY V2 ----
      ##############################################.
      tabPanel(title = tags$b("At a glance"),
               value = "summary",

               source(file.path("indicators/summary/UI_summary.R"), local = TRUE)$value

      ), # tabpanel

      ##############################################.
      # CARE AND WELLBEING ----
      ##############################################.

      navbarMenu(title = tags$b("Care and Wellbeing"), #icon = icon_no_warning_fn("spa"),

                 tabPanel(title = "Give every child the best start in life",
                          value = "child_start",
                          source(file.path("indicators/care_and_wellbeing/child_start/UI_child_start.R"), local = TRUE)$value),

                 tabPanel(title = "Enable all children, young people and adults to maximise their capabilities and control their lives",
                          value = "control_lives",
                          source(file.path("indicators/care_and_wellbeing/control_lives/UI_control_lives.R"), local = TRUE)$value),

                 tabPanel(title = "Create fair employment and good work for all",
                          value = "fair_work",
                          source(file.path("indicators/care_and_wellbeing/fair_work/UI_fair_work.R"), local = TRUE)$value),

                 tabPanel(title = "Strengthen the role and impact of ill health prevention",
                          value = "strengthen_prevention",
                          source(file.path("indicators/care_and_wellbeing/strengthen_prevention/UI_strengthen_prevention.R"), local = TRUE)$value),

                 tabPanel(title = "Ensure a healthy standard of living for all (to be developed)",
                          value = "healthy_standard",
                          source(file.path("indicators/care_and_wellbeing/healthy_standard/UI_healthy_standard.R"), local = TRUE)$value),

                 tabPanel(title = "Create and develop healthy and sustainable places and communities (to be developed)",
                          value = "sustainable_communities",
                          source(file.path("indicators/care_and_wellbeing/sustainable_communities/UI_sustainable_communities.R"), local = TRUE)$value),

                 tabPanel(title = "Tackling discrimination, racism and their outcomes (to be developed)",
                          value = "discrimination_racism",
                          source(file.path("indicators/care_and_wellbeing/discrimination_racism/UI_discrimination_racism.R"), local = TRUE)$value),

                 tabPanel(title = "Pursuing environmental sustainability and health equity together (to be developed)",
                          value = "environmental_sustainability",
                          source(file.path("indicators/care_and_wellbeing/environmental_sustainability/UI_environmental_sustainability.R"), local = TRUE)$value)

      ), # navbarMenu


      ##############################################.
      # INFORMATION AND NOTES ----
      ##############################################.
      # tabPanel(title = "Information and Notes",
      #          #icon = icon_no_warning_fn("lemon"),
      #          value = "info_notes",
      #
      #          source(file.path("indicators/info_notes/UI_info_notes.R"), local = TRUE)$value
      #
      # ) # tabpanel
    ) # navbar
  ) # taglist
) # ui fluidpage

# ----------------------------------------------
# Server

server <- function(input, output, session) {

  if(password_protect){
    source(file.path("password_protect/password_protect_server.R"), local = TRUE)$value
  }


  #### Get functions ----
  # source(file.path("functions/core_functions.R"), local = TRUE)$value
  # source(file.path("functions/generic_charts.R"), local = TRUE)$value

  #Covid recovery functions
  # source(file.path("indicators/covid_recovery/wellbeing/functions_wellbeing.R"), local = TRUE)$value
  # source(file.path("indicators/covid_recovery/financial_security/functions_financial_security.R"), local = TRUE)$value
  # source(file.path("indicators/covid_recovery/good_green/functions_good_green.R"), local = TRUE)$value

  #Care and wellbeing functions
  source(file.path("indicators/care_and_wellbeing/strengthen_prevention/functions_strengthen_prevention.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/child_start/functions_child_start.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/control_lives/functions_control_lives.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/fair_work/functions_fair_work.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/healthy_standard/functions_healthy_standard.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/sustainable_communities/functions_sustainable_communities.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/discrimination_racism/functions_discrimination_racism.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/environmental_sustainability/functions_environmental_sustainability.R"), local = TRUE)$value

  #Pages functions
  source(file.path("indicators/home/functions_home.R"), local = TRUE)$value
  source(file.path("indicators/info_notes/functions_info_notes.R"), local = TRUE)$value


  #Navigation buttons
  source(file.path("functions/navigation_buttons.R"), local = TRUE)$value

  #Modals
  source(file.path("modules/alt_text/alt_text_server.R"), local = TRUE)$value
  source(file.path("modules/plot_info/plot_info_server.R"), local = TRUE)$value
  source(file.path("modules/data_download/data_download_server.R"), local = TRUE)$value
  source(file.path("modules/summary_boxes/summary_boxes_server.R"), local = TRUE)$value

  ####Get servers ----

  # Get content for pages
  source(file.path("indicators/home/server_home.R"), local = TRUE)$value
  source(file.path("indicators/summary/server_summary.R"), local = TRUE)$value
  source(file.path("indicators/summary/server_summary_CR.R"), local = TRUE)$value
  source(file.path("indicators/summary/server_summary_CW.R"), local = TRUE)$value
  source(file.path("indicators/info_notes/server_info_notes.R"), local = TRUE)$value

  # Get content for Care and Wellbeing pages
  source(file.path("indicators/care_and_wellbeing/strengthen_prevention/server_strengthen_prevention.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/child_start/server_child_start.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/control_lives/server_control_lives.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/fair_work/server_fair_work.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/healthy_standard/server_healthy_standard.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/sustainable_communities/server_sustainable_communities.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/discrimination_racism/server_discrimination_racism.R"), local = TRUE)$value
  source(file.path("indicators/care_and_wellbeing/environmental_sustainability/server_environmental_sustainability.R"), local = TRUE)$value

  # Get content for info pages
  # source(file.path("indicators/care_and_wellbeing/strengthen_prevention/info_strengthen_prevention.R"), local = TRUE)$value
  # source(file.path("indicators/care_and_wellbeing/child_start/info_child_start.R"), local = TRUE)$value
  # source(file.path("indicators/care_and_wellbeing/control_lives/info_control_lives.R"), local = TRUE)$value
  # source(file.path("indicators/care_and_wellbeing/fair_work/info_fair_work.R"), local = TRUE)$value
  # source(file.path("indicators/care_and_wellbeing/healthy_standard/info_healthy_standard.R"), local = TRUE)$value
  # source(file.path("indicators/care_and_wellbeing/sustainable_communities/info_sustainable_communities.R"), local = TRUE)$value
  # source(file.path("indicators/care_and_wellbeing/discrimination_racism/info_discrimination_racism.R"), local = TRUE)$value
  # source(file.path("indicators/care_and_wellbeing/environmental_sustainability/info_environmental_sustainability.R"), local = TRUE)$value


}

#sets language right at the top of source (required this way for screen readers)
attr(ui, "lang") = "en"

#conditionally password protect app
if (password_protect){ ui <- secure_app(ui) }

# Run the application
shinyApp(ui=ui, server=server)

### END OF SCRIPT ###
