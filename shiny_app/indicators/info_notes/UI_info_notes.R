tabPanel(title = "Information and Notes",
         icon = icon_no_warning_fn("info-circle"),
         value = "information",

         h2("Information and Notes"),

         sidebarLayout(
         sidebarPanel(width = 2,
                  radioButtons(inputId = "indicator_type_info",
                               label = "1. Select indicator section",
                               choices = c(unique(section_lookup$section)))),
         mainPanel(width = 10,
           uiOutput("info_panel")
         ))

)
