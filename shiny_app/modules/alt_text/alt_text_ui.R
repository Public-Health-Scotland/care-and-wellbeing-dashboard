####################### Modals UI #######################


altTextUI <- function(id) {

  ns <- NS(id)

  tagList(
    actionButton(ns("alttext"),
                 "Plot description",
                 icon = icon_no_warning_fn('chart-simple')),
    plotInfoButtonUI(ns("pi"))
  )

}


mapAltTextUI <- function(id) {

  ns <- NS(id)

  tagList(
    actionButton(ns("map_alttext"),
                 "Map description",
                 icon = icon_no_warning_fn('globe')),
    mapInfoButtonUI(ns("mi"))
  )

}



