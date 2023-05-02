####################### Modals #######################

# Data download  server ----
navButtonServer <- function(id, indicator) {

  # make sure the indciator is equivalent to the tab value
  pillar <- section_lookup %>% filter(section == indicator) %>%
    head(1) %>% .$pillar

  section <- indicator

  # ns <- NS(id)

  # id <- ns("to_info")

  # moduleServer(
  # id,
  function(input, output, session) {


    observeEvent(input$id,
                 {updateTabsetPanel(session,
                                    "intabset",
                                    selected = "info_notes")
                   updateRadioButtons(session,
                                      "pillar_type_info",
                                      selected = pillar)
                   updateRadioButtons(session,
                                      "indicator_type_info",
                                      selected = section)
                 })




  }

# moduleServer(
#   id,
#   function(input, output, session) {
#
#
#     observeEvent(input$to_info,
#                  {updateTabsetPanel(session,
#                                     "intabset",
#                                     selected = "info_notes") })
#
#   })

}
