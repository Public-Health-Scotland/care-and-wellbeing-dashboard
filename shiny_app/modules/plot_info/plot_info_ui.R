####################### Modals UI #######################


plotInfoUI <- function(id) {

  ns <- NS(id)

  tagList(
    actionButton(ns("plotinfo"),
                 "Using the plot",
                 icon = icon_no_warning_fn('question'))
  )


}


