tagList(

  h1("Financial security for low income households"),
  br(),
  actionButton("financial_security_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10),


               ##############################################.
               # FUEL AFFORDABILITY----
               ##############################################.
               tabPanel(title = "Fuel affordability",
                        value = "fuel_affordability",
                        icon = icon_no_warning_fn("gas-pump"),

                        h2("Fuel Affordability"),

                        #bsButton("jump_home_fuel_affordability", "Go to home page"),
                        bsButton("fuelaffordability_to_info", "Go to information page"),
                        br(),
                        br(),

                        p("These data show percentage of household with fuel poverty in Scotland. "),

                        plot_title("Fuel Poverty and Extreme Fuel Poverty", "fuel_afford_line"),

                        h3("Fuel Poverty Map"),
                        fluidRow(
                          column(6,
                                 selectizeInput("fuel_afford_year_input",
                                                label = "Select year to view on heatmap:",
                                                choices = fuel_SHCS_LA %>%
                                                  filter(fuel_poverty == "Fuel Poor") %>% .$date_code %>%
                                                  unique() %>%
                                                  sort()#,
                                                # selected = fuel_afford_year_choices %>% tail(1)
                                 )),
                          column(6,
                                 actionButton("fuel_afford_year_button", "Trend for Scotland"))
                        ),
                        h3("Missing map and plot"),
                        fluidRow(
                          column(12,
                                 tags$b("Select a local authority on the map to view local trend:")),
                          column(6,
                                 withSpinner(leafletOutput("fuel_afford_SHCS_map"))),
                          column(6,
                                 withSpinner(plotlyOutput("fuel_afford_line_LA")))
                        ),


                        br(),
                        h3(textOutput("fuel_affordibility_table_title")),
                        radioButtons("fuel_affordibility_radiobuttons",
                                     "Select geography type for data table",
                                     choices = c("Scotland", "Local authority"),
                                     inline = TRUE),
                        dataDownloadUI("fuel_affordibility")),

               ##############################################.
               # FOOD AFFORDABILITY----
               ##############################################.
               tabPanel(title = "Food affordability",
                        value = "food_affordability",
                        icon = icon_no_warning_fn("lemon"),

                        h2("Food Affordability"),

               ),


               ##############################################.
               # COST OF LIVING ----
               ##############################################.
               tabPanel(title = "Cost of living",
                        value = "cost_of_living",
                        icon = icon_no_warning_fn("money-bill-trend-up"),

                        h3("Cost of living"),

                        #bsButton("jump_home_household_expenditure", "Go to home page"),
                        bsButton("household_spending_to_info", "Go to information tab"),
                        br(),
                        br(),


                        actionButton(
                          "household_spending_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),
                        br(),
                        br(),
                        p("This indicator covers food affordability and the cost of living.",
                          "Statistics are presented as percentage of total expenditure.",
                          "Food affordability is defined as the proportion of total expenditure spent",
                          "on food and non-alcoholic drinks.",
                          "Cost of living is the sum of the proportion of total expenditure spent",
                          "on food, non-alcoholic drinks, housing (net), fuel, power, and household",
                          " goods and services."),


                        plot_title("Household expenditure as a percentage of total expenditure in Scotland",
                                   "household_spending_bar"),


                        h3("Data table: Household expenditure as a percentage of total expenditure in Scotland"),

                        dataDownloadUI("managing_spending")),


               ##############################################.
               # MANAGING FINANCIALLY----
               ##############################################.
               tabPanel(title = "Managing financially",
                        value = "managing_financially",
                        icon = icon_no_warning_fn("sterling-sign"),

                        h3("Managing financially"),

                        #bsButton("jump_home_managing_financially", "Go to home page"),
                        bsButton("managingfinancially_to_info", "Go to information page"),
                        br(),
                        br(),


                        actionButton("managing_financially_madal_info",
                                     tags$b("Background information and source"),
                                     icon = icon_no_warning_fn("info-circle")
                        ),


                        actionButton("managing_financially_madal_comment",
                                     tags$b("Summary of indicator during covid and pre-covid period"),
                                     icon = icon_no_warning_fn("info-circle")
                        ),
                        h4("Percentage of households with net annual household income of up to £30,000 report managing well financially in 2020"),
                        withSpinner(plotlyOutput("managing_financially_bar_plot")),


                        h3("Data table: Percentage of households in Scotland managing financially in 2020"),

                        dataDownloadUI("managing_financially")),

               ##############################################.
               # SAVINGS----
               ##############################################.
               tabPanel(title = "Savings",
                        value = "savings",
                        icon = icon_no_warning_fn("piggy-bank"),

                        h2("Savings"),

                        #bsButton("jump_home_savings", "Go to home page"),
                        bsButton("savings_to_info", "Go to information page"),
                        br(),
                        br(),

                        h3("Percentage of household with low income"),

                        actionButton(
                          "Savings_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton(
                          "Savings_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),
                        br(),
                        br(),

                        selectizeInput("savings_net_income_si",
                                       label = "Select net income",
                                       choices = unique(savings_low_income %>%
                                                          filter(council == "Scotland") %>%
                                                          .$net_income),
                                       selected = "All"),

                        withSpinner(plotlyOutput("savings_stacked_bar_plot")),

                        h3("Percentage of household with no savings by local authority"),
                        #h4("Percentage of no savings among household with low income"),
                        #fluidRow(column(5,uiOutput("savings_low_income_year_ui"))),

                        fluidRow(
                          column(6,
                                 selectizeInput("savings_low_income_year_input",
                                                label = "Select year to view on heatmap:",
                                                choices = savings_low_income %>%
                                                  filter(savings == "No savings",
                                                         net_income == "All"
                                                  ) %>% .$year %>%
                                                  unique() %>%
                                                  sort())),
                          column(6,
                                 actionButton("savings_net_income_map_button", "Trend for Scotland"))
                        ),
                        h3("Missing map and plot"),
                        fluidRow(
                          column(12,
                                 tags$b("Select a local authority on the map to view local trend:")),
                          column(6,
                                 withSpinner(leafletOutput("savings_low_income_map"))),
                          column(6,
                                 withSpinner(plotlyOutput("savings_low_income_line_LA")))

                        ),

                        h3("Data table: Percentage of households in Scotland with savings by local authority"),

                        dataDownloadUI("savings_low_income")),



               ##############################################.
               # UNMANAGEABLE DEBT----
               ##############################################.
               tabPanel(title = "Unmanageable debt",
                        value = "unmanageable_debt",
                        icon = icon_no_warning_fn("scale-unbalanced"),

                        h2("Unmanageable debt"),

                        #bsButton("jump_home_unmanageable_debt", "Go to home page"),
                        bsButton("unmanageabledebt_to_info", "Go to information page"),
                        br(),
                        br(),


                        actionButton(
                          "unmanageable_debt_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton(
                          "unmanageable_debt_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        plot_title("Percentage of household with unmanageable debt","unmanageable_debt_line"),

                        h3("Data table: Percentage of households with unmanageable debt"),

                        dataDownloadUI("unmanageable_debt")),


               ##############################################.
               # TRANSPORT COSTS----
               ##############################################.
               tabPanel(title = "Transport costs",
                        value = "transport_costs",
                        icon = icon_no_warning_fn("bus"),

                        h2("Transport costs"),

                        #bsButton("jump_home_transport_costs", "Go to home page"),
                        bsButton("transportcosts_to_info", "Go to information page"),
                        br(),
                        br()),


               ##############################################.
               # CHILDCARE UPTAKE----
               ##############################################.

               #### two seperate tab values used foor the summary page - but only one tab necessary
               tabPanel(title = "Early learning and childcare uptake",
                        value = "childcare_uptake",
                        icon = icon_no_warning_fn("children"),

                        h2("ELC childcare uptake"),

                        #bsButton("jump_home_childcare_uptake", "Go to home page"),
                        bsButton("childcareuptake_to_info", "Go to information page"),
                        br(),
                        br(),


                        actionButton(
                          "childcare_uptake_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),


                        plot_title(title_plot = "Percentage of 2-5-year-olds receiving funded Early Learning and Childcare
                                 (ELC) who are accessing 1140 hours of funded ELC", "childcare_uptake_graph_line"),


                        h3("Data table: Percentage of 2-5-year-olds receiving funded Early Learning and Childcare
                                 (ELC) who are accessing 1,140 hours of funded ELC"),

                        dataDownloadUI("childcare_uptake")),

               ##############################################.
               # Benefit uptake and engagement with welfare advice ----
               ##############################################.
               tabPanel(title = "Benefit uptake and engagement with welfare advice",
                        value = "benefits_uptake",
                        icon = icon_no_warning_fn("person-shelter"),

                        h2("Benefit uptake and engagement with welfare advice"),

                        #bsButton("jump_home_benefit_uptake", "Go to home page"),
                        bsButton("benefituptake_to_info", "Go to information page"))


  )
)
