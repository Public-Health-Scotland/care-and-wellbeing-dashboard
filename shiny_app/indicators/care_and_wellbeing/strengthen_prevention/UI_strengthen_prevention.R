tagList(
  h1("Strengthen the role and impact of ill health prevention" ),
  br(),
  navlistPanel(widths = c(2,10), id = "strengthen_prevention_panel",


               ##############################################.
               # ADMISSIONS FOR ASTHMA----
               ##############################################.
               tabPanel(title = "Admissions for asthma",
                        value = "asthma_admissions",

                        h2("Admissions for asthma", iButtonUI("asthma_admissions",
                                                              content = paste("This indicator provides data on asthma related hospital admissions.",
                                                                              "<br><br>Source:",
                                                                              "<a href=https://publichealthscotland.scot/publications/acute-hospital-activity-and-nhs-beds-information-annual/acute-hospital-activity-and-nhs-beds-information-annual-annual-year-ending-31-march-2022/ target = _blank> Acute Hospital Activity and NHS beds Information (annual), March 2022, Public Health Scotland (external site)</a>.",
                                                                              "<br><br> The most current data available displayed in the Care and Wellbeing dashboard is 2021/22.",
                                                                              "<br><br>These data are available at Scotland and NHS Health Board levels with additional breakdown by age and sex.",
                                                                              "<br><br> More detailed information can be found in the accompanying",
                                                                              "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                        fluidRow(column(4,
                                        selectInput("asthma_admissions_geog_type",
                                                    "Step 1: Select national or local geography level ",
                                                    choices = c("Scotland", "Health Board"),
                                                    selectize = FALSE,
                                                    width = "100%")),
                                 column(4,
                                        selectInput("asthma_admissions_geog_name",
                                                    "Step 2: Select national or local geography area ",
                                                    choices = c("Scotland"),
                                                    selectize = FALSE,
                                                    width = "100%")),
                                 column(4,
                                        selectInput("asthma_admissions_breakdowns",
                                                    "Step 3: Select a breakdown ",
                                                    choices = c("Yearly total", "Age breakdown", "Sex breakdown"),
                                                    selectize = FALSE,
                                                    width = "100%"))),
                        fluidRow(
                          column(4,
                                 radioButtons("asthma_admissions_rate_number",
                                              "Step 4. View rate per 100,000 population or number of deaths",
                                              choices = c("Rate",
                                                          "Number"),
                                              width = "100%"))),

                        #, "Age and sex breakdown"))),
                        # column(3,
                        #        uiOutput("asthma_admissions_years_ui"))),

                        altTextUI("asthma_admissions_alt"),
                        #plot_title("Total number of admissions for asthma", "asthma_admissions_plot"),
                        withSpinner(plotlyOutput("asthma_admissions_plot")),

                        br(),
                        uiOutput("asthma_admissions_title"),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                        br(),
                        dataDownloadUI("asthma_admissions")


               ),
               ##############################################.
               # ALCOHOL: DEATHS AND FIRST HOSPITAL ADMISSIONS ----
               ##############################################.

               tabPanel(title = "Alcohol: deaths and hospital admissions",
                        value = "alcohol",

                        tabBox( title = "", id = "alcohol_tabBox", type = "pills", width = NULL,


                                ##############################################.
                                # ALCOHOL RELATED HOSPITAL ADMISSIONS ----
                                ##############################################.

                                tabPanel(title = "Alcohol-related hospital admissions",
                                         value = "alcohol_admissions",

                                         h2("Alcohol-related hospital admissions",
                                            iButtonUI("alcohol_admissions",
                                                      content = paste("This indicator provides data on hospital admissions where alcohol-related conditions",
                                                                      "are diagnosed during the hospital stay.",
                                                                      "<br><br>Source:",
                                                                      "<a href=https://publichealthscotland.scot/publications/alcohol-related-hospital-statistics/alcohol-related-hospital-statistics-scotland-financial-year-2021-to-2022/ target = _blank> Alcohol related hospital statistics, Public Health Scotland (external site)</a>.",
                                                                      "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is 2021/22.",
                                                                      # "More up to date data is available at source.",
                                                                      "<br><br>These data are available at Scotland and NHS Health Board levels.",
                                                                      "<br><br> More detailed information can be found in the accompanying",
                                                                      "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                                         fluidRow(
                                           column(4,
                                                  selectInput("alcohol_admissions_geog_type",
                                                              "Step 1: Select national or local geography level",
                                                              choices = c("Scotland", "Health Board"),
                                                              selectize = FALSE,
                                                              width = "100%")),
                                           column(4,
                                                  selectInput("alcohol_admissions_geog_name",
                                                              "Step 2: Select national or local geography area",
                                                              choices = c("Scotland"),
                                                              selectize = FALSE,
                                                              width = "100%")),
                                           column(4,
                                                  radioButtons("alcohol_admissions_rate_number",
                                                               "Step 3. View rate per 100,000 population or number of deaths",
                                                               choices = c("Rate",
                                                                           "Number"),
                                                               width = "100%"))),

                                         altTextUI("alcohol_admissions_alt"),
                                         withSpinner(plotlyOutput("alcohol_admissions_plot")),

                                         br(),
                                         uiOutput("alcohol_admissions_title"),
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
                                                      content = paste("This indicator provides data on alcohol-related deaths.",
                                                                      "<br><br>Source:",
                                                                      "<a href=https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/alcohol-deaths/ target = _blank> Alcohol-specific deaths, 2021, National Records of Scotland (external site)</a>.",
                                                                      "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is 2021.",
                                                                      # "More up to date data is available at source.",
                                                                      "<br><br>These data are available at a Scotland level with additional breakdown by sex. ",
                                                                      "<br><br> More detailed information can be found in the accompanying",
                                                                      "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                                         fluidRow(
                                           column(4,
                                                  selectInput("alcohol_deaths_sex",
                                                              "Select sex",
                                                              choices = unique(alcohol_deaths$sex),
                                                              selected = "All sexes",
                                                              selectize = FALSE,
                                                              width = "100%"))
                                         ),

                                         altTextUI("alcohol_deaths_sex_alt"),
                                         ciDefinitionUI("alcohol_deaths"),
                                         withSpinner(plotlyOutput("alcohol_deaths_sex_plot")),

                                         br(),
                                         altTextUI("alcohol_deaths_age_alt"),
                                         withSpinner(plotlyOutput("alcohol_deaths_age_plot")),
                                         br(),

                                         uiOutput("alcohol_deaths_title"),
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

               tabPanel(title = "All-cause mortality (age 15-44)",
                        value = "all_cause_mortality",

                        h2("All-cause mortality (age 15-44)",
                           iButtonUI("all_cause_mortality",
                                     content = paste("This indicator provides data on the number and rate of all causes of death.",
                                                     "<br><br>Source:",
                                                     "<a href= https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/general-background-information/ target = _blank> Vital Events - General Background information, National Records of Scotland ( external site)</a>",
                                                     "and",
                                                     "<a href=https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/deaths-background-information/  target =_blank> Deaths - Background Information, NRS (external site)</a>.",
                                                     "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is 2021.",
                                                     "More up to date data is available at source.",
                                                     "<br><br>These data are available at Scotland, NHS Health Board",
                                                     "and Council Area levels.",
                                                     "<br><br> More detailed information can be found in the accompanying",
                                                     "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                        fluidRow(
                          column(4,
                                 selectInput("all_cause_mortality_geog_type",
                                             "Step 1. Select national or local geography level",
                                             choices = c("Scotland",
                                                         "Health Board",
                                                         "Council Area"),
                                             selectize = FALSE,
                                             width = "100%")),
                          column(4,
                                 selectInput("all_cause_mortality_geog_name",
                                             "Step 2. Select national or local geography area",
                                             choices = unique(all_cause_mortality %>% filter(geography_type == "Scotland") %>% .$geography),
                                             selectize = FALSE,
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
                        uiOutput("all_cause_mortality_title"),
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
                           iButtonUI("chd_deaths",
                                     content = paste("This indicator provides data on early deaths from Coronary Heart Disease (CHD).",
                                                     "<br><br>Source:",
                                                     "<a href=https://publichealthscotland.scot/publications/scottish-heart-disease-statistics/scottish-heart-disease-statistics-year-ending-31-march-2020/ target = _blank> Scottish heart disease statistics, Public Health Scotland (external site)</a>.",
                                                     "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is the 2018-2020 year range.",
                                                     "More up to date data is available at source.",
                                                     "<br><br>These data are available at Scotland,",
                                                     "NHS Health Board, HSCP partnership,",
                                                     "Council Area, Locality and Intermediate Zone (2011) levels.",
                                                     "<br><br> More detailed information can be found in the accompanying",
                                                     "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                        fluidRow(
                          column(4,
                                 selectInput("chd_deaths_geog_type",
                                             "Step 1. Select national or local geography level",
                                             choices = c("Scotland",
                                                         "Health Board",
                                                         "HSCP",
                                                         "Council Area",
                                                         "Locality",
                                                         "Intermediate Zone"),
                                             selectize = FALSE,
                                             width = '100%'),
                          ),
                          column(4,
                                 selectInput("chd_deaths_geog_name",
                                             "Step 2. Select national or local geography area",
                                             choices = unique(chd_deaths %>% filter(geography_type == "Scotland") %>% .$geography),
                                             selectize = FALSE,
                                             width = '100%')),
                        ),


                        altTextUI("chd_deaths_alt"),
                        ciDefinitionUI("chd_deaths_ci"),
                        withSpinner(plotlyOutput("chd_deaths_plot")),

                        br(),
                        uiOutput("chd_deaths_title"),
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
                                                                                         content = paste("This indicator provides data on hospital admissions specifically relating to",
                                                                                                         "general acute and psychiatric hospital stays with a diagnosis of drug misuse.",
                                                                                                         "<br><br>Source:",
                                                                                                         "<a href=https://www.publichealthscotland.scot/publications/drug-related-hospital-statistics/drug-related-hospital-statistics-scotland-2019-to-2020/summary/ target = _blank>  Drug-related hospital statistics, Public Health Scotland (external site)</a>.",
                                                                                                         "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is 2021/22.",
                                                                                                         # "More up to date data is available at source.",
                                                                                                         "<br><br>These data are available at a Scotland",
                                                                                                         "level with additional breakdown by age and can be viewed as the",
                                                                                                         "number of admissions or as an age-sex standardised rate.",

                                                                                                         "<br><br> More detailed information can be found in the accompanying",
                                                                                                         "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                                        fluidRow(
                                          column(4,
                                                 selectInput("drug_admissions_age",
                                                             "Select age group(s)",
                                                             choices = unique(drug_admission_agesex$age_group),
                                                             selected = "All age groups",
                                                             selectize = FALSE,
                                                             width = "100%"),
                                          ),
                                          column(4,
                                                 radioButtons("drug_admissions_rate_number",
                                                              "View as rate per 100,000 or as number of admissions",
                                                              choices = c("Rate","Number"),
                                                              width = "100%")),
                                        ),

                                        altTextUI("drug_admissions_alt"),
                                        withSpinner(plotlyOutput("drug_admissions_plot_v2")),

                                        br(),
                                        uiOutput("drug_admissions_title"),
                                        p("The data table is based on the age selections chosen above. To view the full dataset, please use the download buttons below."),
                                        br(),
                                        dataDownloadUI("drug_admissions")
                               ),




                               ##############################################.
                               # DRUG RELATED DEATHS----
                               ##############################################.

                               tabPanel(title = "Drug-related deaths",
                                        value = "drug_deaths",

                                        h2("Drug-related deaths", iButtonUI("drug_deaths",
                                                                            content =  paste("This indicator provides data on drug-related deaths.",
                                                                                             "<br><br>Source:",
                                                                                             "<a href=https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/drug-related-deaths-in-scotland/ target = _blank>  Drug Related Deaths in Scotland, National Records of Scotland (external site)</a>.",
                                                                                             "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                                             "the 2017-2021 year range.",
                                                                                             #"More up to date data is available at source.",
                                                                                             "<br><br>These data are available at Scotland,",
                                                                                             " NHS Health Board and Council Area levels.",
                                                                                             "<br><br> More detailed information can be found in the accompanying",
                                                                                             "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                                        fluidRow(
                                          column(4,
                                                 selectInput("drug_deaths_geog_type",
                                                             "Step 1. Select a national or local geography level",
                                                             choices = c("Scotland", "Health Board", "Council Area"),
                                                             selectize = FALSE,
                                                             width = "100%"
                                                 )),

                                          column(4,

                                                 selectInput("drug_deaths_geog_name",
                                                             "Step 2. Select a national or local geography area",
                                                             choices = unique(drug_related_deaths %>% filter(geography_type == "Scotland") %>%  .$geography),
                                                             selectize = FALSE,
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
                                        uiOutput("drug_deaths_title"),
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
                                                                    content =  paste("This indicator provides data from the  Health and Care Experience Survey,",
                                                                                     "specifically the response from unpaid carers to the sentence:",
                                                                                     "\\`I feel supported to continue caring\\`.",
                                                                                     "<br><br>Source:",
                                                                                     "<a href=https://www.gov.scot/collections/health-and-care-experience-survey/ target = _blank> Health and Care Experience Survey, Scottish Government (external site)</a>.",
                                                                                     "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is ",
                                                                                     "2021/22.",
                                                                                     #"More up to date data is available at source.",
                                                                                     "<br><br>These data are available at a Scotland level.",
                                                                                     # "NHS Health Board and Council Area level.",
                                                                                     "<br><br> More detailed information can be found in the accompanying",
                                                                                     "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

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
                                     content =  paste("This indicator provides data on  heart attack-related hospital admisions.",
                                                      "<br><br>Source:",
                                                      "<a href=https://www.gov.scot/publications/long-term-monitoring-health-inequalities-march-2022-report/pages/9 target = _blank> Long-term monitoring of health inequalities: March 2022 report, Scottish Government (external site)</a>.",
                                                      "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                      "2021.",
                                                      # "More up to date data is available at source.",
                                                      "<br><br>These data are available at a Scotland level.",
                                                      # "NHS Health Board and Council Area level.",
                                                      "<br><br> More detailed information can be found in the accompanying",
                                                      "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),


                        fluidRow(
                          column(4,
                                 radioButtons("hospital_admission_heart_attack_rate_number",
                                              "View rate per 100,000 population or number of deaths",
                                              choices = c("Rate",
                                                          "Number"),
                                              width = "100%")
                          )),


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
                                                            content =  paste("This indicator provides data on the appropriateness of birthweights for gestational",
                                                                             "age at birth, for live singleton births only.",
                                                                             "<br><br>Source:",
                                                                             "<a href=https://www.publichealthscotland.scot/publications/births-in-scotland/births-in-scottish-hospitals-year-ending-31-march-2021/ target = _blank> Source: Births in Scotland, Public Health Scotland (external site)</a>.",
                                                                             "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                             "the year range 2021/22.",
                                                                             # "More up to date data is available at source.",
                                                                             "<br><br>These data are available at Scotland,",
                                                                             " NHS Health Board and Council Area levels",
                                                                             " with additional breakdowns by sex and SIMD quintile.",
                                                                             "<br><br> More detailed information can be found in the accompanying",
                                                                             "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),


                        fluidRow(
                          column(4,
                                 selectInput("healthy_birthweight_geog_type",
                                             "Step 1. Select a national or local geography level",
                                             choices = c("Scotland", "Health Board", "Council Area"),
                                             selectize = FALSE,
                                             width = "100%")),

                          column(4,
                                 selectInput("healthy_birthweight_geog_name",
                                             "Step 2. Select a national or local geography area",
                                             choices = unique(birthweight %>% filter(geography_type == "Scotland") %>%
                                                                .$geography),
                                             selectize = FALSE,
                                             width = "100%")
                          )),

                        altTextUI("healthy_birthweight_alt"),
                        withSpinner(plotlyOutput("healthy_birthweight_plot")),

                        altTextUI("healthy_birthweight_simd_alt"),
                        simdQuintileDefinitionUI("healthy_birthweight_simd"),
                        withSpinner(plotlyOutput("healthy_birthweight_simd_plot")),

                        br(),
                        uiOutput("healthy_birthweight_title"),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                        br(),

                        tabBox(
                          id = "healthy_birthweight_tabBox", height = "250px", width=12,
                          tabPanel("Birthweight for gestational age",
                                   br(),
                                   dataDownloadUI("healthy_birthweight")),
                          tabPanel("SIMD",
                                   br(),
                                   dataDownloadUI("healthy_birthweight_simd"))
                        )
               ),


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
                                                      content =  paste("This indicator provides data on life expectancy at birth.",
                                                                       "<br><br>Source:",
                                                                       "<a href=https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/life-expectancy/life-expectancy-in-scotland/2019-2021/ target = _blank> Life Expectancy in Scotland, National Records of Scotland (external site)</a>.",
                                                                       "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                       "the year range 2019-21.",
                                                                       #"More up to date data is available at source.",
                                                                       "<br><br>These data are available at a Scotland level, broken down by sex,",
                                                                       "for the year ranges 2009-11 to 2019-21.",
                                                                       "Additional break downs by Council Area or Scottish Index of Multiple Deprivation (SIMD) are provided using the 2019-21 dataset.",
                                                                       "<br><br> More detailed information can be found in the accompanying",
                                                                       "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata</a> file."))),

                                         fluidRow(
                                           column(4,
                                                  selectInput("life_expectancy_sex",
                                                              "Select sex",
                                                              choices = c("Male", "Female"),
                                                              selectize = FALSE,
                                                              width = "100%"))
                                         ),

                                         altTextUI("life_expectancy_trend_alt"),
                                         withSpinner(plotlyOutput("life_expectancy_trend_plot")),

                                         altTextUI("life_expectancy_council_area_alt"),
                                         ciDefinitionUI("life_expectancy_council_area_ci"),
                                         withSpinner(plotlyOutput("life_expectancy_council_area_plot")),

                                         altTextUI("life_expectancy_simd_alt"),
                                         simdDecileDefinitionUI("life_expectancy_simd"),
                                         ciDefinitionUI("life_expectancy_simd_ci"),
                                         withSpinner(plotlyOutput("life_expectancy_simd_plot")),

                                         br(),
                                         uiOutput("life_expectancy_title"),
                                         # p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                                         br(),

                                         tabBox(
                                           id = "life_expectancy_tabBox", height = "250px", width=12,
                                           tabPanel("Council area",
                                                    br(),
                                                    dataDownloadUI("life_expectancy")),
                                           tabPanel("SIMD",
                                                    br(),
                                                    dataDownloadUI("life_expectancy_simd"))
                                         )

                                ),

                                ##############################################.
                                # HEALTHY LIFE EXPECTANCY----
                                ##############################################.

                                tabPanel(title = "Healthy life expectancy",
                                         value = "healthy_life_expectancy",

                                         h2("Healthy life expectancy",
                                            iButtonUI("healthy_life_expectancy",
                                                      content =  paste("This indicator provides data on healthy life expectancy.",
                                                                       "<br><br>Source:",
                                                                       "<a href=https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/life-expectancy/healthy-life-expectancy-in-scotland/2019-2021/ target = _blank>  Healthy Life Expectancy in Scotland, National Records of Scotland (NRS) (external site)</a>.",
                                                                       "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                       "the year range 2019-21.",
                                                                       #"More up to date data is available at source.",
                                                                       "<br><br>These data are available at a Scotland level, broken down by sex and stage of life,",
                                                                       "for the year ranges 2009-11 to 2019-21.",
                                                                       "An additional break down by Council Area is provided using the 2019-21 dataset.",
                                                                       "<br><br> More detailed information can be found in the accompanying",
                                                                       "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata</a> file."))),
                                         fluidRow(
                                           column(4,
                                                  selectInput("healthy_life_expectancy_sex",
                                                              "Step 1. Select sex",
                                                              choices = c("Male", "Female"),
                                                              selectize = FALSE,
                                                              width = "100%")),
                                           column(4,
                                                  selectInput("healthy_life_expectancy_life_stage",
                                                              "Step 2. Select stage of life",
                                                              choices = c("At birth", "At age 65"),
                                                              selectize = FALSE,
                                                              width = "100%"))

                                         ),

                                         altTextUI("healthy_life_expectancy_trend_alt"),
                                         ciDefinitionUI("healthy_life_expectancy_trend_ci"),
                                         withSpinner(plotlyOutput("healthy_life_expectancy_trend_plot")),

                                         altTextUI("healthy_life_expectancy_council_area_alt"),
                                         ciDefinitionUI("healthy_life_expectancy_council_area_ci"),
                                         withSpinner(plotlyOutput("healthy_life_expectancy_council_area_plot")),

                                         br(),
                                         uiOutput("healthy_life_expectancy_title"),
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
                                     content = paste("This indicator provides data from the Scottish Health Survey,",
                                                     "specifically the question if participants are living",
                                                     "with a limiting long-term condition.",
                                                     "<br><br>Source:",
                                                     "<a href=https://www.gov.scot/collections/scottish-health-survey/ target = _blank> Scottish Health Survey (SHeS), Scottish Government (external site)</a>.",
                                                     "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                     "2021.",
                                                     #"More up to date data is available at source.",
                                                     "<br><br>These data are available at Scotland level",
                                                     " with additional breakdowns by sex and SIMD quintile.",
                                                     "<br><br> More detailed information can be found in the accompanying",
                                                     "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata</a> file."))),

                        altTextUI("adult_long_term_condition_alt"),
                        withSpinner(plotlyOutput("adult_long_term_condition_plot")),

                        altTextUI("adult_long_term_condition_simd_alt"),
                        simdQuintileDefinitionUI("adult_self_assessed_simd"),
                        withSpinner(plotlyOutput("adult_long_term_condition_simd_plot")),

                        br(),
                        h3("Data table: Percentage of adults with a limiting long-term condition in Scotland"),

                        tabBox(
                          id = "adult_long_term_condition_tabBox", height = "250px", width=12,
                          tabPanel("Sex",
                                   br(),
                                   dataDownloadUI("limiting_ltcs")),
                          tabPanel("SIMD",
                                   br(),
                                   dataDownloadUI("limiting_ltcs_simd"))
                        )
               ),

               ##############################################.
               # MENTAL WELLBEING OF ADULTS (16+)----
               ##############################################.

               tabPanel(title = "Mental wellbeing of adults (age 16+)",
                        value = "mental_wellbeing",

                        h2("Mental wellbeing of adults (age 16+)",
                           iButtonUI("mental_wellbeing",
                                     content = paste("This indicator provides data on mental wellbeing for adults,",
                                                     "(aged over 16) using the Warwick-Edinburgh Mental Wellbeing Scales (WEMWBS).",
                                                     "<br><br>Source:",
                                                     "<a href=https://www.gov.scot/collections/scottish-health-survey/ target = _blank> Scottish Health Survey (SHeS), Scottish Government (external site)</a>.",
                                                     "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                     "2021.",
                                                     #"More up to date data is available at source.",
                                                     "<br><br>These data are available at Scotland level,",
                                                     " with additional breakdowns by sex and SIMD quintile.",
                                                     "<br><br> More detailed information can be found in the accompanying",
                                                     "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata</a> file."))),

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
                                                            content =paste("This indicator  provides data on premature mortality",
                                                                           "i.e. deaths occurring before the age of 75.",
                                                                           "<br><br>Source:",
                                                                           "<a href=https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/ target = _blank> Vital Events - Deaths, National Records of Scotland (external site)</a>.",
                                                                           "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                           "2021.",
                                                                           #"More up to date data is available at source.",
                                                                           "<br><br>These data are available at Scotland, ",
                                                                           "NHS Health Board and Council Area levels with additional breakdown by SIMD quintile.",
                                                                           "<br><br> More detailed information can be found in the accompanying",
                                                                           "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata</a> file."))),

                        fluidRow(column(4,
                                        selectInput("premature_mortality_geog_type",
                                                    "Step 1: Select national or local geography level ",
                                                    choices = c("Scotland", "Health Board", "Council Area"),
                                                    selectize = FALSE,
                                                    width = "100%")),
                                 column(4,
                                        selectInput("premature_mortality_geog_name",
                                                    "Step 2: Select national or local geography area ",
                                                    choices = c("Scotland"),
                                                    selectize = FALSE,
                                                    width = "100%"))
                        ),

                        altTextUI("premature_mortality_hb_alt"),
                        withSpinner(plotlyOutput("premature_mortality_hb_comp_plot")),
                        # withSpinner(plotlyOutput("premature_mortality_hb_plot")),

                        br(),
                        br(),

                        altTextUI("premature_mortality_simd_alt"),
                        simdQuintileDefinitionUI("premature_mortality_simd_desc"),
                        withSpinner(plotlyOutput("premature_mortality_simd_plot")),

                        uiOutput("premature_mortality_title"),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                        # dataDownloadUI("premature_mortality_hb"),

                        br(),

                        # h3("Data table: European age-standardised all-cause premature mortality rates per 100,000 population by SIMD quintile in Scotland"),
                        # p("To view the full dataset, please use the download buttons below."),
                        # dataDownloadUI("premature_mortality_simd")

                        tabBox(
                          id = "spremature_mortality_tabBox", height = "250px", width=12,
                          tabPanel("Geography",
                                   br(),
                                   dataDownloadUI("premature_mortality_hb")),
                          tabPanel("SIMD",
                                   br(),
                                   dataDownloadUI("premature_mortality_simd")
                          )

                        )
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
                                                     content = paste("This indicator provides data on the percentage of women attending breast cancer screenings.",
                                                                     "<br><br>Source:",
                                                                     "<a href=https://publichealthscotland.scot/publications/scottish-breast-screening-programme-statistics/scottish-breast-screening-programme-statistics-annual-update-to-31-march-2022/ target = _blank> Breast cancer screening programme statistics, Public Health Scotland (external site)</a>.",
                                                                     "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                     "the 2019-2022 year range.",
                                                                     #"More up to date data is available at source.",
                                                                     "<br><br>These data are available at Scotland",
                                                                     "and NHS Health Board levels with additional breakdown by SIMD quintile.",
                                                                     "<br><br> More detailed information can be found in the accompanying",
                                                                     "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                                        altTextUI("screening_breast_board_alt"),
                                        withSpinner(plotlyOutput("screening_breast_board_plot")),
                                        br(),


                                        fluidRow(
                                          column(4,
                                                 selectInput("screening_breast_geog_type",
                                                             "Step 1. Select a national or local geography level",
                                                             choices = c("Scotland", "Health Board"),
                                                             selectize = FALSE,
                                                             width = "100%")),


                                          column(4,
                                                 selectInput("screening_breast_geog_name",
                                                             "Step 2. Select a national or local geography area",
                                                             choices = unique(screening_breast_simd %>% filter(geography_type == "Scotland") %>%
                                                                                .$geography),
                                                             selectize = FALSE,
                                                             width = "100%")
                                          )),

                                        altTextUI("screening_breast_simd_alt"),
                                        simdQuintileDefinitionUI("screening_breast_simd"),
                                        withSpinner(plotlyOutput("screening_breast_simd_plot")),

                                        uiOutput("screening_breast_table_title"),
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
                                                     content = paste("This indicator provides data on the percentage of men and women attending bowel cancer screenings.",
                                                                     "<br><br>Source:",
                                                                     "<a href=https://publichealthscotland.scot/publications/scottish-bowel-screening-programme-statistics/scottish-bowel-screening-programme-statistics-for-the-period-of-invitations-from-may-2020-to-april-2022/ target = _blank> Scottish bowel cancer screening programme statistics, Public Health Scotland (external site)</a>.",
                                                                     "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                     "the 2020-2022 year range.",
                                                                     #"More up to date data is available at source.",
                                                                     "<br><br>These data are available at Scotland",
                                                                     "and NHS Health Board levels with additional breakdowns by sex and SIMD quintile.",
                                                                     "<br><br> More detailed information can be found in the accompanying",
                                                                     "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                                        fluidRow(
                                          column(4,
                                                 selectInput("screening_bowel_board_year",
                                                             "Select a year range",
                                                             choices = unique(screening_bowel_board$year_range),
                                                             selectize = FALSE,
                                                             width = "100%"))),


                                        altTextUI("screening_bowel_board_alt"),
                                        withSpinner(plotlyOutput("screening_bowel_board_plot")),
                                        br(),

                                        fluidRow(
                                          column(4,
                                                 selectInput("screening_bowel_simd_year",
                                                             "Step 1. Select a year range",
                                                             choices = unique(screening_bowel_simd$year_range),
                                                             selectize = FALSE,
                                                             width = "100%")),
                                          column(4,
                                                 selectInput("screening_bowel_geog_type",
                                                             "Step 2. Select a national or local geography level",
                                                             choices = c("Scotland", "Health Board"),
                                                             selectize = FALSE,
                                                             width = "100%")),

                                          column(4,
                                                 selectInput("screening_bowel_geog_name",
                                                             "Step 3. Select a national or local geography area",
                                                             choices = unique(screening_bowel_simd %>% filter(geography_type == "Scotland") %>%
                                                                                .$geography),
                                                             selectize = FALSE,
                                                             width = "100%")
                                          )),

                                        altTextUI("screening_bowel_simd_alt"),
                                        simdQuintileDefinitionUI("screening_bowel_simd"),
                                        withSpinner(plotlyOutput("screening_bowel_simd_plot")),

                                        uiOutput("screening_bowel_table_title"),
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
                                     content =paste(" This indicator provides data on the  Scottish Health Survey,",
                                                    "specifically the percentage who describe their health as \\'Good\\' or \\'Very Good\\'.",
                                                    "<br><br>Source:",
                                                    "<a href=https://www.gov.scot/collections/scottish-health-survey/ target = _blank> Scottish Health Survey (SHeS), Scottish Government (external site)</a>.",
                                                    "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is ",
                                                    "2021.",
                                                    #"More up to date data is available at source.",
                                                    "<br><br>These data are available at Scotland level,",
                                                    " with additional breakdowns by sex and SIMD quintile.",
                                                    #"and NHS Health Board level.",
                                                    "<br><br> More detailed information can be found in the accompanying",
                                                    "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                        altTextUI("adult_self_assessed_health_alt"),
                        withSpinner(plotlyOutput("adult_self_assessed_health_plot")),

                        altTextUI("adult_self_assessed_health_simd_alt"),
                        simdQuintileDefinitionUI("adult_self_assessed_simd"),
                        withSpinner(plotlyOutput("adult_self_assessed_health_simd_plot")),

                        br(),
                        h3("Data table: Percentage of adults in Scotland who describe their general health as 'good' or 'very good'"),
                        tabBox(
                          id = "adult_self_assessed_tabBox", height = "250px", width=12,
                          tabPanel("Sex",
                                   br(),
                                   dataDownloadUI("adult_self_assessed_health")),
                          tabPanel("SIMD",
                                   br(),
                                   dataDownloadUI("adult_self_assessed_health_simd"))
                        )
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
                                                     content = paste("This indicator shows the percentage uptake of COVID-19",
                                                                     "vaccinations during seasonal vaccination programmes.",
                                                                     "<br><br>Source:",
                                                                     "<a href=https://www.publichealthscotland.scot/publications/national-respiratory-infection-and-covid-19-statistics/weekly-national-respiratory-infection-and-covid-19-statistical-report-6-july-2023/flu-and-covid-19-vaccination-uptake-in-scotland-dashboard/ target = _blank>  National respiratory infection and COVID-19 statistics, Public Health Scotland (external site)</a>.",
                                                                     "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                     "June, 2023.",
                                                                     #"More up to date data is available at source.",
                                                                     "<br><br>These data are available at Scotland",
                                                                     "and NHS Health Board levels.",
                                                                     "<br><br> More detailed information can be found in the accompanying",
                                                                     "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),


                                        fluidRow(column(4,
                                                        selectInput("vaccinations_covid_geog_type",
                                                                    "Step 1: Select national or local geography level ",
                                                                    choices = c("Scotland", "Health Board"),
                                                                    selected = "Scotland",
                                                                    selectize = FALSE,
                                                                    width = "100%")),
                                                 column(4,
                                                        selectInput("vaccinations_covid_geog_name",
                                                                    "Step 2: Select national or local geography area ",
                                                                    choices = "Scotland",
                                                                    selectize = FALSE,
                                                                    width = "100%"))),





                                        altTextUI("vaccinations_covid_alt"),
                                        simdDecileDefinitionUI("vaccinations_covid_simd"),
                                        withSpinner(plotlyOutput("vaccinations_covid_plot")),

                                        br(),
                                        uiOutput("vaccinations_covid_title"),
                                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),
                                        br(),
                                        dataDownloadUI("vaccinations_covid")
                               ),

                               ######## FLU #############
                               tabPanel(title = "Influenza vaccinations",
                                        value = "flu_vaccinations",

                                        h2("Influenza vaccinations uptake",
                                           iButtonUI("vaccinations_FLU",
                                                     content = paste("This indicator provides data on the percentage uptake of influenza",
                                                                     "vaccinations during seasonal vaccination programmes.",
                                                                     "<br><br>Source:",
                                                                     "<a href=https://www.publichealthscotland.scot/publications/national-respiratory-infection-and-covid-19-statistics/weekly-national-respiratory-infection-and-covid-19-statistical-report-2-february-2023/flu-and-covid-19-vaccination-uptake-in-scotland-dashboard/ target = _blank>  National respiratory infection and COVID-19 statistics, Public Health Scotland (external site)</a>.",
                                                                     "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                     "January, 2023.",
                                                                     #"More up to date data is available at source.",
                                                                     "<br><br>These data are available at Scotland",
                                                                     "and NHS Health Board levels.",
                                                                     "<br><br> More detailed information can be found in the accompanying",
                                                                     "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),


                                        fluidRow(column(4,
                                                        selectInput("vaccinations_flu_geog_type",
                                                                    "Step 1: Select national or local geography level ",
                                                                    choices = c("Scotland", "Health Board"),
                                                                    selected = "Scotland",
                                                                    selectize = FALSE,
                                                                    width = "100%")),
                                                 column(4,
                                                        selectInput("vaccinations_flu_geog_name",
                                                                    "Step 2: Select national or local geography area ",
                                                                    choices = "Scotland",
                                                                    selectize = FALSE,
                                                                    width = "100%"))),

                                        altTextUI("vaccinations_flu_alt"),
                                        simdDecileDefinitionUI("vaccinations_flu_simd"),
                                        withSpinner(plotlyOutput("vaccinations_flu_plot")),

                                        br(),
                                        uiOutput("vaccinations_flu_title"),
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
               )#,

               ##############################################.
               # WORK-RELATED ILL HEALTH----
               ##############################################.

               # tabPanel(title = "Work-related ill health (to be developed)",
               #          value = "work_related_health",
               #
               #          h2("Work-related ill health"),
               #
               #          p("Content to be developed")
               # )

  ) # navlistpanel
) # tagList
