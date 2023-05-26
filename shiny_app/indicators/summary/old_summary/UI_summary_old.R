tabPanel(title = "Summary",
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
                               choices = c("COVID Recovery", "Care and Wellbeing"),
                               selected = "COVID Recovery")),

           column(3,
                  selectizeInput("indicator_type_summary",
                                 label = "2. Select indicator section",
                                 choices = unique(summary_final %>% filter(pillar == "COVID Recovery") %>% .$section),
                                                  selected = "")),

           column(3,
                  selectizeInput("geog_type_summary",
                                 label = "3. Select geography breakdown",
                                 choices = c("Scotland", "Health Board", "Council Area"),
                                 selected = "Scotland")),
           column(3,
                  selectizeInput("geog_name_summary",
                                 label = "4. Select area",
                                 choices = unique(summary_final %>% filter(geography_type == "Scotland") %>% .$geography),
                                 selected = ""))
         ),
         fluidRow(
           h3("Summary Table"),
           column(12,
                  DT::dataTableOutput("summary"))
         ),

         fluidRow(column(12,linebreaks(5)))

) # End of navbarMenu SUMMARY
