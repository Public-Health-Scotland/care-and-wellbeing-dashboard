navbarMenu(title = "Financial security for low income households",
           icon = icon_no_warning_fn("scale-balanced"),


           ##############################################.
           # FUEL AFFORDABILITY----
           ##############################################.
           tabPanel(title = "Fuel affordability",
                    value = "fuel_affordability",
                    icon = icon_no_warning_fn("gas-pump"),

                    h2("Fuel Affordability"),

                    bsButton("jump_home_fuel_affordability", "Go to home page"),
                    bsButton("fuelaffordability_to_info", "Go to information page"),
                    br(),
                    br(),

                    fluidRow(
                      column(12,
                             p("These data show percentage of household with fuel poverty in Scotland. ")
                      )),
                    fluidRow(
                      column(12,
                             plot_title("Fuel Poverty and Extreme Fuel Poverty", "fuel_afford_line")
                      )),

                    h3("Fuel Poverty Map"),
                    fluidRow(
                      column(6,
                             uiOutput("fuel_afford_year_ui")),
                      column(6,
                             actionButton("fuel_afford_year_button", "Trend for Scotland"))
                    ),
                    fluidRow(
                      column(12,
                             tags$b("Select a local authority on the map to view local trend:")),
                      column(6,
                             withSpinner(leafletOutput("fuel_afford_SHCS_map"))),
                      column(6,
                             withSpinner(plotlyOutput("fuel_afford_line_LA")))
                    ),

                    fluidRow(
                      column(12,
                             h3("Data table"),

                             withSpinner(DT::dataTableOutput("fuel_afford_data")))
                    )),

           ##############################################.
           # HOUSEHOLD SPENDING----
           ##############################################.
           tabPanel(title = "Household spending",
                    value = "household_spending",
                    icon = icon_no_warning_fn("money-bill-trend-up"),
                    bsButton("jump_home_household_expenditure", "Go to home page"),
                    bsButton("household_spending_to_info", "Go to information tab"),
                    br(),
                    br(),

                    h3("Household spending"),

                    fluidRow(
                      column(6,
                             actionButton(
                               "household_spending_modal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )),

                    p("This indicator covers food affordability and the cost of living.",
                      "Statistics are presented as percentage of total expenditure.",
                      "Food affordability is defined as the proportion of total expenditure spent",
                      "on food and non-alcoholic drinks.",
                      "Cost of living is the sum of the proportion of total expenditure spent",
                      "on food, non-alcoholic drinks, housing (net), fuel, power, and household",
                      " goods and services."),

                    fluidRow(
                      column(12,
                             plot_title("Household expenditure as a percentage of total expenditure in Scotland",
                                        "household_spending_bar"))
                    ),

                    fluidRow(
                      column(12,
                             h3("Data table"),
                             DT::dataTableOutput("household_spending_data"))
                    )

           ),


           ##############################################.
           # MANAGING FINANCIALLY----
           ##############################################.
           tabPanel(title = "Managing financially",
                    value = "managing_financially",
                    icon = icon_no_warning_fn("sterling-sign"),

                    bsButton("jump_home_managing_financially", "Go to home page"),
                    bsButton("managingfinancially_to_info", "Go to information page"),
                    br(),
                    br(),

                    h3("Managing financially"),
                    fluidRow(
                      column(6,
                             actionButton(
                               "managing_financially_madal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      ),
                      column(6,
                             actionButton(
                               "managing_financially_madal_comment",
                               tags$b("Summary of indicator during covid and pre-covid period"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),
                    h4("Percentage of households with net annual household income of up to £30,000 report managing well financially in 2020"),
                    withSpinner(plotlyOutput("managing_financially_bar_plot")),
                    fluidRow(
                      column(12,
                             h3("Data table"),

                             withSpinner(DT::dataTableOutput("managing_financially_data_table")))
                    )
           ),

           ##############################################.
           # SAVINGS----
           ##############################################.
           tabPanel(title = "Savings",
                    value = "savings",
                    icon = icon_no_warning_fn("piggy-bank"),
                    bsButton("jump_home_savings", "Go to home page"),
                    bsButton("savings_to_info", "Go to information page"),
                    br(),
                    br(),
                    h2("Savings"),
                    h3("Percentage of household with low income"),
                    fluidRow(
                      column(6,
                             actionButton(
                               "Savings_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      ),
                      column(6,
                             actionButton(
                               "Savings_comment",
                               tags$b("Summary of indicator during covid and pre-covid period"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),
                    br(),
                    fluidRow(uiOutput("savings_net_income_ui")),
                    fluidRow(column(12, withSpinner(plotlyOutput("savings_stacked_bar_plot"))
                    )),
                    h3("Percentage of household with no savings by local authority"),
                    #h4("Percentage of no savings among household with low income"),
                    #fluidRow(column(5,uiOutput("savings_low_income_year_ui"))),

                    fluidRow(
                      column(6,
                             uiOutput("savings_low_income_year_ui")),
                      column(6,
                             actionButton("savings_net_income_map_button", "Trend for Scotland"))
                    ),
                    fluidRow(
                      column(12,
                             tags$b("Select a local authority on the map to view local trend:")),
                      column(6,
                             withSpinner(leafletOutput("savings_low_income_map"))),
                      column(6,
                             withSpinner(plotlyOutput("savings_low_income_line_LA")))

                    ),
                    fluidRow(
                      column(12,
                             h3("Data table"),

                             withSpinner(DT::dataTableOutput("savings_low_income_data")))
                    )
           ),



           ##############################################.
           # UNMANAGEABLE DEBT----
           ##############################################.
           tabPanel(title = "Unmanageable debt",
                    value = "unmanageable_debt",
                    icon = icon_no_warning_fn("scale-unbalanced"),
                    bsButton("jump_home_unmanageable_debt", "Go to home page"),
                    bsButton("unmanageabledebt_to_info", "Go to information page"),
                    br(),
                    br(),

                    h2("Unmanageable debt"),
                    fluidRow(
                      column(6,
                             actionButton(
                               "unmanageable_debt_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      ),
                      column(6,
                             actionButton(
                               "unmanageable_debt_comment",
                               tags$b("Summary of indicator during covid and pre-covid period"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),
                    fluidRow(column(12, plot_title("Percentage of household with unmanageable debt","unmanageable_debt_line"))),
                    fluidRow(
                      column(12,
                             h3("Data table"),

                             withSpinner(DT::dataTableOutput("unmanageable_debt_data")))
                    )
           ),

           ##############################################.
           # LOCAL AUTHORITY FUNDED ADVICE----
           ##############################################.
           tabPanel(title = "Local authority funded advice",
                    value = "la_funded_advice",
                    icon = icon_no_warning_fn("people-group"),

                    bsButton("lafundedadvice_to_info", "Go to information page"),
                    br(),
                    br()),

           ##############################################.
           # TRANSPORT COSTS----
           ##############################################.
           tabPanel(title = "Transport costs",
                    value = "transport_costs",
                    icon = icon_no_warning_fn("bus"),

                    bsButton("jump_home_transport_costs", "Go to home page"),
                    bsButton("transportcosts_to_info", "Go to information page"),
                    br(),
                    br()),


           ##############################################.
           # CHILDCARE UPTAKE----
           ##############################################.
           tabPanel(title = "Early learning and childcare uptake",
                    value = "childcare_uptake",
                    icon = icon_no_warning_fn("children"),

                    h2("ELC childcare uptake"),

                    bsButton("jump_home_childcare_uptake", "Go to home page"),
                    bsButton("childcareuptake_to_info", "Go to information page"),
                    br(),
                    br(),

                    fluidRow(
                      column(6,
                             actionButton(
                               "childcare_uptake_modal_info",
                               tags$b("Background information and source"),
                               icon = icon_no_warning_fn("info-circle")
                             )
                      )
                    ),

                    fluidRow(
                      plot_title(title_plot = "Percentage of 2-5-year-olds receiving funded Early Learning and Childcare (ELC) who are accessing 1140 hours of funded ELC", "childcare_uptake_graph_line")
                    ),

                    fluidRow(
                      h3("ELC childcare uptake data table"),
                      DT::dataTableOutput("childcare_uptake_data")
                    )


           ),
           ##############################################.
           # Benefit uptake and engagement with welfare advice ----
           ##############################################.
           tabPanel(title = "Benefit uptake and engagement with welfare advice",
                    value = "benefit_uptake",
                    icon = icon_no_warning_fn("fa-solid fa-person-shelter"),
                    bsButton("jump_home_benefit_uptake", "Go to home page"),
                    bsButton("benefituptake_to_info", "Go to information page"))


)