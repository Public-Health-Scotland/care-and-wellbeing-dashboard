

summaryBoxUI <- function(id, title, button_title, button_content) {

  ns <- NS(id)

  box(id = ns(id),
      status = "primary",
      title = h4(glue("{title}"),
                 summaryButtonUI(ns("summary_info"),
                                 button_title,
                                 button_content)),
      width = "100%",
      uiOutput(ns("summary_values"))
  )


}
