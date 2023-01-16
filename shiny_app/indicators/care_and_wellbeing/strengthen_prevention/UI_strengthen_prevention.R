tagList(
  h1("Strengthen the role and impact of ill health prevention" ),
  br(),
  #bsButton("adult_risk_to_info", "Go to 'Adult risk of health' information page", class = "to_info-btn"),
  h4(strong("Select indicator: ")),
  navlistPanel(widths = c(2,10),

               ##############################################.
               # HEALTHY LIFE EXPECTANCY----
               ##############################################.

               tabPanel(title = "Healthy life expectancy",
                        value = "healthy_life_expctancy",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Healthy life expectancy")
               ),

               ##############################################.
               # MENTAL WELLBEING OF ADULTS (16+)----
               ##############################################.

               tabPanel(title = "Mental wellbeing of adults (16+)",
                        value = "mental_wellbeing",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Mental wellbeing of adults (16+)")
               ),

               ##############################################.
               # HEALTHY WEIGHT ADULTS----
               ##############################################.

               tabPanel(title = "Healthy weight adults",
                        value = "healthy_weight",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Healthy weight adults")
               ),

               ##############################################.
               # HEALTH RISK BEHAVIOURS----
               ##############################################.

               tabPanel(title = "Health risk behaviours",
                        value = "health_risk_behaviours",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Health risk behaviours")
               ),

               ##############################################.
               # PHYSICAL ACTIVITY----
               ##############################################.

               tabPanel(title = "Physical Activity",
                        value = "physical_activity",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Physical Activity")
               ),

               ##############################################.
               # QUALITY OF CARE EXPERIENCE----
               ##############################################.

               tabPanel(title = "Quality of care experience",
                        value = "quality_care",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Quality of care experience")
               ),

               ##############################################.
               # JOURNEYS BY ACTIVE TRAVEL----
               ##############################################.

               tabPanel(title = "Journeys by active travel",
                        value = "journeys_active",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Journeys by active travel")
               ),

               ##############################################.
               # WORK-RELATED ILL HEALTH----
               ##############################################.

               tabPanel(title = "Work-related ill health",
                        value = "work_related_health",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Work-related ill health")
               ),

               ##############################################.
               # PREMATURE MORTALITY----
               ##############################################.

               tabPanel(title = "Premature mortality",
                        value = "premature_mortality
",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Premature mortality")
               ),

               ##############################################.
               # ALL-CAUSE MORTALITY (15-44)----
               ##############################################.

               tabPanel(title = "All-cause mortality",
                        value = "all_cause_mortality",
                        icon = icon_no_warning_fn("file-waveform"),

                        h3("All-cause mortality (ages 15-44)"),

                        fluidRow(
                          column(2,
                                 selectizeInput("geog_type_mortality",
                                                "1. Select geography type",
                                                choices = c("Scotland",
                                                            "Health Board",
                                                            "Council Area"))),
                          column(2,
                                 uiOutput("mortality_input_ui")),
                          column(8,
                                 radioButtons("rate_number_mortality",
                                              "3. View rate per 100,000 population or number of deaths",
                                              choices = c("Rate",
                                                          "Number")))

                        ),


                        h3("All-cause mortality, ages 15-44"),
                        plotlyOutput("mortality_line_chart"),
                        h3("Data table"),
                        DT::dataTableOutput("mortality_data")


               ),

               ##############################################.
               # CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
               ##############################################.

               tabPanel(title = "Coronary Heart Disease (CHD): deaths (age 45-74)",
                        value = "chd_deaths",
                        icon = icon_no_warning_fn("heart"),


                        h3("Coronary Heart Disease (CHD): deaths (age 45-74)"),

                        fluidRow(
                          column(2,
                                 selectizeInput("geog_type_chd",
                                                "1. Select geography type",
                                                choices = c("Scotland",
                                                            "Health Board",
                                                            "HSCP",
                                                            "Council Area",
                                                            "Locality",
                                                            "Intermediate Zone"))
                          ),
                          column(10,
                                 uiOutput("chd_input_ui"))
                        ),

                        plot_title("Coronary heart disease deaths (aged <75), age-sex standardised rates per 100,000",
                                   "chd_CI_chart",
                                   subtitle = "The shaded line indicates confidence intervals"),

                        h3("Data table"),
                        DT::dataTableOutput("chd_data")



               ),

               ##############################################.
               # FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACK (<75)----
               ##############################################.
               tabPanel(title = "First ever hospital admission for heart attack (under 75)",
                        value = "hospital_admission_heart_attack",
                        icon = icon_no_warning_fn("lemon"),

                        h3("First ever hospital admission for heart attack (under 75)")


               ),


               ##############################################.
               # DRUGS: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
               ##############################################.

               tabPanel(title = "Drugs: deaths and hospital admissions (under 75)",
                        value = "drugs",
                        icon = icon_no_warning_fn("lemon"),

                   tabBox( title = "", id = "drugs_tabBox", width = NULL,

                        ##############################################.
                        # DRUG RELATED HOSPITAL ADMISSIONS ----
                        ##############################################.


                   tabPanel(title = "Drug-related hospital admissions",
                          value = "drug_related_admissions",
                          icon = icon_no_warning_fn("lemon"),

                          h3("Drug related hospital admissions"),


                          selectizeInput("age_drugstays", "Select an age group",
                                         choices = unique(drug_stays$age_group)),

                          plot_title("Age-sex standardised rate of drug-related hospital admissions, Scotland",
                                     "drugstays"),

                          h3("Data table"),

                          DT::dataTableOutput("drugstays_data")
               ),


                         ##############################################.
                         # DRUG RELATED DEATHS----
                         ##############################################.

               tabPanel(title = "Drug-related deaths",
                          value = "drug_deaths",
                          icon = icon_no_warning_fn("lemon"),

                          h3("Drug related deaths"),



                          fluidRow(
                            column(2,
                                   selectizeInput("geog_type_drug_deaths", "1. Select a geography type",
                                                  choices = c("Scotland", "Health Board", "Council Area"))),

                            column(2,

                                   uiOutput("geography_drug_deaths")),

                            column(8,
                                   radioButtons("rate_number_drug_deaths",
                                                "3. View rate per 100,000 population or number of deaths",
                                                choices = c("Rate",
                                                            "Number")))
                          ),

                          plot_title("Drug misuse deaths by 5 year periods",
                                     "drug_deaths_chart",
                                     subtitle = "Please note, rates based on fewer than 10 deaths are not shown"),

                          h3("Data table"),
                          DT::dataTableOutput("drug_deaths_data")



                 ))),

               ##############################################.
               # ALCOHOL: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
               ##############################################.

               tabPanel(title = "Alcohol: deaths and first hospital admissions (under 75)",
                        value = "alcohol",
                        icon = icon_no_warning_fn("lemon"),

                tabBox( title = "", id = "alcohol_tabBox", width = NULL,


                        ##############################################.
                        # ALCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
                        ##############################################.

                 tabPanel(title = "Alcohol-related hospital admissions",
                        value = "alcohol_admissions",
                        icon = icon_no_warning_fn("wine-bottle"),

                        h3("Alcohol related hospital admissions"),


                        selectizeInput("hb_alcohol_admissions","Select Health Board",
                                       choices = unique(alcohol_admissions$sub_group_select_group_first)),

                        plotlyOutput("alcohol_admissions_plot")
               ),


                         ##############################################.
                         # ALCOHOL SPECIFIC DEATHS  (aged 45-74)----
                         ##############################################.

               tabPanel(title = "Alcohol specific deaths",
                          value = "alcohol_specific_deaths",
                          icon = icon_no_warning_fn("lemon"),

                          h3("Alcohol specific deaths"),

                          fluidRow(
                            column(3,
                                   selectizeInput("choose_sex_alcohol_deaths",
                                                  "1. Select sex",
                                                  choices = unique(alcohol_deaths$sex),
                                                  selected = "Persons"))
                          ),

                          plot_title("Rate of Alcohol-Specific Deaths (result of intentional self harm orundetermined intent) in Scotland",
                                     "alcohol_deaths_plot"),

                          h3("Data Table"),
                          DT::dataTableOutput("alcohol_deaths_data_table")
                          )
               )),


               ##############################################.
               # HEALTHY BIRTHWEIGHT----
               ##############################################.

               tabPanel(title = "Healthy birthweight",
                        value = "healthy_birthweight",
                        icon = icon_no_warning_fn("baby"),

                        h3("Healthy birthweight"),


                        fluidRow(
                          column(2,
                                 selectizeInput("geog_type_healthy_birthweight", "1. Select a geography type",
                                                choices = c("Scotland", "Health Board", "Council Area"))),

                          column(10,
                                 uiOutput("geography_healthy_birthweight"))),

                        plot_title("Birthweight of babies based on gestational age by financial year",
                                   "healthy_birthweight_stacked_chart"),

                        DT::dataTableOutput("healthy_birthweight_data")),





               ##############################################.
               #  SELF-ASSESSED HEALTH OF ADULTS (16+)----
               ##############################################.
               tabPanel(title = "Self-assessed health of adults (age 16+)",
                        value = "adult_self_assessed_health",
                        icon = icon_no_warning_fn("notes-medical"),

                        h3("Self-assessed health of adults (age 16+)"),

                        h4("Percentage of adults who describe their general health as good or very good in Scotland over time"),

                        plotlyOutput("adult_self_assessed_health_plot"),

                        DT::dataTableOutput("adult_self_assessed_health_table")
               ),


               ##############################################.
               #  LIMITING LONG-TERM CONDITIONS (16+)----
               ##############################################.
               tabPanel(title = "Limiting long-term conditions (age 16+)",
                        value = "adult_long_term_condition",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Limiting long-term conditions (age 16+)"),

                        h4("Percentage of adults with a limiting long-term condition"),

                        plotlyOutput("adult_long_term_condition_plot"),

                        DT::dataTableOutput("adult_long_term_condition_table")
               ),

               ##############################################.
               # ADMISSIONS FOR ASTHMA----
               ##############################################.
               tabPanel(title = "Admissions for asthma",
                        value = "asthma",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Admissions for asthma")


               ),

               ##############################################.
               # SCREENING UPTAKE FOR BREAST AND BOWEL CANCER----
               ##############################################.
               tabPanel(title = "Screening uptake",
                        value = "screening",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Screening uptake")
               ),

               ##############################################.
               # VACCINATIONS UPTAKE----
               ##############################################.
               tabPanel(title = "Vaccinations uptake",
                        value = "vaccinations",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Vaccinations uptake")
               ),

               ##############################################.
               # EXPERIENCE OF SOCIAL CARE RECIPIENTS----
               ##############################################.


               tabPanel(title = "Experience of social care recipients ",
                        value = "experience_recipients",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Experience of social care recipients")

               ),

               ##############################################.
               # EXPERIENCE OF UNPAID CARERS----
               ##############################################.


               tabPanel(title = "Experience of unpaid carers ",
                        value = "experience_of_unpaid_carers",
                        icon = icon_no_warning_fn("hand-holding-hand"),

                        h3("Experience of unpaid carers"),

                        h4("Percentage of unpaid carers who agree with the sentence “I feel supported to continue caring“"),

                        plotlyOutput("experience_unpaid_carers_plot"),

                        DT::dataTableOutput("experience_unpaid_carers_table")


               )
  ) # navlistpanel
) # tagList
