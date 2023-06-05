tagList(

  h1("Create Fair Employment and Good Work For All"),
  br(),
  navlistPanel(widths = c(2,10), id = "fair_work_panel",

               ##############################################.
               # ECONOMIC INACTIVITY----
               ##############################################.
               tabPanel(title = "Economic inactivity",
                        value = "economic_inactivity_cw",


                        h2("Economic inactivity", iButtonUI("economic_inactivity_cw", content = paste("This indicator measures the percentage of economically inactive",
                                                                                                      "adults aged 16 to 64 who want to work, from the",
                                                                                                      "<a href= https://www.gov.scot/collections/labour-market-statistics/ target = _blank> Annual Population Survey. </a>"))),

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
                                                                     content = paste("This indicator uses data from the Annual Survey of Hours and Earnings from the Office for National Statistics (ONS).",
                                                                                     "<br> <br>",
                                                                                     "The real Living Wage is calculated annually by the Resolution",
                                                                                     "Foundation and is overseen by the Living Wage Commission.",
                                                                                     "It is the only UK wage rate based on the cost of living. It is voluntarily paid by over 12,000 UK businesses",
                                                                                     "who believe their staff deserve a wage which meets everyday needs. The real Living Wage rate for 2022-23 is £10.90",
                                                                                     "across the UK (£11.95 in London). More details about Living Wage",
                                                                                     "rates and calculations can be found on the",
                                                                                     "<a href= https://www.livingwage.org.uk/what-real-living-wage/ target = _blank> Living Wage Foundation website. </a>",
                                                                                     "<br> <br>",
                                                                                     "Estimates for employees aged 18+ on the PAYE system on adult rates whose pay",
                                                                                     "for the survey pay-period was not affected by absence. Estimates for 2020 and",
                                                                                     "2021 include employees who have been furloughed under the Coronavirus Job Retention Scheme (CJRS).",
                                                                                     "Data for 2021 are provisional.",
                                                                                     "Levels calculated using low pay calibration weights in line with ONS guidance.",
                                                                                     "Hourly earnings excludes any overtime payments."))),

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
                                 mapAltTextUI("employees_living_wage_cw_map_alt"),
                                 withSpinner(leafletOutput("employees_living_wage_cw_map"))),
                          column(6,
                                 altTextUI("employees_living_wage_cw_map_plot_alt"),
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

                        h2("Gender pay gap", iButtonUI("gender_pay_gap_cw", content = paste("This indicator uses data from the Annual Survey of Hours and Earnings from the",
                                                                                            "Office for National Statistics (ONS).",
                                                                                            "<br> <br>",
                                                                                            "Estimates for employees aged 16+ on the PAYE system on adult rates whose pay",
                                                                                            "for the survey pay-period was not affected by absence. Estimates for 2020 and 2021 include",
                                                                                            "employees who have been furloughed under the Coronavirus Job Retention Scheme (CJRS)."))),

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
