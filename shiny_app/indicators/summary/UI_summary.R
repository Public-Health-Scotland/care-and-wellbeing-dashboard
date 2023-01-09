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
                  radioButtons("indicator_type_summary",
                               label = "1. Select indicator section",
                               choices = c("Wellbeing of children and young people",
                                           "Financial security for low income households",
                                           "Good, green jobs and fair work",
                                           "Population health"),
                               selected = "Wellbeing of children and young people")),
           column(3,
                  selectizeInput("geog_type_summary",
                                 label = "2. Select geography type",
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
