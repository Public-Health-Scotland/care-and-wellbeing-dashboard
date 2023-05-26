

summaryBoxUI <- function(id, title = "", button_title = "", button_content = "To be developed") {

  ns <- NS(id)

  tagList(
    box(id = ns(id),
        status = "primary",
        title = div(class = "summary-box-title", glue("{title}")),
        summaryButtonUI(ns("summary_info"),
                        button_title,
                        button_content),
        width = "100%",
        uiOutput(ns("summary_values"))
    ),
    br()
  )


}