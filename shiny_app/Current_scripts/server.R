##############################################.
# SERVER ----
##############################################.

credentials <- readRDS("admin/credentials.rds")

function(input, output, session) {

  ##############################################.
  # SHINY MANAGER AUTHORISATION
  ##############################################.

  res_auth <- shinymanager::secure_server(
    check_credentials = shinymanager::check_credentials(credentials)
  )

  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })

  ##############################################.
  # NAVIGATION BUTTONS
  ##############################################.

  source(file.path("sections/navigation_buttons.R"),local = TRUE)$value

  ##############################################.
  # INFORMATION TAB ----
  ##############################################.

  source(file.path("sections/information_notes.R"), local = TRUE)$value

  source(file.path("sections/modals.R"), local = TRUE)$value


  ##############################################.
  # SUMMARY TAB ----
  ##############################################.

  source(file.path("sections/summary_tables.R"), local = TRUE)$value


  ##############################################.
  # WELLBEING TAB ----
  ##############################################.

  source(file.path("sections/server_wellbeing.R"),local = TRUE)$value


  ##############################################.
  # FINANCIAL SECURITY ----
  ##############################################.

  source(file.path("sections/server_financial_security.R"),local = TRUE)$value


  ##############################################.
  # GOOD GREEN JOBS AND FAIR WORK ----
  ##############################################.

  source(file.path("sections/server_good_green.R"),local = TRUE)$value


  ##############################################.
  # POPULATION HEALTH ----
  ##############################################.

  source(file.path("sections/server_population_health.R"),local = TRUE)$value




} # END OF SERVER