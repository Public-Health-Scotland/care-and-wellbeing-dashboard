tagList(

  h1("Good, green jobs and fair work" ),
  br(),
  actionButton("good_green_to_info", "Go to information page", class = "info-btn"),

  h4(strong("Select indicator: ")),




  navlistPanel(widths = c(2,10),

               ##############################################.
               # EMPLOYEES ON THE LIVING WAGE----
               ##############################################.
               tabPanel(title = "Employees on the living wage",
                        value = "employees_living_wage",
                        icon = icon_no_warning_fn("hand-holding-dollar"),

                        h2("Employees earning below the living wage"),


                        #bsButton("jump_home_employees_living_wage", "Go to home page"),
                        bsButton("employeeslivingwage_to_info", "Go to information page"),
                        br(),
                        br(),


                        actionButton(
                          "employees_living_wage_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton(
                          "employees_living_wage_modal_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        br(),
                        br(),

                        tags$b("Definition of Living Wage"),
                        p("The Living wage is the real Living Wage calculated annually by the Resolution Foundation and are overseen by the Living Wage Commission.  It is the UK wage rate that is voluntarily paid by over 10,000 UK businesses who believe their staff deserve a wage which meets everyday needs - like the weekly shop, or a surprise trip to the dentist.",
                          "More details about Living Wage rates and calculation can be found in", a("Living Wage foundation website.", href="https://www.livingwage.org.uk/what-real-living-wage")),

                        plot_title("Proportion of employees (18+) earning less than the real Living Wage (by sector)", "employees_living_wage_line"),

                        h3("Proportion of employees (18+) earning less than the real Living Wage (by local authority)"),

                        fluidRow(
                          column(6,
                                 selectizeInput("employees_living_wage_year_input",
                                                label = "Select year to view on heatmap:",
                                                choices = employees_living_wage_by_LA %>%
                                                  filter(earning == "Earning less than the living wage") %>%
                                                  .$year %>% unique())),
                          column(6,
                                 actionButton("employees_living_wage_map_button", "Trend for Scotland"))
                        ),
                        # h3("Missing map and plot"),
                        fluidRow(
                          column(12,
                                 tags$b("Select a local authority on the map to view local trend:")),
                          column(6,
                                 withSpinner(leafletOutput("employees_living_wage_map"))),
                          column(6,
                                 withSpinner(plotlyOutput("employees_living_wage_line_LA")))
                        ),

                        h3("Data table: Proportion of employees on the living wage"),
                        DT::dataTableOutput("living_wage_data"),

                        dataDownloadUI("living_wage")),



               ##############################################.
               # GENDER PAY GAP----
               ##############################################.
               tabPanel(title = "Gender pay gap",
                        value = "gender_pay_gap",
                        icon = icon_no_warning_fn("mars-and-venus"),

                        h2("Gender pay gap"),

                        #bsButton("jump_home_gender_pay_gap", "Go to home page"),
                        bsButton("genderpaygap_to_info", "Go to information page"),
                        br(),
                        br(),


                        actionButton(
                          "gender_pay_gap_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton(
                          "gender_pay_gap_modal_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
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



                        h3(textOutput("gender_pay_gap_table_title")),

                        tabBox(
                          #title = "Data tables",
                          # The id lets us use input$tabset1 on the server to find the current tab
                          id = "gender_pay_gap_tabBox", height = "250px", width=12,
                          tabPanel("Pay gap",
                                   br(),
                                   DT::dataTableOutput("gender_pay_gap_data"),
                                   dataDownloadUI("gender_pay_gap")
                                   ),
                          tabPanel("Earnings",
                                   br(),
                                   DT::dataTableOutput("gender_pay_gap_earnings_data"),
                                   dataDownloadUI("gender_pay_gap_earnings"))
                        )),
               ##############################################.
               # EMPLOYMENT GAP----
               ##############################################.

               tabPanel(title = "Employment gap",
                        value = "employment_gap",
                        icon = icon_no_warning_fn("people-arrows"),

                        h2("Employment gap"),

                        #bsButton("jump_home_ethnicity_employment_gap", "Go to home page"),

                        br(),
                        br(),

                        tabBox(
                          title = "",
                          # The id lets us use input$tabset1 on the server to find the current tab
                          id = "employment_gap_tabbox", width = 12, #height = "250px",
                          tabPanel("Disability employment gap",

                                   h3("Disability employment gap by local authority"),

                                   # bsButton("disabilityemploymentgap_to_info", "Go to information page"),

                                   br(),
                                   br(),


                                   actionButton(
                                     "disability_employment_gap_modal_info",
                                     tags$b("Background information and source"),
                                     icon = icon_no_warning_fn("info-circle")
                                   ),

                                   actionButton(
                                     "disability_employment_gap_modal_comment",
                                     tags$b("Summary of indicator during covid and pre-covid period"),
                                     icon = icon_no_warning_fn("info-circle")
                                   ),
                                   br(),
                                   br(),

                                   fluidRow(
                                     column(6,
                                            selectizeInput("disability_employment_gap_input",
                                                           label = "Select year to view on heatmap:",
                                                           choices = disability_employment_gap_data %>%
                                                             filter(category == "Disability Employment Gap") %>%
                                                             .$year %>%
                                                             unique() %>%
                                                             sort(),
                                                           selected = max(disability_employment_gap_data %>%
                                                                            filter(category == "Disability Employment Gap") %>%
                                                                            .$year %>%
                                                                            unique()))),
                                     column(6,
                                            actionButton("disability_employment_gap_button", "Trend for Scotland"))
                                   ),


                                   fluidRow(
                                     column(12,
                                            tags$b("Select a local authority on the map to view local trend:")),
                                     column(6,
                                            withSpinner(leafletOutput("disability_gap_ui_map"))),
                                     column(6,
                                            #withSpinner(plotlyOutput("disability_employment_gap_line_LA"))
                                            withSpinner(plotlyOutput("disability_gap_bar_line_LA"))

                                     )
                                   ),


                                   h3("Data table"),
                                   withSpinner(DT::dataTableOutput("disability_gap_data_table"))),


                          tabPanel("Ethnicity employment gap",

                                   br(),
                                   bsButton("ethnicityemploymentgap_to_info", "Go to information page"),

                                   br(),
                                   br(),

                                   actionButton(
                                     "ethnicity_employment_gap_modal_info",
                                     tags$b("Background information and source"),
                                     icon = icon_no_warning_fn("info-circle")
                                   ),


                                   actionButton(
                                     "ethnicity_employment_gap_modal_comment",
                                     tags$b("Summary of indicator during covid and pre-covid period"),
                                     icon = icon_no_warning_fn("info-circle")
                                   ),

                                   withSpinner(plotlyOutput("ethnicity_employment_gap_line_bar_figure")),

                                   br(),

                                   div("Before to the pandemic the ethnicity employment gap had been consistently increases, reaching 18% in the year prior to the pandemic. From 2020 onward the gap has been decreasing, falling to 8.2% in 2020/21.",
                                       br(),
                                       "This was largely driven by employment in the working age white population falling post pandemic and the employment rate in the minority ethnic population  increasing."
                                   ),

                                   h3("Data table"),
                                   withSpinner(DT::dataTableOutput("ethnicity_employment_gap_chart_data")))),
                        width = 12
               ),

               ##############################################.
               # ZERO-HOURS CONTRACTS----
               ##############################################.
               tabPanel(title = "Zero-hours contracts",
                        value = "zero_hours_contracts",
                        icon = icon_no_warning_fn("0"),

                        h3("Zero-hours contracts"),

                        #bsButton("jump_home_zero_hours_contracts", "Go to home page"),
                        bsButton("zerohourscontract_to_info", "Go to information page"),
                        br(),
                        br(),


                        actionButton(
                          "zero_hours_contracts_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton(
                          "zero_hours_contracts_modal_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        h4("Percentage of people in employment on a zero-hours contract"),

                        withSpinner(plotlyOutput("zero_hours_contracts_line_plot")),

                        h3("Data table: Percentage of people in employment on a zero-hours contract"),

                        DT::dataTableOutput("zero_hour_contracts_data"),
                        dataDownloadUI("zero_hour_contracts")),

               ##############################################.
               # SKILLS SHORTAGE VACANCIES----
               ##############################################.
               tabPanel(title = "Skills shortage vacancies",
                        value = "skills_shortage_vacancies",
                        icon = icon_no_warning_fn("person"),

                        h3("Skills shortage vacancies"),

                        #bsButton("jump_home_skills_shortage_vacancies", "Go to home page"),
                        bsButton("childcare_uptake_to_info", "Go to information page"),
                        br(),
                        br(),


                        actionButton(
                          "skills_shortage_vacancies_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        br(),
                        br(),
                        p("Use the below drop-down menu to select a region of interest."),


                        selectInput("region_skills_shortage",
                                    label = "Select Region",
                                    choices = unique(skills_shortage_vacancies$region),
                                    selected = "Scotland"),

                        plot_title(title_plot = "Percentage of skill shortage vacancies vs. all vacancies", "skills_shortage_graph_bar"),


                        h3("Skills shortage data table"),
                        DT::dataTableOutput("skills_shortage_data")
               ),



               ##############################################.
               # UNDEREMPLOYMENT----
               ##############################################.
               tabPanel(title = "Underemployment",
                        value = "underemployment",
                        icon = icon_no_warning_fn("down-long"),

                        h3("Underemployment"),

                        #bsButton("jump_home_underemployment", "Go to home page"),
                        bsButton("underemployment_to_info", "Go to information page"),
                        br(),
                        br(),


                        actionButton(
                          "underemployment_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton(
                          "underemployment_modal_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        h4("Proportion of adults 16 years old and over who are in employment and would like to work longer hours,
                       have an additional job or find a different job with more hours"),

                        selectizeInput("underemployment_input",
                                       label = "Select local authority",
                                       choices = underemployment$local_authority %>%
                                         unique(),
                                       selected = "Scotland"),

                        withSpinner(plotlyOutput("underemployment_graph_line")),


                        h3("Data table"),

                        withSpinner(DT::dataTableOutput("underemployment_table_data"))),

               ##############################################.
               # ECONOMIC INACTIVITY----
               ##############################################.
               tabPanel(title = "Economic inactivity",
                        value = "economic_inactivity",
                        icon = icon_no_warning_fn("people-arrows"),


                        h3("Economic inactivity"),

                        #bsButton("jump_home_economic_inactivity", "Go to home page"),
                        bsButton("economic_inactivity_to_info", "Go to information page"),
                        br(),
                        br(),


                        actionButton(
                          "economic_inactivity_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        p("Use the below drop-down menu to select a region of interest."),


                        selectInput("region_economic_inactivity",
                                    label = "Select Region",
                                    choices = unique(economic_inactivity$region),
                                    selected = "Scotland"),


                        plot_title(title_plot = "Percentage of economically inactive people aged 16 to 64 by willingness to work", "economic_inactivity_graph_line")
                        ,


                        h3("Economic inactivity data table"),
                        DT::dataTableOutput("economic_inactivity_data")


               ),


               ##############################################.
               # EMPLOYABILITY----
               ##############################################.
               tabPanel(title = "Employability",
                        value = "employability",
                        icon = icon_no_warning_fn("handshake"),

                        h3("Employability"),

                        #bsButton("jump_home_employability", "Go to home page"),
                        bsButton("employability_to_info", "Go to information page"),
                        br(),
                        br(),

                        h4("Number of starts by month"),#employability_FSS_start_month_reactive_text


                        actionButton(
                          "employability_FSS_start_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton(
                          "employability_FSS_start_modal_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        br(),
                        br(),

                        fluidRow(
                          column(2,p("Selected range of date:"),
                                 textOutput("employability_FSS_start_month_reactive_text"))
                          ,
                          column(10,

                                 sliderInput("employability_FSS_start_month_input",
                                             "Select range of months:",
                                             min = min(employability_FSS_start_month$year_quarter_date),
                                             max = max(employability_FSS_start_month$year_quarter_date),
                                             value=c(min(employability_FSS_start_month$year_quarter_date), max(employability_FSS_start_month$year_quarter_date)),
                                             timeFormat="%b %Y"))
                        ),

                        fluidRow(
                          column(5, withSpinner(plotlyOutput("employability_FSS_start_month_funnel_figure"))
                          ),
                          column(7, withSpinner(plotlyOutput("employability_FSS_start_month_figure"))
                          )
                        ),

                        h4("Number of referrals and starts (from referrals) by quarter"),

                        actionButton(
                          "employability_FSS_referral_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),
                        actionButton(
                          "employability_FSS_referral_modal_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),


                        br(),
                        br(),

                        fluidRow(column(2,p("Selected range of quarters:"),
                                        textOutput("employability_FSS_referral_reactive_text")
                        ),
                        column(10,
                               sliderInput("employability_FSS_referral_slider_input",
                                           "Select range of months:",
                                           min = min(employability_FSS_referral$year_quarter_date),
                                           max = max(employability_FSS_referral$year_quarter_date)+months(3),
                                           value=c(min(employability_FSS_referral$year_quarter_date), max(employability_FSS_referral$year_quarter_date)),
                                           timeFormat="%b %Y")
                        )),

                        fluidRow(
                          column(5, withSpinner(plotlyOutput("employability_FSS_referral_funnel_figure"))
                          ),
                          column(7, withSpinner(plotlyOutput("employability_FSS_referral_figure"))
                          )
                        ),


                        h3("Data table"),

                        withSpinner(DT::dataTableOutput("employability_FSS_referral_data"))

               ),

               ##############################################.
               # CONTRACTUALLY SECURE WORK----
               ##############################################.
               tabPanel(title = "Contractually secure work",
                        value = "contractually_secure_work",
                        icon = icon_no_warning_fn("person-digging"),

                        h3("Contractually secure work"),

                        #bsButton("jump_home_contractually_secure_work", "Go to home page")
               ),


               ##############################################.
               # GREEN JOBS----
               ##############################################.
               tabPanel(title = "Green jobs",
                        value = "green_jobs",
                        icon = icon_no_warning_fn("recycle"),

                        h3("Green jobs"),

                        #bsButton("jump_home_green_jobs", "Go to home page"),
                        bsButton("greenjobs_to_info", "Go to information page")
               )

  )

)
