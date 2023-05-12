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

                        h2("Admissions for asthma", iButtonUI("asthma_admissions", content = "Paste background info and source for asthma here")),

                        fluidRow(column(4,
                                        selectInput("asthma_admissions_breakdowns",
                                                    "Step 1: Select a breakdown ",
                                                    choices = c("Yearly total", "Age breakdown", "Sex breakdown"),
                                                    width = "100%")),
                                 column(4,
                                        selectInput("asthma_admissions_geog_type",
                                                    "Step 2: Select national or local geography level ",
                                                    choices = c("Scotland", "Health Board"),
                                                    width = "100%")),
                                 column(4,
                                        selectInput("asthma_admissions_geog_name",
                                                    "Step 3: Select national or local geography area ",
                                                    choices = c("Scotland"),
                                                    width = "100%"))

                        ),#, "Age and sex breakdown"))),
                        # column(3,
                        #        uiOutput("asthma_admissions_years_ui"))),

                        altTextUI("asthma_admissions_alt"),
                        #plot_title("Total number of admissions for asthma", "asthma_admissions_plot"),
                        withSpinner(plotlyOutput("asthma_admissions_plot")),

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

                        tabBox( title = "", id = "alcohol_tabBox", type = "pills", width = NULL,


                                ##############################################.
                                # ALCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
                                ##############################################.

                                tabPanel(title = "Alcohol-related hospital admissions",
                                         value = "alcohol_admissions",

                                         h2("Alcohol related hospital admissions", iButtonUI("alcohol_admissions", content = "Paste background info and source for alcohol admissions here")),

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

                                         withSpinner(plotlyOutput("alcohol_admissions_plot")),

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

                                         h2("Alcohol specific deaths", iButtonUI("alcohol_deaths", content = "Paste background info and source for alcohol deaths here")),

                                         fluidRow(
                                           column(3,
                                                  selectizeInput("alcohol_deaths_sex",
                                                                 "Select sex",
                                                                 choices = unique(alcohol_deaths$sex),
                                                                 selected = "All sexes"))
                                         ),

                                         plot_title("Alcohol specific deaths and age-standardised mortality rates (ASMR) by sex",
                                                    "alcohol_deaths_plot"),

                                         br(),
                                         br(),

                                         plot_title("Rate of alcohol-specific deaths (result of intentional self harm or undetermined intent) in Scotland",
                                                    "alcohol_deaths_by_age_plot"),

                                         h3("Data Table"),
                                         DT::dataTableOutput("alcohol_deaths_table")
                                )
                        )),

               ##############################################.
               # ALL-CAUSE MORTALITY (15-44)----
               ##############################################.

               tabPanel(title = "All-cause mortality",
                        value = "all_cause_mortality",

                        h2("All-cause mortality (ages 15-44)", iButtonUI("all_cause_mortality",
                                                                         content = paste("This indicator uses the National Records of Scotland\\'s (NRS\\'s) statistics of deaths",
                                                                                         "You can find more information about this",
                                                                                         "<a href = https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/deaths-time-series-data target = _blank> here. </a>",
                                                                                         "Information about the background of the statistics can be found on the NRS site:",
                                                                                         "<a href = https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/general-background-information, target = _blank> Vital Events – General Background Information </a>",
                                                                                         "and",
                                                                                         "<a href = https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/deaths-background-information, target = _blank> Deaths – Background Information. </a>"))),

                        fluidRow(
                          column(4,
                                 selectizeInput("all_cause_mortality_geog_type",
                                                "Step 1. Select national or local geography level",
                                                choices = c("Scotland",
                                                            "Health Board",
                                                            "Council Area"),
                                                width = "100%")),
                          column(4,
                                 selectizeInput("all_cause_mortality_geog_name",
                                                "Step 2. Select national or local geography area",
                                                choices = unique(all_cause_mortality %>% filter(geography_type == "Scotland") %>% .$geography),
                                                width = "100%")),
                          column(4,
                                 radioButtons("all_cause_mortality_rate_number",
                                              "Step 3. View rate per 100,000 population or number of deaths",
                                              choices = c("Rate",
                                                          "Number"),
                                              width = "100%"))

                        ),


                        altTextUI("all_cause_mortality_alt"),
                        withSpinner(plotlyOutput("all_cause_mortality_plot")),

                        br(),
                        h3(textOutput("all_cause_mortality_title")),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                        br(),
                        dataDownloadUI("all_cause_mortality")


               ),


               ##############################################.
               # CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
               ##############################################.

               tabPanel(title = "Coronary heart disease (CHD): deaths (age 45-74)",
                        value = "chd_deaths",

                        h2("Coronary heart disease (CHD): deaths (age 45-74)",
                           iButtonUI("chd_deaths", content = paste("This indicator uses SMR data and covers early deaths from coronary",
                                                                   "heart disease (CHD). Heart disease is a broad term for a variety of",
                                                                   "conditions that affect the structure and function of the heart.",
                                                                   "The most common type of heart disease is coronary heart disease (CHD)",
                                                                   "where the blood vessels carrying oxygen-rich blood (coronary arteries)",
                                                                   "to the heart muscle become narrowed or blocked. If insufficient blood",
                                                                   "reaches the heart muscle the result can be damage to the heart muscle",
                                                                   "which is known as a heart attack.",
                                                                   "<br> <br>",
                                                                   "Public Health Scotland publishes a range of heart disease-related information.",
                                                                   "You can find all our information on the heart disease section of the",
                                                                   "<a href=https://beta.isdscotland.org/topics/heart-disease-and-stroke/> Data and Intelligence website. </a>"))),

                        fluidRow(
                          column(4,
                                 selectizeInput("chd_deaths_geog_type",
                                                "Step 1. Select national or local geography level",
                                                choices = c("Scotland",
                                                            "Health Board",
                                                            "HSCP",
                                                            "Council Area",
                                                            "Locality",
                                                            "Intermediate Zone"),
                                                width = '100%'),
                          ),
                          column(4,
                                 selectizeInput("chd_deaths_geog_name",
                                                "Step 2. Select national or local geography area",
                                                choices = unique(chd_deaths %>% filter(geography_type == "Scotland") %>% .$geography),
                                                width = '100%')),
                        ),

                        altTextUI("chd_deaths_alt"),
                        ciDefinitionUI("chd_deaths_ci"),
                        withSpinner(plotlyOutput("chd_deaths_plot")),

                        br(),
                        h3(textOutput("chd_deaths_title")),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                        br(),
                        dataDownloadUI("chd_deaths")



               ),

               ##############################################.
               # DRUGS: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
               ##############################################.

               tabPanel(title = "Drugs: deaths and hospital admissions (under 75)",
                        value = "drugs",

                        tabBox(title = "", id = "drugs_tabBox", type = "pills", width = NULL,

                               ##############################################.
                               # DRUG RELATED HOSPITAL ADMISSIONS ----
                               ##############################################.


                               tabPanel(title = "Drug-related hospital admissions",
                                        value = "drug_admissions",

                                        h2("Drug-related hospital admissions", iButtonUI("drug_admissions", content = "Paste background info and source for drug admissions here")),


                                        selectizeInput("drug_admissions_age", "Select an age group",
                                                       choices = unique(drug_stays$age_group),
                                                       selected = "All age groups",
                                                       multiple = TRUE,
                                                       options = list(plugins = c('remove_button'),
                                                                      `actions-box` = TRUE)),

                                        #plot_title("Age-sex standardised rate of drug-related hospital admissions, Scotland",
                                        #           "drug_admissions_plot"),
                                        withSpinner(plotlyOutput("drug_admissions_plot")),

                                        br(),
                                        h3(textOutput("drug_admissions_title")),
                                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                                        br(),
                                        dataDownloadUI("drug_admissions")
                               ),


                               ##############################################.
                               # DRUG RELATED DEATHS----
                               ##############################################.

                               tabPanel(title = "Drug-related deaths",
                                        value = "drug_deaths",

                                        h2("Drug related deaths", iButtonUI("drug_deaths", content = "Paste background info and source for drug deaths here")),

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

                                        #plot_title("Drug misuse deaths by 5 year periods",
                                        #           "drug_deaths_plot",
                                        #          subtitle = "Please note, rates based on fewer than 10 deaths are not shown"),
                                        withSpinner(plotlyOutput("drug_deaths_plot")),

                                        br(),
                                        h3(textOutput("drug_deaths_title")),
                                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                                        br(),
                                        dataDownloadUI("drug_deaths")



                               ))),

               ##############################################.
               # EXPERIENCE OF SOCIAL CARE RECIPIENTS----
               ##############################################.


               tabPanel(title = "Experience of social care recipients ",
                        value = "experience_recipients",

                        h2("Experience of social care recipients")

               ),

               ##############################################.
               # EXPERIENCE OF UNPAID CARERS----
               ##############################################.


               tabPanel(title = "Experience of unpaid carers ",
                        value = "experience_of_unpaid_carers",

                        h2("Experience of unpaid carers", iButtonUI("experience_unpaid_carers", content = "Paste background info and source for experience of unpaid carers here")),

                        #h4("Percentage of unpaid carers who agree with the sentence “I feel supported to continue caring“"),

                        withSpinner(plotlyOutput("experience_unpaid_carers_plot")),

                        br(),
                        h3('Data table: Percentage of unpaid carers who agree with the sentence: "I feel supported to continue caring"'),
                        br(),
                        dataDownloadUI("experience_unpaid_carers")
               ),


               ##############################################.
               # FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACK (<75)----
               ##############################################.
               tabPanel(title = "First ever hospital admission for heart attack (under 75)",
                        value = "hospital_admission_heart_attack",

                        h2("First ever hospital admission for heart attack (under 75)",
                           iButtonUI("heart_attack_admission",
                                     content = paste(""))),

                        altTextUI("hospital_admission_heart_attack_alt"),
                        withSpinner(plotlyOutput("hospital_admission_heart_attack_plot")),

                        br(),
                        h3("Data table: Total number of first ever hospital admissions for heart attack (under 75) in Scotland"),
                        br(),
                        dataDownloadUI("heart_attack_admission")


               ),

               ##############################################.
               # HEALTH RISK BEHAVIOURS----
               ##############################################.

               tabPanel(title = "Health risk behaviours",
                        value = "health_risk_behaviours",

                        h2("Health risk behaviours")
               ),

               ##############################################.
               # HEALTHY BIRTHWEIGHT----
               ##############################################.

               tabPanel(title = "Healthy birthweight",
                        value = "healthy_birthweight",

                        h2("Healthy birthweight", iButtonUI("healthy_birthweight",
                                                            content = paste("This indicator uses data from the Public Health Scotland Births",
                                                                            "in Scotland publication related to pregnancy, childbirth and early",
                                                                            "care of babies in Scotland. The health of a pregnant woman and her",
                                                                            "baby are closely linked and are influenced by a number of different",
                                                                            "factors during pregnancy, childbirth and the early period after birth.",
                                                                            "These data are presented at a national level and broken down by local",
                                                                            "geographies. More information can be found ",
                                                                            "<a href = https://publichealthscotland.scot/publications/births-in-scotland/births-in-scotland-year-ending-31-march-2022/ target = _blank > here. </a>",
                                                                            "<br> <br> ",
                                                                            "Data on the appropriateness of birthweights for gestational age at birth,",
                                                                            "for live singleton births only. It is important to be able to",
                                                                            "differentiate between babies who are light because they are preterm",
                                                                            "and those who are inappropriately light after adjustment for gestational",
                                                                            "age at birth. <br> <br> Babies are identified as appropriate weight for gestational",
                                                                            "age with a birthweight between the 10th and 90th percentiles. Babies",
                                                                            "identified as small or large for gestational age are those whose birthweight",
                                                                            "is under the 10th or over the 90th percentile respectively."))),


                        fluidRow(
                          column(4,
                                 selectizeInput("healthy_birthweight_geog_type",
                                                "Step 1. Select a national or local geography level",
                                                choices = c("Scotland", "Health Board", "Council Area"),
                                                width = "100%")),

                          column(4,
                                 selectizeInput("healthy_birthweight_geog_name",
                                                "Step 2. Select a national or local geography area",
                                                choices = unique(birthweight %>% filter(geography_type == "Scotland") %>%
                                                                   .$geography),
                                                width = "100%")
                          )),

                        altTextUI("healthy_birthweight_alt"),
                        withSpinner(plotlyOutput("healthy_birthweight_plot")),

                        br(),
                        h3(textOutput("healthy_birthweight_title")),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                        br(),
                        dataDownloadUI("healthy_birthweight")),


               ##############################################.
               # HEALTHY LIFE EXPECTANCY----
               ##############################################.

               tabPanel(title = "Healthy life expectancy",
                        value = "healthy_life_expctancy",

                        h2("Healthy life expectancy")
               ),

               ##############################################.
               # HEALTHY WEIGHT ADULTS----
               ##############################################.

               tabPanel(title = "Healthy weight adults",
                        value = "healthy_weight",

                        h2("Healthy weight adults")
               ),

               ##############################################.
               #  LIMITING LONG-TERM CONDITIONS (16+)----
               ##############################################.
               tabPanel(title = "Limiting long-term conditions (age 16+)",
                        value = "adult_long_term_condition",

                        h2("Limiting long-term conditions (age 16+)", iButtonUI("limiting_ltcs", content = "Paste background info and source for adult ltc here")),

                        #h4("Percentage of adults with a limiting long-term condition"),

                        withSpinner(plotlyOutput("adult_long_term_condition_plot")),

                        br(),
                        h3("Data table: Percentage of adults with a limiting long-term condition in Scotland"),
                        br(),
                        dataDownloadUI("limiting_ltcs")
               ),

               ##############################################.
               # MENTAL WELLBEING OF ADULTS (16+)----
               ##############################################.

               tabPanel(title = "Mental wellbeing of adults (16+)",
                        value = "mental_wellbeing",

                        h2("Mental wellbeing of adults (16+)")
               ),

               ##############################################.
               # PHYSICAL ACTIVITY----
               ##############################################.

               tabPanel(title = "Physical activity",
                        value = "physical_activity",

                        h2("Physical activity")
               ),

               ##############################################.
               # PREMATURE MORTALITY----
               ##############################################.

               tabPanel(title = "Premature mortality",
                        value = "premature_mortality",

                        h2("Premature mortality")
               ),

               ##############################################.
               # QUALITY OF CARE EXPERIENCE----
               ##############################################.

               tabPanel(title = "Quality of care experience",
                        value = "quality_care",

                        h2("Quality of care experience")
               ),

               ##############################################.
               # SCREENING UPTAKE FOR BREAST AND BOWEL CANCER----
               ##############################################.
               tabPanel(title = "Screening uptake",
                        value = "screening",

                        h2("Screening uptake")
               ),

               ##############################################.
               #  SELF-ASSESSED HEALTH OF ADULTS (16+)----
               ##############################################.
               tabPanel(title = "Self-assessed health of adults (age 16+)",
                        value = "adult_self_assessed_health",

                        h2("Self-assessed health of adults (age 16+)", iButtonUI("adult_self_assessed_health", content = "Paste background info and source for self assessed health of adults here")),

                        #h4("Percentage of adults who describe their general health as good or very good in Scotland over time"),

                        withSpinner(plotlyOutput("adult_self_assessed_health_plot")),

                        br(),
                        h3("Data table: Percentage of adults in Scotland who describe their general health as 'good' or 'very good'"),
                        br(),
                        dataDownloadUI("adult_self_assessed_health")
               ),

               ##############################################.
               # VACCINATIONS UPTAKE----
               ##############################################.
               tabPanel(title = "Vaccinations uptake",
                        value = "vaccinations",

                        h2("Vaccinations uptake")
               ),

               ##############################################.
               # WORK-RELATED ILL HEALTH----
               ##############################################.

               tabPanel(title = "Work-related ill health",
                        value = "work_related_health",

                        h2("Work-related ill health")
               ),

  ) # navlistpanel
) # tagList
