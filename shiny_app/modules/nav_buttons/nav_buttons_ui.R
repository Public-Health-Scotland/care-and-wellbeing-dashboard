####################### Modals UI #######################

navButtonUI <- function(id) {


  # ns <- NS(id)

  tagList(
    actionButton(
      # ns("to_info"),
      id,
      "Jump to information page")

  )
}
