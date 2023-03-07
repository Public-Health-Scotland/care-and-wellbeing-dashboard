tabPanel(title = "Information and Notes",
         icon = icon_no_warning_fn("info-circle"),
         value = "information",

         h2("Information and Notes"),

         sidebarLayout(
           sidebarPanel(width = 2,
                        radioButtons(inputId = "pillar_type_info",
                                     label = "1. Select pillar",
                                     choices = c("Covid recovery", "Care and wellbeing"),
                                     selected = "Covid recovery"),
                        radioButtons(inputId = "indicator_type_info",
                                     label = "2. Select indicator",
                                     choices = c(unique(section_lookup %>% filter(pillar == "Covid recovery") %>% .$section)))),
         mainPanel(width = 10,
                   uiOutput("info_panel")
         ))
)


