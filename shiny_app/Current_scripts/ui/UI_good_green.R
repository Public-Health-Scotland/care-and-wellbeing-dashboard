navbarMenu(title = "Good, green jobs and fair work",
           icon = icon_no_warning_fn("solar-panel"),

           ##############################################.
           # EMPLOYEES ON THE LIVING WAGE----
           ##############################################.
           tabPanel(title = "Employees on the living wage",
                    value = "employees_living_wage",
                    icon = icon_no_warning_fn("fa-solid fa-hand-holding-dollar"),

                    bsButton("jump_home_employees_living_wage", "Go to home page"),
                    bsButton("employeeslivingwage_to_info", "Go to information page"),
                    br(),
                    br(),
                    h2("Employees earning below the living wage"),

                    fluidRow(
                      column(6,
                             actionButton(
                               "employees_living_wage_modal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      ),
                      column(6,
                             actionButton(
                               "employees_living_wage_modal_comment",
                               tags$b("Summary of indicator during covid and pre-covid period"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),
                    tags$b("Definition of Living Wage"),
                    p("The Living wage is the real Living Wage calculated annually by the Resolution Foundation and are overseen by the Living Wage Commission.  It is the UK wage rate that is voluntarily paid by over 10,000 UK businesses who believe their staff deserve a wage which meets everyday needs - like the weekly shop, or a surprise trip to the dentist.",
                      "More details about Living Wage rates and calculation can be found in", a("Living Wage foundation website.", href="https://www.livingwage.org.uk/what-real-living-wage")),
                    fluidRow(
                      column(12,
                             plot_title("Proportion of employees (18+) earning less than the real Living Wage (by sector)", "employees_living_wage_line")
                      )),
                    h3("Proportion of employees (18+) earning less than the real Living Wage (by local authority)"),
                    fluidRow(
                      column(6,
                             uiOutput("employees_living_wage_year_ui")),
                      column(6,
                             actionButton("employees_living_wage_map_button", "Trend for Scotland"))
                    ),
                    fluidRow(
                      column(12,
                             tags$b("Select a local authority on the map to view local trend:")),
                      column(6,
                             withSpinner(leafletOutput("employees_living_wage_map"))),
                      column(6,
                             withSpinner(plotlyOutput("employees_living_wage_line_LA")))
                    ),
                    fluidRow(
                      column(12,
                             h3("Data table"),

                             withSpinner(DT::dataTableOutput("employees_living_wage_data")))
                    )

           ),

           ##############################################.
           # GENDER PAY GAP----
           ##############################################.
           tabPanel(title = "Gender pay gap",
                    value = "gender_pay_gap",
                    icon = icon_no_warning_fn("fa-solid fa-mars-and-venus"),
                    bsButton("jump_home_gender_pay_gap", "Go to home page"),
                    bsButton("genderpaygap_to_info", "Go to information page"),
                    br(),
                    br(),
                    h2("Gender pay gap"),
                    fluidRow(
                      column(6,
                             actionButton(
                               "gender_pay_gap_modal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      ),
                      column(6,
                             actionButton(
                               "gender_pay_gap_modal_comment",
                               tags$b("Summary of indicator during covid and pre-covid period"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),
                    sidebarLayout(
                      sidebarPanel(radioButtons("gender_pay_gap_sector_radio", label = h3("Sector"),
                                                choices = list("All" = "All", "Public" = "Public", "Private" = "Private"),
                                                selected = "All"),
                                   radioButtons("gender_pay_gap_work_radio", label = h3("Work pattern"),
                                                choices = list("All" = "All", "Full-time" = "Full-time", "Part-time" = "Part-time"),
                                                selected = "All"),
                                   checkboxInput("gender_pay_gap_show_earnings_check_box",
                                                 "Show earnings",
                                                 value = FALSE),
                                   width = 3),
                      mainPanel(withSpinner(plotlyOutput("gender_pay_gap_plot_line_output")),
                                width = 9
                      )
                    ),
                    # fluidRow(
                    #   column(12,
                    #          h3("Data table"),
                    #
                    #          withSpinner(DT::dataTableOutput("gender_pay_gap_data")))
                    # ),
                    fluidRow(
                      h3("Data tables"),
                      tabBox(
                        #title = "Data tables",
                        # The id lets us use input$tabset1 on the server to find the current tab
                        id = "gender_pay_gap_tabBox", height = "250px", width=12,
                        tabPanel("Pay gap", withSpinner(DT::dataTableOutput("gender_pay_gap_data"))),
                        tabPanel("Earnings", withSpinner(DT::dataTableOutput("gender_pay_gap_data_earnings")))
                      )
                    )

           ),
           ##############################################.
           # EMPLOYMENT GAP----
           ##############################################.

           tabPanel(title = "Employment gap",
                    value = "employment_gap",
                    icon = icon_no_warning_fn("fa-solid fa-people-arrows"),
                    bsButton("jump_home_ethnicity_employment_gap", "Go to home page"),
                    tabBox(
                      title = "",
                      # The id lets us use input$tabset1 on the server to find the current tab
                      id = "employment_gap_tabbox", #height = "250px",
                      tabPanel("Disability employment gap", uiOutput("disability_gap_ui")),
                      tabPanel("Ethnicity employment gap",  uiOutput("ethnicity_gap_ui")),
                      width = 12
                    )
           ),

           ##############################################.
           # ZERO-HOURS CONTRACTS----
           ##############################################.
           tabPanel(title = "Zero-hours contracts",
                    value = "zero_hours_contracts",
                    icon = icon_no_warning_fn("fa-solid fa-0"),
                    bsButton("jump_home_zero_hours_contracts", "Go to home page"),
                    bsButton("zerohourscontract_to_info", "Go to information page"),
                    br(),
                    br(),

                    h3("Zero-hours contracts"),
                    fluidRow(
                      column(6,
                             actionButton(
                               "zero_hours_contracts_modal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      ),
                      column(6,
                             actionButton(
                               "zero_hours_contracts_modal_comment",
                               tags$b("Summary of indicator during covid and pre-covid period"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),
                    h4("Percentage of people in employment on a zero-hours contract"),
                    withSpinner(plotlyOutput("zero_hours_contracts_line_plot")),
                    fluidRow(
                      column(12,
                             h3("Data table"),

                             withSpinner(DT::dataTableOutput("zero_hours_contracts_data_table")))
                    )
           ),

           ##############################################.
           # SKILLS SHORTAGE VACANCIES----
           ##############################################.
           tabPanel(title = "Skills shortage vacancies",
                    value = "skills_shortage_vacancies",
                    icon = icon_no_warning_fn("fa-solid fa-person"),

                    h3("Skills shortage vacancies"),

                    bsButton("jump_home_skills_shortage_vacancies", "Go to home page"),
                    bsButton("childcare_uptake_to_info", "Go to information page"),
                    br(),
                    br(),

                    fluidRow(
                      column(3,
                             actionButton(
                               "skills_shortage_vacancies_modal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),
                    p("Use the below drop-down menu to select a region of interest."),


                    fluidRow(
                      selectInput("region_skills_shortage",
                                  label = "Select Region",
                                  choices = unique(skills_shortage_vacancies$region),
                                  selected = "Scotland")),
                    fluidRow(
                      plot_title(title_plot = "Percentage of skill shortage vacancies vs. all vacancies", "skills_shortage_graph_bar")
                    ),
                    fluidRow(
                      h3("skills shortage data table"),
                      DT::dataTableOutput("skills_shortage_data")
                    )),



           ##############################################.
           # UNDEREMPLOYMENT----
           ##############################################.
           tabPanel(title = "Underemployment",
                    value = "underemployment",
                    icon = icon_no_warning_fn("fa-solid fa-down-long"),

                    bsButton("jump_home_underemployment", "Go to home page"),
                    bsButton("underemployment_to_info", "Go to information page"),
                    br(),
                    br(),

                    h3("Underemployment"),
                    fluidRow(
                      column(6,
                             actionButton(
                               "underemployment_modal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      ),
                      column(6,
                             actionButton(
                               "underemployment_modal_comment",
                               tags$b("Summary of indicator during covid and pre-covid period"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),
                    h4("Proportion of adults 16 years old and over who are in employment and would like to work longer hours, have an additional job or find a different job with more hours"),
                    uiOutput("underemployment_ui"),
                    withSpinner(plotlyOutput("underemployment_graph_line")),
                    fluidRow(
                      column(12,
                             h3("Data table"),

                             withSpinner(DT::dataTableOutput("underemployment_table_data")))
                    )

           ),

           ##############################################.
           # ECONOMIC INACTIVITY----
           ##############################################.
           tabPanel(title = "Economic inactivity",
                    value = "economic_inactivity",
                    icon = icon_no_warning_fn("fa-solid fa-people-arrows"),


                    h3("Economic inactivity"),

                    bsButton("jump_home_economic_inactivity", "Go to home page"),
                    bsButton("economic_inactivity_to_info", "Go to information page"),
                    br(),
                    br(),

                    fluidRow(
                      column(3,
                             actionButton(
                               "economic_inactivity_modal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),

                    p("Use the below drop-down menu to select a region of interest."),

                    fluidRow(
                      selectInput("region_economic_inactivity",
                                  label = "Select Region",
                                  choices = unique(economic_inactivity$region),
                                  selected = "Scotland")),

                    fluidRow(
                      plot_title(title_plot = "Percentage of economically inactive people aged 16 to 64 by willingness to work", "economic_inactivity_graph_line")
                    ),

                    fluidRow(
                      h3("Economic inactivity data table"),
                      DT::dataTableOutput("economic_inactivity_data")
                    )

           ),


           ##############################################.
           # EMPLOYABILITY----
           ##############################################.
           tabPanel(title = "Employability",
                    value = "employability",
                    icon = icon_no_warning_fn("fa-solid fa-handshake"),

                    bsButton("jump_home_employability", "Go to home page"),
                    bsButton("employability_to_info", "Go to information page"),
                    br(),
                    br(),

                    h3("Employability"),
                    h4("Number of starts by month"),#employability_FSS_start_month_reactive_text

                    fluidRow(
                      column(6,
                             actionButton(
                               "employability_FSS_start_modal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      ),
                      column(6,
                             actionButton(
                               "employability_FSS_start_modal_comment",
                               tags$b("Summary of indicator during covid and pre-covid period"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),
                    fluidRow(
                      column(4,p("Selected range of date:"),
                             textOutput("employability_FSS_start_month_reactive_text"))
                      ,
                      column(8,uiOutput("employability_FSS_start_month_slider_ui"))
                    ),

                    fluidRow(
                      column(4, withSpinner(plotlyOutput("employability_FSS_start_month_funnel_figure"))
                      ),
                      column(8, withSpinner(plotlyOutput("employability_FSS_start_month_figure"))
                      )
                    ),

                    h4("Number of referrals and starts (from referrals) by quarter"),
                    fluidRow(
                      column(6,
                             actionButton(
                               "employability_FSS_referral_modal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      ),
                      column(6,
                             actionButton(
                               "employability_FSS_referral_modal_comment",
                               tags$b("Summary of indicator during covid and pre-covid period"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),
                    fluidRow(column(4,p("Selected range of quarters:"),
                                    textOutput("employability_FSS_referral_reactive_text")
                    ),
                    column(8,uiOutput("employability_FSS_referral_slider_ui"))),
                    fluidRow(
                      column(4, withSpinner(plotlyOutput("employability_FSS_referral_funnel_figure"))
                      ),
                      column(8, withSpinner(plotlyOutput("employability_FSS_referral_figure"))
                      )
                    ),

                    fluidRow(
                      column(12,
                             h3("Data table"),

                             withSpinner(DT::dataTableOutput("employability_FSS_referral_data")))
                    )
           ),

           ##############################################.
           # CONTRACTUALLY SECURE WORK----
           ##############################################.
           tabPanel(title = "Contractually secure work",
                    value = "contractually_secure_work",
                    icon = icon_no_warning_fn("person-digging"),
                    bsButton("jump_home_contractually_secure_work", "Go to home page")
           ),


           ##############################################.
           # GREEN JOBS----
           ##############################################.
           tabPanel(title = "Green jobs",
                    value = "green_jobs",
                    icon = icon_no_warning_fn("fa-solid fa-recycle"),
                    bsButton("jump_home_green_jobs", "Go to home page"),
                    bsButton("greenjobs_to_info", "Go to information page")
           )

)