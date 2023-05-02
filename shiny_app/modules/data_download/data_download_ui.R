####################### Modals UI #######################

dataDownloadUI <- function(id) {


  ns <- NS(id)

  tagList(
    downloadButton(ns("csv"),
                   "CSV"),
    downloadButton(ns("excel"),
                   "Excel"),
    withSpinner(DT::dataTableOutput(ns("table")))
  )
}
