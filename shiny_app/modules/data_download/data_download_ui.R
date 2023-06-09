####################### Modals UI #######################

dataDownloadUI <- function(id) {


  ns <- NS(id)

  tagList(
    downloadButton(ns("csv"),
                   "Download as CSV"),
    downloadButton(ns("excel"),
                   "Download as Excel"),
    withSpinner(DT::dataTableOutput(ns("table")))
  )
}
