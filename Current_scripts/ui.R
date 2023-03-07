##############################################.
# UI - USER INTERFACE ----
##############################################.
#shinymanager::secure_app(
  tagList(  #needed for shinyjs
    useShinyjs(),  # Include shinyjs
    # specify most recent fontawesome library
    tags$style("@import url(https://use.fontawesome.com/releases/v6.1.1/css/all.css);"),
    navbarPage(
      id = "intabset",# id used for jumping between tabs
      title = div(
        tags$a(img(src = "phs-logo.png", height = 40),
               href = "https://www.publichealthscotland.scot/",
               target = "_blank"),
        style = "position: relative; top: -5px;"),
      windowTitle = "PHS COVID-19 Recovery Dashboard",    #title for browser tab
      header = tags$head(includeCSS("www/styles.css"),  # CSS styles
                         tags$link(rel = "shortcut icon", href = "favicon_phs.ico"), #Icon for browser tab
                         #includeHTML("www/google-analytics.html"), #Including Google analytics
                         HTML("<html lang='en'>")
      ),

      ##############################################.
      # HOME TAB ----
      ##############################################.
      tabPanel(title = "Home",
               icon = icon_no_warning_fn("sitemap"),
               value = "home",

               h1("Public Health Scotland: COVID-19 Recovery Dashboard"),
               h2("Introduction"),

               p("The COVID-19 Recovery Dashboard is a source of intelligence to assess how Scotland is recovering from the",
                 " COVID-19 pandemic, using a range of indicators. The indicators used fall into 3 broad headings: Wellbeing of ",
                 "children and young people, financial security for low income households, and good, green jobs and fair work."),
               p("The latest data for each indicator can be quickly accessed from the summary tab. Each indicator also has ",
                 "a dedicated tab, giving more in-depth information and longer term trends in charts and data tables."),
               p("Use the below site map to explore the various tabs in the dashboard. The information and notes tab provides ",
                 "all data sources, methodology, and further information related to each indicator."),

               fluidRow(
                 h2("What's in this dashboard?")
               ),
               fluidRow(
                 column(6,
                        h3("Summary"),
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_summary",
                          title_box = "**Summary tab**",
                          description = "See the latest data for each indicator")
                 ),
                 column(6,
                        h3("Information and Notes"),
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_info_notes",
                          title_box = "**Information and notes tab**",
                          description = "Context and methodology for the indicators"
                        ))
               ),
               fluidRow(
                 h3("Wellbeing of children and young people"),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_child_poverty",
                          title_box = "**Child poverty**",
                          description = "Relative child poverty rate after housing costs")
                        ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_positive_destinations",
                          title_box = "**Positive destinations of school leavers**",
                          description = "Percentage of all school leavers in positive destinations at 9 month follow-up")
                        ),
                 column(4,
                        home_page_buttons_fn(
                          button_name = "jump_pre_school_development",
                          title_box = "**Pre-school development**",
                          description = "Percentage of children with a concern at their 27-30 month review")
                        ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_listen_to_decision_making",
                          title_box = "Being listened to/involved in decision making",
                          description = "Percentage of young people who feel adults take their views into account")
                        ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_camhs_waiting_times",
                          title_box = "**CAMHS waiting times**",
                          description = "Percentage of children and young people who were seen within 18 weeks of referral to CAMHS")
                        ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_protection_from_harm",
                          title_box = "**Protection from harm**",
                          description = "Number of children subject to Interagency Referral Discussions")
                        ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_infant_mortality",
                          title_box = "**Infant mortality**",
                          description = "Rate of infant deaths per 1,000 live births in Scotland")
                        ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_physical_activity",
                          title_box = "Physical activity",
                          description = "Percentage of P5-S6 children that had at least one hour of exercise the day before the survey")
                        ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_mental_health_wellbeing",
                          title_box = "Mental health and wellbeing",
                          description = "Mean score on Stirling wellbeing scale for P5-S1 children/WEMWBS for S2-S6")
                        )
                 ),


              h3("Financial security for low income households"),
               fluidRow(
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_fuel_affordability",
                          title_box = "**Fuel affordability**",
                          description = "Percentage of low income households in fuel poverty or extreme fuel poverty")
                 ),
                 column(4,
                        class="landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_household_spending",
                          title_box = "**Household Spending**",
                          description = "Proportion of total expenditure spent (including cost of living and food affordability")
                 ),
                 column(4,
                        class="landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_managing_financially",
                          title_box = "**Managing financially**",
                          description = "percentage of households with net annual household income of up to £30,000 report managing well financially")
                 ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_savings",
                          title_box = "**Savings**",
                          description = "Percentage of households with net annual household income of up to £30,000 that have no savings")
                 ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_unmanageable_debt",
                          title_box = "**Unmanageable debt**",
                          description = "Percentage of households where the households is falling behind with bills or credit commitments and either making excessive debt repayments")
                 ),
                 column(4,
                        class="landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_transport_costs",
                          title_box = "Transport costs",
                          description = "Proportion of household income spent on transport costs by low income households")
                 ),
                 column(4,
                        class="landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_childcare_uptake",
                          title_box = "**ELC Uptake**",
                          description = "Proportion of eligible children accessing 1140 hours of funded ELC")
                 ),
                 column(4,
                        class="landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_benefit_uptake",
                          title_box = "Benefit uptake and engagement with welfare advice",
                          description = "TBC")
                 )
               ),

               fluidRow(
                 h3("Good, green jobs and fair work"),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_employees_living_wage",
                          title_box = "**Employees on the living wage**",
                          description = "Proportion of employees (18+) earning less than the real Living Wage")
                        ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_gender_pay_gap",
                          title_box = "**Gender pay gap**",
                          description = "Difference between male and female full-time hourly earnings, as % of male full time hourly earnings")
                        ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_employment_gap",
                          title_box = "**Employment gap**",
                          description = "Difference between employment rates of disabled and non-disabled adults (16-64), and difference between employment rates of adults who are white and adults from minority ethnic groups")
                 ),

                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_zero_hours_contracts",
                          title_box = "**Zero-hours contracts**",
                          description = "Percentage of people in employment on a zero-hours contract")
                 ),

                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_skills_shortage_vacancies",
                          title_box = "**Skills shortage vacancies**",
                          description = "Proportion of establishments reporting at least one skills shortage vacancy")
                 ),

                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_underemployment",
                          title_box = "**Underemployment**",
                          description = "Proportion of adults 16 years old and over who are in employment and would like to work longer hours, have an additional job or find a different job with more hours")
                 ),

                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_economic_inactivity",
                          title_box = "**Economic inactivity**",
                          description = "Proportion of economically inactive adults 16-64 who want to work")
                 ),

                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_employability",
                          title_box = "**Employability**",
                          description = "Number of starts on Fair Start Scotland")
                 ),

                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_contractually_secure_work",
                          title_box = "Contractually secure work",
                          description = "Proportion of employees (aged 16 and above) in low income household who have a permanent contract")
                 ),
                 column(4,
                        class = "landing-page-column",
                        home_page_buttons_fn(
                          button_name = "jump_green_jobs",
                          title_box = "Green jobs",
                          description = "TBC")
                 )


               )),


      ##############################################.
      # INFORMATION TAB ----
      ##############################################.
      tabPanel(title = "Information and Notes",
               icon = icon_no_warning_fn("info-circle"),
               value = "information",

               h2("Information and Notes"),
                 fluidRow(
                   column(3,
                          radioButtons(inputId = "indicator_type_info",
                                       label = "1. Select indicator section",
                                       choices = c(unique(section_lookup$section))))),
                 fluidRow(
                   uiOutput("info_panel")
                 )

               ),

      ##############################################.
      # SUMMARY TAB ----
      ##############################################.

      tabPanel(title = "Summary",
               icon = icon_no_warning_fn("table"),
               value = "summary",

               h2("Summary Tables"),
               p("This page gives the latest data on each of the indicators within the COVID-19 Recovery Dashboard."),
               p("Please note the indicators use different reporting dates (e.g. month, financial year etc)
                 and therefore cannot be compared against each other. "),
               p("By using the buttons and drop-down menus below, you can explore each section of the dashboard's summary. ",
                 "Indicators can also be viewed at both health board and council area level when data are available at this level."),

               bsButton("jump_home_summary", "Go to home page"),
               bsButton("summary_to_info", "Go to information page"),

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

               ), # End of navbarMenu SUMMARY

      ##############################################.
      # WELLBEING OF CHILDREN AND YOUNG PEOPLE TAB----
      ##############################################.
      source(file.path("ui/UI_wellbeing.R"),local = TRUE)$value,

      ##############################################.
      # FINANCIAL SECURITY FOR LOW INCOME HOUSEHOLDS TAB ----
      ##############################################.
      source(file.path("ui/UI_financial_security.R"),local = TRUE)$value, # END OF FINANCIAL SECURITY UI


      ##############################################.
      # GOOD, GREEN JOBS AND FAIR WORK ----
      ##############################################.

      source(file.path("ui/UI_good_green.R"),local = TRUE)$value,

      ##############################################.
      # POPULATION HEALTH----
      ##############################################.


      source(file.path("ui/UI_population_health.R"), local = TRUE)$value
      )




      ) #END OF FLUIDPAGE (USER INTERFACE)



#) #END OF SECURE APP


