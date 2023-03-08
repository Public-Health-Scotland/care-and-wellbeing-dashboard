tagList(

  h1("Create fair employment and good work for all"),
  br(),
  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10),


               ##############################################.
               # EMPLOYEES ON THE LIVING WAGE----
               ##############################################.
               tabPanel(title = "Employees on the living wage",
                        value = "employees_living_wage_cw",
                        icon = icon_no_warning_fn("hand-holding-dollar"),

                        h2("Employees on the living wage"),

                        actionButton(
                          "employees_living_wage_cw_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton(
                          "employees_living_wage_cw_modal_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        br(),
                        br(),

                        tags$b("Definition of Living Wage"),
                        p("The Living wage is the real Living Wage calculated annually by the Resolution Foundation and are overseen by the Living Wage Commission.  It is the UK wage rate that is voluntarily paid by over 10,000 UK businesses who believe their staff deserve a wage which meets everyday needs - like the weekly shop, or a surprise trip to the dentist.",
                          "More details about Living Wage rates and calculation can be found in", a("Living Wage foundation website.", href="https://www.livingwage.org.uk/what-real-living-wage")),

                        plot_title("Proportion of employees (18+) earning less than the real Living Wage (by sector)", "employees_living_wage_cw_plot"),

                        h3("Proportion of employees (18+) earning less than the real Living Wage (by local authority)"),

                        fluidRow(
                          column(3,
                                 selectizeInput("employees_living_wage_2_year_input",
                                                label = "Select year to view on heatmap:",
                                                choices = employees_living_wage_by_LA %>%
                                                  filter(earning == "Earning less than the living wage") %>%
                                                  select(year, local_authority, ca2019, measure_value) %>%
                                                  .$year %>% unique()
                                                ),
                          # column(3,
                          #        actionButton("employees_living_wage_2_map_button", "Trend for Scotland"))
                        )),
                        h3("Missing map and plot"),
                        # fluidRow(
                        #   column(12,
                        #          tags$b("Select a local authority on the map to view local trend:")),
                        #   column(6,
                        #          withSpinner(leafletOutput("employees_living_wage_2_map"))),
                        #   column(6,
                        #          withSpinner(plotlyOutput("employees_living_wage_2_line_LA")))
                        # ),

                        h3("Data table"),

                        withSpinner(DT::dataTableOutput("employees_living_wage_cw_table"))),

               #############################################.
               #PAY GAP----
               #############################################.
               tabPanel(title = "Pay gap",
                        value = "gender_pay_gap_cw",
                        icon = icon_no_warning_fn("mars-and-venus"),

                        h2("Pay gap"),

                        actionButton(
                          "gender_pay_gap_cw_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton(
                          "gender_pay_gap_cw_modal_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

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



                        h3("Data tables"),

                        tabBox(
                          #title = "Data tables",
                          # The id lets us use input$tabset1 on the server to find the current tab
                          id = "gender_pay_gap_cw_tabBox", height = "250px", width=12,
                          tabPanel("Pay gap",
                                   br(),
                                   withSpinner(DT::dataTableOutput("gender_pay_gap_cw_table"))),
                          tabPanel("Earnings",
                                   br(),
                                   withSpinner(DT::dataTableOutput("gender_pay_gap_cw_earnings_table")))
                        )),

               ##############################################.
               # WORK RELATED ILL HEALTH----
               ##############################################.
               tabPanel(title = "Work related ill health",
                        value = "work_related_ill_health",
                        icon = icon_no_warning_fn("lemon"),

                        h2("Work related ill health")
               ),

               ##############################################.
               # ECONOMIC INACTIVITY----
               ##############################################.
               tabPanel(title = "Economic inactivity",
                        value = "economic_inactivity_cw",
                        icon = icon_no_warning_fn("people-arrows"),


                        h3("Economic inactivity"),


                        actionButton(
                          "economic_inactivity_cw_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        p("Use the below drop-down menu to select a region of interest."),


                        selectInput("economic_inactivity_cw_region",
                                    label = "Select Region",
                                    choices = unique(economic_inactivity$region),
                                    selected = "Scotland"),


                        plot_title(title_plot = "Percentage of economically inactive people aged 16 to 64 by willingness to work", "economic_inactivity_cw_plot")
                        ,


                        h3("Economic inactivity data table"),
                        DT::dataTableOutput("economic_inactivity_cw_table")


               )


  )
)
