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
                                                              content = paste("This indicator provides data on asthma related hospital admisions.",
                                                                              "Source:",
                                                                              "<a href=https://publichealthscotland.scot/publications/acute-hospital-activity-and-nhs-beds-information-annual/acute-hospital-activity-and-nhs-beds-information-annual-annual-year-ending-31-march-2022/, target = _blank> Acute hospital activity and NHS beds information (annual), March 2022 (external site)</a>.",
                                                                              "<br><br> The most current data available displayed in the Care and Wellbeing dashboard is 2021/22.",
                                                                              "<br><br>These data are available at Scotland and NHS Health Board level with additional breakdown by age and sex.  ",
                                                                              "<br><br> More detailed information can be found in the accompanying metadata file."))),

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
               # ALCOHOL: DEATHS AND FIRST HOSPITAL ADMISSIONS ----
               ##############################################.

               tabPanel(title = "Alcohol: alcohol-related hospital admissions and deaths",
                        value = "alcohol",

                        tabBox( title = "", id = "alcohol_tabBox", type = "pills", width = NULL,


                                ##############################################.
                                # ALCOHOL RELATED HOSPITAL ADMISSIONS ----
                                ##############################################.

                                tabPanel(title = "Alcohol-related hospital admissions",
                                         value = "alcohol_admissions",

                                         h2("Alcohol-related hospital admissions",
                                            iButtonUI("alcohol_admissions",
                                                      content = paste("This indicator uses data from Public Health Scotland Alcohol related hospital statistics.",
                                                                      "Consumption of alcohol can result in a wide range of health problems. Some may occur after drinking",
                                                                      "over a relatively short period, such as acute intoxication (drunkenness) or poisoning (toxic effect).",
                                                                      "Others develop more gradually, such as damage to the liver and brain. Estimates of the number of",
                                                                      "inpatient and day case hospitalisations are based on counts where alcohol-related conditions are",
                                                                      "diagnosed during the hospital stay. The publication found ",
                                                                      "<a href = https://publichealthscotland.scot/publications/show-all-releases?id=20558 target = _blank> here (external website) </a>",
                                                                      "provides an annual update to figures on the alcohol-related inpatient and day case activity",
                                                                      "taking place within general acute hospitals and psychiatric hospitals in Scotland. ",
                                                                      "<br> <br> Data from the most recent financial year are provisional and subject to change in future",
                                                                      "publications as figures will be updated to reflect more complete data from NHS Boards."))),

                                         fluidRow(
                                           column(4,
                                                  selectInput("alcohol_admissions_geog_type",
                                                              "Step 1: Select national or local geography level",
                                                              choices = c("Scotland", "Health Board"),
                                                              width = "100%")),
                                           column(4,
                                                  selectInput("alcohol_admissions_geog_name",
                                                              "Step 2: Select national or local geography area",
                                                              choices = c("Scotland"),
                                                              width = "100%"))),

                                         altTextUI("alcohol_admissions_alt"),
                                         withSpinner(plotlyOutput("alcohol_admissions_plot")),

                                         br(),
                                         h3(textOutput("alcohol_admissions_title")),
                                         p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                                         br(),
                                         dataDownloadUI("alcohol_related_admissions")
                                ),


                                ##############################################.
                                # ALCOHOL-SPECIFIC DEATHS ----
                                ##############################################.

                                tabPanel(title = "Alcohol-specific deaths",
                                         value = "alcohol_deaths",

                                         h2("Alcohol-specific deaths",
                                            iButtonUI("alcohol_deaths",
                                                      content = paste("Deaths are coded according to the International Statistical Classification of Diseases",
                                                                      "and Related Health Problems, Tenth Revision (ICD-10), which has been used by",
                                                                      "National Records of Scotland (NRS) since the start of 2000. ‘Alcohol-specific’ deaths",
                                                                      "are deaths which are known to be direct consequences of alcohol misuse, meaning they",
                                                                      "are wholly attributable to alcohol misuse. For more information please visit the",
                                                                      "<a href =https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/alcohol-deaths target=_blank> NRS site (external site)."))),

                                         fluidRow(
                                           column(4,
                                                  selectizeInput("alcohol_deaths_sex",
                                                                 "Select sex",
                                                                 choices = unique(alcohol_deaths$sex),
                                                                 selected = "All sexes",
                                                                 width = "100%"))
                                         ),

                                         altTextUI("alcohol_deaths_sex_alt"),
                                         ciDefinitionUI("alcohol_deaths"),
                                         withSpinner(plotlyOutput("alcohol_deaths_sex_plot")),

                                         br(),
                                         altTextUI("alcohol_deaths_age_alt"),
                                         withSpinner(plotlyOutput("alcohol_deaths_age_plot")),
                                         br(),

                                         h3(textOutput("alcohol_deaths_title")),
                                         p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),

                                         tabBox(
                                           id = "alcohol_deaths_tabBox", height = "250px", width=12,
                                           tabPanel("Rate for all ages",
                                                    br(),
                                                    dataDownloadUI("alcohol_deaths_sex")),
                                           tabPanel("Age breakdown",
                                                    br(),
                                                    dataDownloadUI("alcohol_deaths_age"))
                                         )
                                )
                        )),


               ##############################################.
               # ALL-CAUSE MORTALITY (15-44)----
               ##############################################.

               tabPanel(title = "All-cause mortality",
                        value = "all_cause_mortality",

                        h2("All-cause mortality (ages 15-44)",
                           iButtonUI("all_cause_mortality",
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

               tabPanel(title = "Drugs: deaths and hospital admissions",
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
                        h3("Data table: First ever hospital admission for heart attack (under 75) in Scotland"),
                        br(),
                        dataDownloadUI("heart_attack_admission")


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
               # LIFE EXPECTANCY----
               ##############################################.

               tabPanel(title = "Life expectancy",
                        value = "expectancy",

                        tabBox( title = "", id = "life_expectancy_tabBox", type = "pills", width = NULL,

                                ##############################################.
                                # LIFE EXPECTANCY----
                                ##############################################.

                                tabPanel(title = "Life expectancy",
                                         value = "life_expectancy",

                                         h2("Life expectancy",
                                            iButtonUI("life_expectancy",
                                                      content = paste("All of the life expectancy estimates presented in this dashboard are ‘period’ life expectancy.",
                                                                      "They are calculated assuming that mortality rates for each age group in the time period",
                                                                      "are constant throughout a person’s life. Period life expectancy is often described as how long a baby born",
                                                                      "now could expect to live if they experienced today’s mortality rates throughout their lifetime.",
                                                                      "It is very unlikely that this would be the case as it means that future changes in things such as medicine",
                                                                      "and legislation are not taken into consideration.",
                                                                      "<br> <br>",
                                                                      "Period life expectancy is not an accurate prediction of how long a person born today will actually live,",
                                                                      "but it is a useful measure of population health at a point in time and is most useful for comparing trends over time,",
                                                                      "between areas of a country and with other countries.",
                                                                      "For more information, please visit the",
                                                                      "<a href= https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/life-expectancy/life-expectancy-in-scotland/2019-2021 target = _blank> NRS website (external site). </a>"))),

                                         fluidRow(
                                           column(4,
                                                  selectizeInput("life_expectancy_sex",
                                                                 "Select sex",
                                                                 choices = c("Male", "Female"),
                                                                 width = "100%"))
                                         ),

                                         altTextUI("life_expectancy_trend_alt"),
                                         withSpinner(plotlyOutput("life_expectancy_trend_plot")),

                                         altTextUI("life_expectancy_council_area_alt"),
                                         ciDefinitionUI("life_expectancy_council_area_ci"),
                                         withSpinner(plotlyOutput("life_expectancy_council_area_plot")),

                                         br(),
                                         h3(textOutput("life_expectancy_title")),
                                         p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                                         br(),
                                         dataDownloadUI("life_expectancy")

                                ),

                                ##############################################.
                                # HEALTHY LIFE EXPECTANCY----
                                ##############################################.

                                tabPanel(title = "Healthy life expectancy",
                                         value = "healthy_life_expectancy",

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
                                )
                        )),

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

                        h2("Mental wellbeing of adults (16+)",
                           iButtonUI("mental_wellbeing",
                                     content = paste("Mental health is defined by the World Health Organization as a state of well-being in which every individual",
                                                     "realises their own potential, can cope with the stresses of life, can work productively, and is able to make a",
                                                     "contribution to their community. Positive mental health encourages better quality of life overall,",
                                                     "healthier lifestyles, better physical health, improved recovery from illness, better social relationships, and higher educational attainment.",
                                                     "<br> <br>",
                                                     "This indicator shows trends in mental wellbeing for adults aged 16+ using the Warwick-Edinburgh Mental Wellbeing Scales (WEMWBS).",
                                                     "<br> <br>",
                                                     "Further breakdowns can be found on the",
                                                     "<a href = https://scotland.shinyapps.io/sg-scottish-health-survey/ target = _blank> SHeS site (external site).</a>"))),

                        altTextUI("mental_wellbeing_alt"),
                        wemwbsDefinitionUI("mental_wellbeing_wemwbs"),
                        withSpinner(plotlyOutput("mental_wellbeing_trend_plot")),

                        altTextUI("mental_wellbeing_simd_alt"),
                        wemwbsDefinitionUI("mental_wellbeing_simd_wemwbs"),
                        simdQuintileDefinitionUI("mental_wellbeing_simd"),
                        withSpinner(plotlyOutput("mental_wellbeing_simd_plot")),

                        h3("Data table: Mental wellbeing (WEMWBS) in Scotland"),

                        tabBox(
                          id = "mental_wellbeing_tabBox", height = "250px", width=12,
                          tabPanel("Sex",
                                   br(),
                                   dataDownloadUI("mental_wellbeing")),
                          tabPanel("SIMD",
                                   br(),
                                   dataDownloadUI("mental_wellbeing_simd"))
                        )
               ),


               ##############################################.
               # PREMATURE MORTALITY----
               ##############################################.

               tabPanel(title = "Premature mortality",
                        value = "premature_mortality",

                        h2("Premature mortality", iButtonUI("premature_mortality",
                                                            content = paste("Premature mortality is defined as deaths occurring before the age of 75.  It is measured for this indicator using the European Age-Standardised mortality rate for people aged under 75.",
                                                                            "<br>",
                                                                            "<br>",
                                                                            "The European Age Standardised mortality rate is calculated using deaths and population data from the National Records of Scotland (NRS).  Rates are based on the 2013 European Standard Population.",
                                                                            "Further information on the available Deaths data is available on the NRS website:",
                                                                            "<a href = https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths target = _blank> Vital Events - Deaths </a>",
                                                                            "<br>",
                                                                            "<br>",
                                                                            "The European Age-Standardised mortality rate is a weighted sum of age-specific mortality rates and is used here to indicate the overall mortality rate for Scotland.",
                                                                            "In effect, it is the mortality rate that would have been found if the population of Scotland had the same age-composition (proportion of total population in each five year age class) as the hypothetical 2013 European Standard Population.  The rates are calculated by applying the age-specific rates for Scotland to the European Standard Population and expressed per 100,000 persons per year."))),

                        fluidRow(column(4,
                                        selectInput("premature_mortality_geog_type",
                                                    "Step 1: Select national or local geography level ",
                                                    choices = c("Scotland", "Health Board"),
                                                    width = "100%")),
                                 column(4,
                                        selectInput("premature_mortality_geog_name",
                                                    "Step 2: Select national or local geography area ",
                                                    choices = c("Scotland"),
                                                    width = "100%"))
                        ),

                        altTextUI("premature_mortality_hb_alt"),
                        ciDefinitionUI("premature_mortality_hb_ci"),
                        withSpinner(plotlyOutput("premature_mortality_hb_plot")),

                        h3(textOutput("premature_mortality_hb_title")),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                        dataDownloadUI("premature_mortality_hb"),

                        br(),
                        br(),
                        altTextUI("premature_mortality_simd_alt"),
                        simdQuintileDefinitionUI("premature_mortality_simd_desc"),
                        withSpinner(plotlyOutput("premature_mortality_simd_plot")),

                        h3("Data table: European age-standardised all-cause premature mortality rates per 100,000 population by SIMD quintile in Scotland"),
                        p("To view the full dataset, please use the download buttons below."),
                        dataDownloadUI("premature_mortality_simd")

               ),


               ##############################################.
               # SCREENING UPTAKE FOR BREAST AND BOWEL CANCER----
               ##############################################.
               tabPanel(title = "Screening uptake",
                        value = "screening",

                        tabBox(title = "", id = "screening_tabBox", type = "pills", width = NULL,

                               ##############################################.
                               # BREAST ----
                               ##############################################.


                               tabPanel(title = "Breast cancer",
                                        value = "screening_breast",

                                        h2("Screening uptake for breast cancer",

                                           iButtonUI("screening_breast",
                                                     content = paste("The Scottish Breast Screening Programme (SBSP) invites women aged between 50 and 70 years old for screening every three years.",
                                                                     "Number of women invited to attend for screening and number of women screened",
                                                                     "are reported as a count; uptake/attendance. <br> <br>",
                                                                     "The reporting period (2019-22) includes the pause to the SBSP due to the COVID-19 pandemic.",
                                                                     "No individuals were invited to breast screenings during this period, causing a reduction",
                                                                     "in overall numbers screened. Services have worked hard to recover but have been under",
                                                                     "additional strain with limited capacity due to infection prevention and control measures",
                                                                     "including social distancing and staffing pressures. <br> <br>",
                                                                     "More information can be found ",
                                                                     "<a href = https://www.healthscotland.scot/health-topics/screening/breast-screening target = _blank > here (external link). </a>",
                                                                     "Alternatively, more information on the latest statistics can be be found",
                                                                     "<a href= https://publichealthscotland.scot/publications/scottish-breast-screening-programme-statistics/scottish-breast-screening-programme-statistics-annual-update-to-31-march-2022/ target = _blank> here (external link). </a>"))),

                                        altTextUI("screening_breast_board_alt"),
                                        withSpinner(plotlyOutput("screening_breast_board_plot")),
                                        br(),


                                        fluidRow(
                                          column(4,
                                                 selectizeInput("screening_breast_geog_type",
                                                                "Step 1. Select a national or local geography level",
                                                                choices = c("Scotland", "Health Board"),
                                                                width = "100%")),


                                          column(4,
                                                 selectizeInput("screening_breast_geog_name",
                                                                "Step 2. Select a national or local geography area",
                                                                choices = unique(screening_breast_simd %>% filter(geography_type == "Scotland") %>%
                                                                                   .$geography),
                                                                width = "100%")
                                          )),

                                        altTextUI("screening_breast_simd_alt"),
                                        simdQuintileDefinitionUI("screening_breast_simd"),
                                        withSpinner(plotlyOutput("screening_breast_simd_plot")),

                                        h3(textOutput("screening_breast_table_title")),
                                        p("The data table for the SIMD breakdown is based on the selections above.",
                                          "To view the full dataset, please use the download buttons below."),

                                        tabBox(
                                          id = "screening_breast_tabBox", height = "250px", width=12,
                                          tabPanel("Health Board",
                                                   br(),
                                                   dataDownloadUI("screening_breast_board")),
                                          tabPanel("SIMD",
                                                   br(),
                                                   dataDownloadUI("screening_breast_simd"))
                                        )



                               ),

                               ##############################################.
                               # BOWEL ----
                               ##############################################.

                               tabPanel(title = "Bowel cancer",
                                        value = "screening_bowel",

                                        h2("Screening uptake for bowel cancer",
                                           iButtonUI("screening_bowel",
                                                     content = paste("Bowel screening statistics relates to men and women registered",
                                                                     "with a Community Health Index number at a GP and aged between 50-74",
                                                                     "years old, who are invited to complete a bowel screening test every two years. <br> <br>",
                                                                     "The year ranges visualised on this tab start on the 1st May and end on the 31st April. For example, 2020-22 refers to the 1st May 2020 to the 31st April 2022. <br> <br>",
                                                                     "More information can be found",
                                                                     "<a href = https://publichealthscotland.scot/publications/scottish-bowel-screening-programme-statistics/scottish-bowel-screening-programme-statistics-for-the-period-of-invitations-from-may-2020-to-april-2022/ target = _blank> here (external link). </a>"))),

                                        fluidRow(
                                          column(4,
                                                 selectizeInput("screening_bowel_board_year",
                                                                "Select a year range",
                                                                choices = unique(screening_bowel_board$year_range),
                                                                width = "100%"))),


                                        altTextUI("screening_bowel_board_alt"),
                                        withSpinner(plotlyOutput("screening_bowel_board_plot")),
                                        br(),

                                        fluidRow(
                                          column(4,
                                                 selectizeInput("screening_bowel_simd_year",
                                                                "Step 1. Select a year range",
                                                                choices = unique(screening_bowel_simd$year_range),
                                                                width = "100%")),
                                          column(4,
                                                 selectizeInput("screening_bowel_geog_type",
                                                                "Step 2. Select a national or local geography level",
                                                                choices = c("Scotland", "Health Board"),
                                                                width = "100%")),

                                          column(4,
                                                 selectizeInput("screening_bowel_geog_name",
                                                                "Step 3. Select a national or local geography area",
                                                                choices = unique(screening_bowel_simd %>% filter(geography_type == "Scotland") %>%
                                                                                   .$geography),
                                                                width = "100%")
                                          )),

                                        altTextUI("screening_bowel_simd_alt"),
                                        simdQuintileDefinitionUI("screening_bowel_simd"),
                                        withSpinner(plotlyOutput("screening_bowel_simd_plot")),

                                        h3(textOutput("screening_bowel_table_title")),
                                        p("The data tables below are based on the selections above.",
                                          "To view the full dataset, please use the download buttons below."),

                                        tabBox(
                                          id = "screening_bowel_tabBox", height = "250px", width=12,
                                          tabPanel("Health Board",
                                                   br(),
                                                   dataDownloadUI("screening_bowel_board")),
                                          tabPanel("SIMD",
                                                   br(),
                                                   dataDownloadUI("screening_bowel_simd"))
                                        )
                               )
                        )),

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

                        tabBox(title = "", id = "vaccinations_tabBox", type = "pills", width = NULL,


                               ######### COVID-19 ##########
                               tabPanel(title = "COVID-19 vaccinations",
                                        value = "covid_vaccinations",

                                        h2("COVID-19 vaccinations uptake",
                                           iButtonUI("vaccinations_covid",
                                                     content = paste("COVID-19 is a respiratory infection caused by viruses. The infections",
                                                                     "can be serious even if you are healthy; the illness varies from having no",
                                                                     "symptoms to mild/moderate symptoms to severe complications including",
                                                                     "death. Seasonal vaccination programmes are designed to boost your immunity.",
                                                                     "Vaccination is the best way to help protect you from COVID-19, and reduce",
                                                                     "the likelihood of needing hospital treatment. It is offered free by the",
                                                                     "NHS to help protect people at risk of COVID-19 and any further complications. <br> <br>",
                                                                     "The data presented here indicate the number of vaccinations administered and",
                                                                     "uptake across Scotland to those eligible to receive either flu or flu and COVID",
                                                                     "booster during seasonal vaccination programmes.",
                                                                     "This tab looks into the uptake for Winter 2022 Flu & COVID-19 vaccination programmes. <br> <br>",
                                                                     "For more information please visit the ",
                                                                     "<a href = https://publichealthscotland.scot/our-areas-of-work/immunisations/seasonal-immunisations/ target = _blank > PHS website.</a>",
                                                                     "Alternatively, visit the ",
                                                                     "<a href = https://www.publichealthscotland.scot/publications/national-respiratory-infection-and-covid-19-statistics/national-respiratory-infection-and-covid-19-statistics-1-june-2023/flu-and-covid-19-vaccination-uptake-in-scotland-dashboard/ target = _blank> Flu & COVID-19 vaccination uptake in Scotland dashboard (external link)."))),


                                        fluidRow(column(4,
                                                        selectInput("vaccinations_covid_geog_type",
                                                                    "Step 1: Select national or local geography level ",
                                                                    choices = c("Scotland", "Health Board"),
                                                                    selected = "Scotland",
                                                                    width = "100%")),
                                                 column(4,
                                                        selectInput("vaccinations_covid_geog_name",
                                                                    "Step 2: Select national or local geography area ",
                                                                    choices = "Scotland",
                                                                    width = "100%"))),





                                        altTextUI("vaccinations_covid_alt"),
                                        simdDecileDefinitionUI("vaccinations_covid_simd"),
                                        withSpinner(plotlyOutput("vaccinations_covid_plot")),

                                        br(),
                                        h3(textOutput("vaccinations_covid_title")),
                                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                                        br(),
                                        dataDownloadUI("vaccinations_covid")
                               ),

                               ######## FLU #############
                               tabPanel(title = "Influenza vaccinations",
                                        value = "flu_vaccinations",

                                        h2("Influenza vaccinations uptake",
                                           iButtonUI("vaccinations_FLU",
                                                     content = paste("Influenza is a respiratory infection caused by viruses. The infections",
                                                                     "can be serious even if you are healthy; the illness varies from having no",
                                                                     "symptoms to mild/moderate symptoms to severe complications including",
                                                                     "death. Seasonal vaccination programmes are designed to boost your immunity.",
                                                                     "Vaccination is the best way to help protect you from influenza, and reduce",
                                                                     "the likelihood of needing hospital treatment. It is offered free by the",
                                                                     "NHS to help protect people at risk of influenza and any further complications. <br> <br>",
                                                                     "The data presented here indicate the number of vaccinations administered and",
                                                                     "uptake across Scotland to those eligible to receive either flu or flu and COVID",
                                                                     "booster during seasonal vaccination programmes.",
                                                                     "This tab looks into the uptake for Winter 2022 Flu & COVID-19 vaccination programmes. <br> <br>",
                                                                     "For more information please visit the ",
                                                                     "<a href = https://publichealthscotland.scot/our-areas-of-work/immunisations/seasonal-immunisations/ target = _blank > PHS website.</a>",
                                                                     "Alternatively, visit the ",
                                                                     "<a href = https://www.publichealthscotland.scot/publications/national-respiratory-infection-and-covid-19-statistics/national-respiratory-infection-and-covid-19-statistics-1-june-2023/flu-and-covid-19-vaccination-uptake-in-scotland-dashboard/ target = _blank> Flu & COVID-19 vaccination uptake in Scotland dashboard (external link)."))),


                                        fluidRow(column(4,
                                                        selectInput("vaccinations_flu_geog_type",
                                                                    "Step 1: Select national or local geography level ",
                                                                    choices = c("Scotland", "Health Board"),
                                                                    selected = "Scotland",
                                                                    width = "100%")),
                                                 column(4,
                                                        selectInput("vaccinations_flu_geog_name",
                                                                    "Step 2: Select national or local geography area ",
                                                                    choices = "Scotland",
                                                                    width = "100%"))),

                                        altTextUI("vaccinations_flu_alt"),
                                        simdDecileDefinitionUI("vaccinations_flu_simd"),
                                        withSpinner(plotlyOutput("vaccinations_flu_plot")),

                                        br(),
                                        h3(textOutput("vaccinations_flu_title")),
                                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                                        br(),
                                        dataDownloadUI("vaccinations_flu"),


                               )
                        )

               ),

               ##############################################.
               # EXPERIENCE OF SOCIAL CARE RECIPIENTS----
               ##############################################.


               tabPanel(title = "Experience of social care recipients (to be developed) ",
                        value = "experience_recipients",

                        h2("Experience of social care recipients"),

                        p("Content to be developed")

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
               # HEALTHY WEIGHT ADULTS----
               ##############################################.

               tabPanel(title = "Healthy weight adults (to be developed)",
                        value = "healthy_weight",

                        h2("Healthy weight adults"),

                        p("Content to be developed")
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
               # QUALITY OF CARE EXPERIENCE----
               ##############################################.

               tabPanel(title = "Quality of care experience (to be developed)",
                        value = "quality_care",

                        h2("Quality of care experience"),

                        p("Content to be developed")
               ),

               ##############################################.
               # WORK-RELATED ILL HEALTH----
               ##############################################.

               tabPanel(title = "Work-related ill health (to be developed)",
                        value = "work_related_health",

                        h2("Work-related ill health"),

                        p("Content to be developed")
               )

  ) # navlistpanel
) # tagList
