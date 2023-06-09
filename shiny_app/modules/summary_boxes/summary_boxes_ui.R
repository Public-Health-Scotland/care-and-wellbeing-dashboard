

summaryBoxUI <- function(id, title = "To be developed", button_title = "", button_content = "To be developed") {

  ns <- NS(id)

  tagList(
    box(id = ns(id),
        status = "primary",
      # title = "hi", #h4(class = "summary-box-title", glue("{title}")),
        summaryButtonUI(ns("summary_info"),
                        button_title,
                        button_content),
        width = "100%",
      tagList(h4(class = "summary-box-title", glue("{title}")),
        uiOutput(ns("summary_values")))
    ),
    br()
  )


}
