tagList(

  h1("Create Fair Employment and Good Work For All"),
  br(),
navlistPanel(widths = c(2,10), id = "fair_work_panel",

               ##############################################.
               # ECONOMIC INACTIVITY----
               ##############################################.
               tabPanel(title = "Economic inactivity",
                        value = "economic_inactivity_cw",


                        h2("Economic inactivity", iButtonUI("economic_inactivity_cw",
                                                            content = paste("This indicator provides data on economically inactive adults aged",
                                                                             "16 to 64 who want to work.",
                                                                             "<br><br>Source:",
                                                                             "<a href= https://www.gov.scot/collections/labour-market-statistics/ target =_blank> Labour Market Statistics, Scottlish Government (external site)</a>.",
                                                                             "<br><br>The most current date available displayed in the Care and Wellbeing dashboard",
                                                                             "is 2020.",
                                                                             "More up to date data are available at source.",
                                                                             "<br><br>These data are available at Scotland",
                                                                             "and Council Area levels.",
                                                                            "<br><br> More detailed information can be found in the accompanying",
                                                                            "<a href=https://publichealthscotland.scot/media/20052/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                        fluidRow(column(3,
                                          selectInput("economic_inactivity_cw_geog_type",
                                                      "Step 1: Select national of local geography level",
                                                      choices = c("Scotland", "Council Area"),
                                                      selected = "Scotland")),
                                 column(3,
                                        selectInput("economic_inactivity_cw_geog_name",
                                                    "Step 2: Select national or local geography area",
                                                    choices = c("Scotland"),
                                                    width = "100%"))
                                 ),



                        br(),
                        altTextUI("economic_inactivity_cw_alt"),
                        withSpinner(plotlyOutput("economic_inactivity_cw_plot")),

                        br(),
                        h3(textOutput("economic_inactivity_cw_table_title")),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                        br(),
                        dataDownloadUI("economic_inactivity_cw")


               ),

               ##############################################.
               # EMPLOYEES ON THE LIVING WAGE----
               ##############################################.
               tabPanel(title = "Employees on the Living Wage",
                        value = "employees_living_wage_cw",

                        h2("Employees on the Living Wage", iButtonUI("employees_living_wage_cw",
                                                                     content =
                                                                       paste("This indicator provides data on those earning less than",
                                                                             "the living wage in Scotland. ",
                                                                             "<br><br>Source:",
                                                                             "<a href=https://www.gov.scot/publications/annual-survey-of-hours-and-earnings-2021/ target =_blank> Annual summary of earnings statistics, Scottish Government (external site)</a>.",
                                                                             "<br><br>The most current date available displayed in the Care and Wellbeing dashboard",
                                                                             "is 2021.",
                                                                             "More up to date data are available at source.",
                                                                             "<br><br>These data are available at a Scotland",
                                                                             "level.",
                                                                             "<br><br> More detailed information can be found in the accompanying",
                                                                             "<a href=https://publichealthscotland.scot/media/20052/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),



                        altTextUI("employees_living_wage_cw_sector_alt"),
                        withSpinner(plotlyOutput("employees_living_wage_cw_sector_plot")),

                        h3("Data table: Percentage of employees (18+) earning less than the real Living Wage by sector in Scotland"),
                        p("To view the full dataset, please use the download buttons below."),
                        dataDownloadUI("living_wage_sector_cw"),

                        br(),

                        h3("Percentage of employees (18+) earning less than the real Living Wage by local authority"),

                        fluidRow(
                          column(6,
                                 selectizeInput("employees_living_wage_cw_year",
                                                label = "Select year to view on heatmap:",
                                                choices = employees_living_wage_by_LA %>%
                                                  filter(earning == "Earning less than the living wage") %>%
                                                  select(year, local_authority, ca2019, measure_value) %>%
                                                  .$year %>% unique()
                                 )),
                                 column(6,
                                        actionButton("employees_living_wage_cw_map_button", "Trend for Scotland"))
                          ),

                        fluidRow(
                          column(12,
                                 tags$b("Select a local authority on the map to view local trend:")),
                          column(6,
                                 withSpinner(leafletOutput("employees_living_wage_cw_map"))),
                          column(6,
                                 withSpinner(plotlyOutput("employees_living_wage_cw_line_LA")))
                        ),

                        br(),
                        h3(textOutput("living_wage_cw_table_title")),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),

                        dataDownloadUI("living_wage_cw")),

               #############################################.
               #PAY GAP----
               #############################################.
               tabPanel(title = "Gender pay gap",
                        value = "gender_pay_gap_cw",

                        h2("Gender pay gap", iButtonUI("gender_pay_gap_cw", content = paste("This indicator provides data on the gender pay gap in Scotland",
                                                                                            "and Median Hourly Earnings estimates.",
                                                                                            "<br><br>Source:",
                                                                                            "<a href=https://www.gov.scot/publications/annual-survey-of-hours-and-earnings-2021/ target =_blank> Annual summary of earnings statistics, Scottish Government (external site)</a>.",
                                                                                            "<br><br>The most current date available displayed in the Care and Wellbeing dashboard",
                                                                                            "is 2021.",
                                                                                             "More up to date data are available at source.",
                                                                                             "<br><br>These data are available at a Scotland",
                                                                                             "level.",
                                                                                            "<br><br> More detailed information can be found in the accompanying",
                                                                                            "<a href=https://publichealthscotland.scot/media/20052/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                        altTextUI("gender_pay_gap_cw_alt"),


                        br(),
                        br(),

                        sidebarLayout(
                          sidebarPanel(radioButtons("gender_pay_gap_cw_sector", label = h3("Sector"),
                                                    choices = list("All" = "All", "Public" = "Public", "Private" = "Private"),
                                                    selected = "All"),
                                       radioButtons("gender_pay_gap_cw_work", label = h3("Work pattern"),
                                                    choices = list("All" = "All", "Full-time" = "Full-time", "Part-time" = "Part-time"),
                                                    selected = "All"),
                                       checkboxInput("gender_pay_gap_cw_show_earnings_check_box",
                                                     "Show earnings",
                                                     value = FALSE),
                                       width = 3),
                          mainPanel(withSpinner(plotlyOutput("gender_pay_gap_cw_plot")),
                                    width = 9
                          )
                        ),

                        # fluidRow(
                        #   column(12,
                        #          h3("Data table"),
                        #
                        #          withSpinner(DT::dataTableOutput("gender_pay_gap_data")))
                        # ),



                        h3(textOutput("gender_pay_gap_cw_table_title")),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),

                        tabBox(
                          #title = "Data tables",
                          # The id lets us use input$tabset1 on the server to find the current tab
                          id = "gender_pay_gap_cw_tabBox", height = "250px", width=12,
                          tabPanel("Pay gap",
                                   br(),
                                   dataDownloadUI("gender_pay_gap_cw")),
                          tabPanel("Earnings",
                                   br(),
                                   dataDownloadUI("gender_pay_gap_earnings_cw"))
                        )),

               ##############################################.
               # WORK RELATED ILL HEALTH----
               ##############################################.
               tabPanel(title = "Work-related ill health (to be developed)",
                        value = "work_related_ill_health",

                        h2("Work related ill health"),

                        p("Content to be developed")
               )
  )
)
