####################### Summary table function #######################

datatable_style_summary = function(data, names=NA) {
  if (!is.na(names)) {
    names(data) = names
  }

  data %>%
    DT::datatable(rownames = FALSE,
                  filter = "none",
                  options = list(
                    pageLength = 22,
                    dom="t",
                    initComplete = JS(
                      "function(settings, json) {",
                      "$(this.api().table().header()).css({'background-color': '#C5C3DA',
                      'color': '#3F3685'});",
                      "}")

    )) %>%
    formatStyle(., columns = 1,
                fontWeight = "bold",
                color = "#3F3685",
                backgroundColor = "#C5C3DA") %>%
    formatStyle(., columns = 2:6,
                color = "#0078D4")
  }
