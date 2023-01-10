tabPanel(title = "Summary",
         icon = icon_no_warning_fn("table"),
         value = "summary",

         h2("Summary Tables"),
         p("This page gives the latest data on each of the indicators within the COVID-19 Recovery Dashboard."),
         p("Please note the indicators use different reporting dates (e.g. month, financial year etc)
                 and therefore cannot be compared against each other. "),
         p("By using the buttons and drop-down menus below, you can explore each section of the dashboard's summary. ",
           "Indicators can also be viewed at both health board and council area level when data are available at this level."),

         #bsButton("jump_home_summary", "Go to home page"),
         #bsButton("summary_to_info", "Go to information page"),

         fluidRow(
           column(3,
                  radioButtons("pillar_type_summary",
                               label = "1. Select pillar",
                               choices = unique(summary_final$pillar),
                               selected = "COVID Recovery")),

           column(3,
                  uiOutput("indicator_type_ui")),

           column(3,
                  selectizeInput("geog_type_summary",
                                 label = "3. Select geography type",
                                 choices = c("Scotland", "Health Board", "Council Area"),
                                 selected = "Scotland")),
           column(3,
                  uiOutput("geog_summary_ui"))
         ),
         fluidRow(
           h3("Summary Table"),
           column(12,
                  DT::dataTableOutput("summary"))
         )

) # End of navbarMenu SUMMARY
