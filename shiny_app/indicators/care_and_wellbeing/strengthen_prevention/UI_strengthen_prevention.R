tagList(
  h1("Strengthen the Role and Impact of Ill Health Prevention" ),
  br(),
  navlistPanel(widths = c(2,10), id = "strengthen_prevention_panel",


               ##############################################.
               # ADMISSIONS FOR ASTHMA----
               ##############################################.
               tabPanel(title = "Admissions for asthma",
                        value = "asthma_admissions",

                        h2("Admissions for asthma", iButtonUI("asthma_admissions",
                                                              content = paste("The Scottish Morbidity Record (SMR) database is the",
                                                              "national inpatient and day case database in Scotland. These statistics",
                                                              "are derived from data collected on discharges from non-obstetric and",
                                                              "non-psychiatric hospitals (SMR01).",
                                                              "For more information, please visit the",
                                                              "<a href= https://publichealthscotland.scot/publications/acute-hospital-activity-and-nhs-beds-information-annual/acute-hospital-activity-and-nhs-beds-information-annual-annual-year-ending-31-march-2022/ target = _blank> PHS website. </a>"))),

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
                                         withSpinner(plotlyOutput("alcohol_deaths_sex_plot")),
                                         br(),
                                         p("Alternative plot, death by age group."),
                                         br(),
                                         withSpinner(plotlyOutput("alcohol_deaths_age_plot")),
                                         br(),


                                         #                  plot_title("Alcohol specific deaths and age-standardised mortality rates (ASMR) by sex",
                                         #                             "alcohol_deaths_plot"),
                                         #
                                         #                  br(),
                                         #                  br(),
                                         #
                                         #                  plot_title("Rate of alcohol-specific deaths (result of intentional self harm or undetermined intent) in Scotland",
                                         #                             "alcohol_deaths_by_age_plot"),
                                         #
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
                                                                                         "<a href = https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/general-background-information target = _blank> Vital Events – General Background Information </a>",
                                                                                         "and",
                                                                                         "<a href = https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/deaths-background-information target = _blank> Deaths – Background Information. </a>"))),

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

               tabPanel(title = "Coronary heart disease (CHD) deaths (under 75)",
                        value = "chd_deaths",

                        h2("Coronary heart disease (CHD) deaths (under 75)",
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
                                                                   "<a href=https://beta.isdscotland.org/topics/heart-disease-and-stroke/ target = _blank> Data and Intelligence website. </a>"))),

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

                                        h2("Drug-related hospital admissions", iButtonUI("drug_admissions",
                                                                                         content = paste("This indicator uses data from Public Health Scotland drug related hospital",
                                                                                                         "statistics publication relating to general acute and psychiatric hospital stays with",
                                                                                                         "a diagnosis of drug misuse.",
                                                                                                         #"These data are presented at a national level and broken",
                                                                                                         #"down by demographic characteristics/local geographies.",
                                                                                                         "More information can be found",
                                                                                                         "<a href = https://www.publichealthscotland.scot/publications/show-all-releases?id=32315 target=_blank> here (external link). </a>"))),

                                        fluidRow(
                                          column(4,
                                                 selectizeInput("drug_admissions_age", "Select age group(s)",
                                                                choices = unique(drug_stays$age_group),
                                                                selected = "All age groups",
                                                                multiple = TRUE,
                                                                width = "100%",
                                                                options = list(plugins = c('remove_button'),
                                                                               `actions-box` = TRUE)))),

                                        altTextUI("drug_admissions_alt"),
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

                                        h2("Drug-related deaths", iButtonUI("drug_deaths",
                                                                            content = paste("Statistics of drug-related deaths in 2021 and earlier years,",
                                                                                            "broken down by age, sex, substances implicated in the death, underlying",
                                                                                            "cause of death, and NHS Board and Council areas can be found",
                                                                                            "<a href = https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/drug-related-deaths-in-scotland target = _blank> here (external link). </a>"))),

                                        fluidRow(
                                          column(4,
                                                 selectizeInput("drug_deaths_geog_type",
                                                                "Step 1. Select a national or local geography level",
                                                                choices = c("Scotland", "Health Board", "Council Area"),
                                                                width = "100%"
                                                 )),

                                          column(4,

                                                 selectizeInput("drug_deaths_geog_name",
                                                                "Step 2. Select a national or local geography area",
                                                                choices = unique(drug_related_deaths %>% filter(geography_type == "Scotland") %>%  .$geography),
                                                                width = "100%"
                                                 )
                                          ),

                                          column(4,
                                                 radioButtons("drug_deaths_rate_number",
                                                              "3. View rate per 100,000 population or number of deaths",
                                                              choices = c("Rate",
                                                                          "Number"),
                                                              width = "100%"
                                                 ))
                                        ),


                                        altTextUI("drug_deaths_alt"),
                                        ciDefinitionUI("drug_deaths_ci"),
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


               tabPanel(title = "Experience of social care recipients (to be developed) ",
                        value = "experience_recipients",

                        h2("Experience of social care recipients"),

                        p("Content to be developed")

               ),

               ##############################################.
               # EXPERIENCE OF UNPAID CARERS----
               ##############################################.


               tabPanel(title = "Experience of unpaid carers ",
                        value = "experience_of_unpaid_carers",

                        h2("Experience of unpaid carers", iButtonUI("experience_unpaid_carers",
                                                                    content = paste("The Health and Care Experience Survey (successor to the GP",
                                                                    "and Local NHS Services Patient Experience Survey) asks about people’s experiences of:",
                                                                    "<li> accessing and using their GP practice and Out of Hours services </li>",
                                                                    "<li> aspects of care and support provided by local authorities and other organisations </li>",
                                                                    "<li> caring responsibilities and related support </li>",
                                                                    "The survey has been run every two years since 2009 and can be found here:",
                                                                    "<a href=https://www.gov.scot/collections/health-and-care-experience-survey/#2013to2014> https://www.gov.scot/collections/health-and-care-experience-survey/#2013to2014 </a>"))),

                        altTextUI("experience_of_unpaid_carers_alt"),
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

               tabPanel(title = "Health risk behaviours (to be developed)",
                        value = "health_risk_behaviours",

                        h2("Health risk behaviours"),

                        p("Content to be developed")
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

                        h2("Healthy life expectancy",
                           iButtonUI("healthy_life_expectancy",
                                                              content = paste("Healthy life expectancy (HLE) is an estimate of the number of years lived in ‘very good’",
                                                                              "or ‘good’ general health, based on how individuals perceive their state of health at the time",
                                                                              "of completing the annual population survey (APS)",
                                                                              "<br> <br>",
                                                                              "Some of the smaller council areas and health boards have very wide confidence intervals.",
                                                                              "You need to use great care when comparing the estimates of these small areas with wide confidence intervals.",
                                                                              "<br> <br>",
                                                                              "Healthy life expectancy provides insight into the proportion of life expectancy spent in good health.",
                                                                              "HLE estimates are important to analyse alongside the life expectancy estimates, to understand the state",
                                                                              "of health the population is in, as well as their years of life expectancy.",
                                                                              "<br> <br>",
                                                                              "These figures are also used to help deliver local and national services in addition to use for teaching and research purposes.",
                                                                              "For more information, please visit the",
                                                                              "<a href= https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/life-expectancy/healthy-life-expectancy-in-scotland/2019-2021 target = _blank> NRS website (external site). </a>"))),
                        fluidRow(
                          column(4,
                                 selectizeInput("healthy_life_expectancy_sex",
                                                "Step 1. Select sex",
                                                choices = c("Male", "Female"),
                                                width = "100%")),
                          column(4,
                                 selectizeInput("healthy_life_expectancy_life_stage",
                                                "Step 2. Select stage of life",
                                                choices = c("At birth", "At age 65"),
                                                width = "100%"))

               ),

               altTextUI("healthy_life_expectancy_trend_alt"),
               ciDefinitionUI("healthy_life_expectancy_trend_ci"),
               withSpinner(plotlyOutput("healthy_life_expectancy_trend_plot")),

               altTextUI("healthy_life_expectancy_council_area_alt"),
               ciDefinitionUI("healthy_life_expectancy_council_area_ci"),
               withSpinner(plotlyOutput("healthy_life_expectancy_council_area_plot")),

               br(),
               h3(textOutput("healthy_life_expectancy_title")),
               p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
               br(),
               dataDownloadUI("healthy_life_expectancy")

               ),

               ##############################################.
               # HEALTHY WEIGHT ADULTS----
               ##############################################.

               tabPanel(title = "Healthy weight adults (to be developed)",
                        value = "healthy_weight",

                        h2("Healthy weight adults"),

                        p("Content to be developed")
               ),

               ##############################################.
               #  LIMITING LONG-TERM CONDITIONS (16+)----
               ##############################################.
               tabPanel(title = "Limiting long-term conditions (age 16+)",
                        value = "adult_long_term_condition",

                        h2("Limiting long-term conditions (age 16+)",
                           iButtonUI("limiting_ltcs",
                                     content = paste("This indicator uses data from the Scottish Health Survey.",
                                                     "Participants are asked if they are living with a limiting long-term",
                                                     "condition. The data are presented at national level. More information",
                                                     "can be found",
                                                     "<a href = https://www.gov.scot/collections/scottish-health-survey/ target = _blank> here. </a>",
                                                     "<br> <br> A long-term condition is defined as a physical or mental condition & health condition or illness lasting,",
                                                     "or expected to last 12 limiting months or more. A long-term condition is defined as limiting",
                                                     "if the respondent reported that it limited their activities in any way."))),

                        altTextUI("adult_long_term_condition_alt"),
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

               tabPanel(title = "Physical activity (to be developed)",
                        value = "physical_activity",

                        h2("Physical activity"),

                        p("Content to be developed")
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

               tabPanel(title = "Quality of care experience (to be developed)",
                        value = "quality_care",

                        h2("Quality of care experience"),

                        p("Content to be developed")
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
               tabPanel(title = "Self-assessed health of adults",
                        value = "adult_self_assessed_health",

                        h2("Self-assessed health of adults",
                           iButtonUI("adult_self_assessed_health",
                                     content = paste("This indicator uses data from the Scottish Health Survey. Participants",
                                                     "who are aged 13 and over are asked to rate their health in general with",
                                                     "answer options ranging from 'very good' to 'very bad'. The data for",
                                                     "those participants who described their general health as good or very good",
                                                     "are presented at a national level. More information can be found",
                                                     "<a href = https://www.gov.scot/collections/scottish-health-survey/ target = _blank> here. </a>"))),

                        altTextUI("adult_self_assessed_health_alt"),
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

               tabPanel(title = "Work-related ill health (to be developed)",
                        value = "work_related_health",

                        h2("Work-related ill health"),

                        p("Content to be developed")
               ),

  ) # navlistpanel
) # tagList
