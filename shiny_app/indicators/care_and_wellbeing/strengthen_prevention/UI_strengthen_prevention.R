tagList(
  h1("Strengthen the role and impact of ill health prevention" ),
  br(),
  bsButton("strengthen_prevention_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),
  navlistPanel(widths = c(2,10), id = "strengthen_prevention_panel",


               ##############################################.
               # ADMISSIONS FOR ASTHMA----
               ##############################################.
               tabPanel(title = "Admissions for asthma",
                        value = "asthma_admissions",

                        h3("Admissions for asthma"),

                        fluidRow(column(3,
                                        selectInput("asthma_admissions_breakdowns",
                                                    "Step 1: Select a breakdown ",
                                                    choices = c("Yearly total", "Age breakdown", "Sex breakdown"),
                                                    width = "100%")),
                                 column(3,
                                         selectInput("asthma_admissions_geog_type",
                                                    "Step 2: Select national or local geography level ",
                                                     choices = c("Scotland", "Health Board"),
                                                     width = "100%")),
                                 column(3,
                                 selectInput("asthma_admissions_geog_name",
                                             "Step 3: Select national or local geography area ",
                                             choices = c("Scotland"),
                                             width = "100%"))

                        ),#, "Age and sex breakdown"))),
                        # column(3,
                        #        uiOutput("asthma_admissions_years_ui"))),

                        altTextUI("asthma_admissions_alt"),
                        plot_title("Total number of admissions for asthma", "asthma_admissions_plot"),
                        # plotlyOutput("asthma_admissions_plot"),

                        br(),
                        h3(textOutput("asthma_admissions_title")),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                        br(),
                        dataDownloadUI("asthma_admissions")


               ),

               ##############################################.
               # ALCOHOL: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
               ##############################################.

               tabPanel(title = "Alcohol: deaths and first hospital admissions (under 75)",
                        value = "alcohol",

                        tabBox( title = "", id = "alcohol_tabBox", width = NULL,


                                ##############################################.
                                # ALCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
                                ##############################################.

                                tabPanel(title = "Alcohol-related hospital admissions",
                                         value = "alcohol_admissions",

                                         h3("Alcohol related hospital admissions"),

                                         fluidRow(
                                           column(3,
                                                selectInput("alcohol_admissions_geog_type",
                                                            "Step 1: Select national or local geography level",
                                                            choices = c("Scotland", "Health Board"),
                                                            width = "100%")),
                                         column(3,
                                                selectInput("alcohol_admissions_geog_name",
                                                            "Step 2: Select national or local geography area",
                                                            choices = c("Scotland"),
                                                            width = "100%"))),

                                         plotlyOutput("alcohol_admissions_plot"),

                                         br(),
                                         h3(textOutput("alcohol_admissions_title")),
                                         p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                                         br(),
                                         dataDownloadUI("alcohol_related_admissions")
                                ),


                                ##############################################.
                                # ALCOHOL SPECIFIC DEATHS  (aged 45-74)----
                                ##############################################.

                                tabPanel(title = "Alcohol specific deaths",
                                         value = "alcohol_deaths",

                                         h3("Alcohol specific deaths"),

                                         fluidRow(
                                           column(3,
                                                  selectizeInput("alcohol_deaths_sex",
                                                                 "Select sex",
                                                                 choices = unique(alcohol_deaths$sex),
                                                                 selected = "Persons"))
                                         ),

                                         plot_title("Rate of alcohol-specific deaths (result of intentional self harm orundetermined intent) in Scotland",
                                                    "alcohol_deaths_plot"),

                                         h3("Data Table"),
                                         DT::dataTableOutput("alcohol_deaths_table")
                                )
                        )),

               ##############################################.
               # ALL-CAUSE MORTALITY (15-44)----
               ##############################################.

               tabPanel(title = "All-cause mortality",
                        value = "all_cause_mortality",

                        h3("All-cause mortality (ages 15-44)"),

                        fluidRow(
                          column(3,
                                 selectizeInput("all_cause_mortality_geog_type",
                                                "Step 1. Select national or local geography level",
                                                choices = c("Scotland",
                                                            "Health Board",
                                                            "Council Area"))),
                          column(3,
                                 selectizeInput("all_cause_mortality_geog_name",
                                                "Step 2. Select national or local geography area",
                                                choices = unique(all_cause_mortality %>% filter(geography_type == "Scotland") %>% .$geography))),
                          column(3,
                                 radioButtons("all_cause_mortality_rate_number",
                                              "Step 3. View rate per 100,000 population or number of deaths",
                                              choices = c("Rate",
                                                          "Number")))

                        ),


                        h3("All-cause mortality, ages 15-44"),
                        plotlyOutput("all_cause_mortality_plot"),
                        h3("Data table"),
                        DT::dataTableOutput("all_cause_mortality_table")


               ),


               ##############################################.
               # CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
               ##############################################.

               tabPanel(title = "Coronary heart disease (CHD): deaths (age 45-74)",
                        value = "chd_deaths",

                        h3("Coronary heart disease (CHD): deaths (age 45-74)"),

                        fluidRow(
                          column(3,
                                 selectizeInput("chd_deaths_geog_type",
                                                "Step 1. Select national or local geography level",
                                                choices = c("Scotland",
                                                            "Health Board",
                                                            "HSCP",
                                                            "Council Area",
                                                            "Locality",
                                                            "Intermediate Zone")),
                          ),
                          column(3,
                                 selectizeInput("chd_deaths_geog_name",
                                                "Step 2. Select national or local geography area",
                                                choices = unique(chd_deaths %>% filter(geography_type == "Scotland") %>% .$geography))),
                        ),

                        plot_title("Coronary heart disease deaths (age 45-74), age-sex standardised rates per 100,000",
                                   "chd_deaths_plot",
                                   subtitle = "The shaded line indicates confidence intervals"),

                        h3("Data table"),
                        DT::dataTableOutput("chd_deaths_table")



               ),

               ##############################################.
               # DRUGS: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
               ##############################################.

               tabPanel(title = "Drugs: deaths and hospital admissions (under 75)",
                        value = "drugs",

                        tabBox(title = "", id = "drugs_tabBox", width = NULL,

                               ##############################################.
                               # DRUG RELATED HOSPITAL ADMISSIONS ----
                               ##############################################.


                               tabPanel(title = "Drug-related hospital admissions",
                                        value = "drug_admissions",

                                        h3("Drug-related hospital admissions"),


                                        selectizeInput("drug_admissions_age", "Select an age group",
                                                       choices = unique(drug_stays$age_group)),

                                        plot_title("Age-sex standardised rate of drug-related hospital admissions, Scotland",
                                                   "drug_admissions_plot"),

                                        h3("Data table"),

                                        DT::dataTableOutput("drug_admissions_table")
                               ),


                               ##############################################.
                               # DRUG RELATED DEATHS----
                               ##############################################.

                               tabPanel(title = "Drug-related deaths",
                                        value = "drug_deaths",

                                        h3("Drug related deaths"),

                                        fluidRow(
                                          column(3,
                                                 selectizeInput("drug_deaths_geog_type",
                                                                "Step 1. Select a national or local geography level",
                                                                choices = c("Scotland", "Health Board", "Council Area"))),

                                          column(3,

                                                 selectizeInput("drug_deaths_geog_name",
                                                                "Step 2. Select a national or local geography area",
                                                                choices = unique(drug_related_deaths %>% filter(geography_type == "Scotland") %>%  .$geography))
                                          ),

                                          column(3,
                                                 radioButtons("drug_deaths_rate_number",
                                                              "3. View rate per 100,000 population or number of deaths",
                                                              choices = c("Rate",
                                                                          "Number")))
                                        ),

                                        plot_title("Drug misuse deaths by 5 year periods",
                                                   "drug_deaths_plot",
                                                   subtitle = "Please note, rates based on fewer than 10 deaths are not shown"),

                                        h3("Data table"),
                                        DT::dataTableOutput("drug_deaths_table")



                               ))),

               ##############################################.
               # EXPERIENCE OF SOCIAL CARE RECIPIENTS----
               ##############################################.


               tabPanel(title = "Experience of social care recipients ",
                        value = "experience_recipients",

                        h3("Experience of social care recipients")

               ),

               ##############################################.
               # EXPERIENCE OF UNPAID CARERS----
               ##############################################.


               tabPanel(title = "Experience of unpaid carers ",
                        value = "experience_of_unpaid_carers",

                        h3("Experience of unpaid carers"),

                        h4("Percentage of unpaid carers who agree with the sentence “I feel supported to continue caring“"),

                        plotlyOutput("experience_unpaid_carers_plot"),

                        DT::dataTableOutput("experience_unpaid_carers_table")
               ),


               ##############################################.
               # FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACK (<75)----
               ##############################################.
               tabPanel(title = "First ever hospital admission for heart attack (under 75)",
                        value = "hospital_admission_heart_attack",

                        h2("First ever hospital admission for heart attack (under 75)"),

                        plot_title("Total number of first ever hopsital admissions for heart attack (under 75) annually in Scotland",
                                   "hospital_admission_heart_attack_plot"),

                        h3("Data table"),
                        DT::dataTableOutput("hopsital_admission_heart_attack_table")


               ),

               ##############################################.
               # HEALTH RISK BEHAVIOURS----
               ##############################################.

               tabPanel(title = "Health risk behaviours",
                        value = "health_risk_behaviours",

                        h3("Health risk behaviours")
               ),

               ##############################################.
               # HEALTHY BIRTHWEIGHT----
               ##############################################.

               tabPanel(title = "Healthy birthweight",
                        value = "healthy_birthweight",

                        h3("Healthy birthweight"),


                        fluidRow(
                          column(3,
                                 selectizeInput("healthy_birthweight_geog_type",
                                                "Step 1. Select a national or local geography level",
                                                choices = c("Scotland", "Health Board", "Council Area"))),

                          column(3,
                                 selectizeInput("healthy_birthweight_geog_name",
                                                "Step 2. Select a national or local geography area",
                                                choices = unique(birthweight %>% filter(geography_type == "Scotland") %>% .$geography))
                          )),

                        plot_title("Birthweight of babies based on gestational age by financial year",
                                   "healthy_birthweight_plot"),

                        DT::dataTableOutput("healthy_birthweight_table")),


               ##############################################.
               # HEALTHY LIFE EXPECTANCY----
               ##############################################.

               tabPanel(title = "Healthy life expectancy",
                        value = "healthy_life_expctancy",

                        h3("Healthy life expectancy")
               ),

               ##############################################.
               # HEALTHY WEIGHT ADULTS----
               ##############################################.

               tabPanel(title = "Healthy weight adults",
                        value = "healthy_weight",

                        h3("Healthy weight adults")
               ),

               ##############################################.
               #  LIMITING LONG-TERM CONDITIONS (16+)----
               ##############################################.
               tabPanel(title = "Limiting long-term conditions (age 16+)",
                        value = "adult_long_term_condition",

                        h3("Limiting long-term conditions (age 16+)"),

                        h4("Percentage of adults with a limiting long-term condition"),

                        plotlyOutput("adult_long_term_condition_plot"),

                        DT::dataTableOutput("adult_long_term_condition_table")
               ),

               ##############################################.
               # MENTAL WELLBEING OF ADULTS (16+)----
               ##############################################.

               tabPanel(title = "Mental wellbeing of adults (16+)",
                        value = "mental_wellbeing",

                        h3("Mental wellbeing of adults (16+)")
               ),

               ##############################################.
               # PHYSICAL ACTIVITY----
               ##############################################.

               tabPanel(title = "Physical activity",
                        value = "physical_activity",

                        h3("Physical activity")
               ),

               ##############################################.
               # PREMATURE MORTALITY----
               ##############################################.

               tabPanel(title = "Premature mortality",
                        value = "premature_mortality",

                        h3("Premature mortality")
               ),

               ##############################################.
               # QUALITY OF CARE EXPERIENCE----
               ##############################################.

               tabPanel(title = "Quality of care experience",
                        value = "quality_care",

                        h3("Quality of care experience")
               ),

               ##############################################.
               # SCREENING UPTAKE FOR BREAST AND BOWEL CANCER----
               ##############################################.
               tabPanel(title = "Screening uptake",
                        value = "screening",

                        h3("Screening uptake")
               ),

               ##############################################.
               #  SELF-ASSESSED HEALTH OF ADULTS (16+)----
               ##############################################.
               tabPanel(title = "Self-assessed health of adults (age 16+)",
                        value = "adult_self_assessed_health",

                        h3("Self-assessed health of adults (age 16+)"),

                        h4("Percentage of adults who describe their general health as good or very good in Scotland over time"),

                        plotlyOutput("adult_self_assessed_health_plot"),

                        DT::dataTableOutput("adult_self_assessed_health_table")
               ),

               ##############################################.
               # VACCINATIONS UPTAKE----
               ##############################################.
               tabPanel(title = "Vaccinations uptake",
                        value = "vaccinations",

                        h3("Vaccinations uptake")
               ),

               ##############################################.
               # WORK-RELATED ILL HEALTH----
               ##############################################.

               tabPanel(title = "Work-related ill health",
                        value = "work_related_health",

                        h3("Work-related ill health")
               ),

) # navlistpanel
) # tagList
