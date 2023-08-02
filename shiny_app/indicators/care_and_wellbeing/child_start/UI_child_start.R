tagList(

  h1("Give Every Child the Best Start In Life" ),
  br(),

  navlistPanel(widths = c(2,10), id = "child_start_panel",




               ##############################################.
               # CHILD SOCIAL AND PHYSICAL DEVELOPMENT----
               ##############################################.
               tabPanel(title = "Child social and physical development",
                        value = "child_development_cw",

                        h2("Child social and physical development",
                           iButtonUI("child_development_cw", content =  paste("This indicator provides data on Health Visitors\\'",
                                                                              "assesments of any developmental concerns in children aged 27-30 months.",
                                                                              "<br><br>Source:",
                                                                              "<a href= https://publichealthscotland.scot/publications/early-child-development/early-child-development-statistics-scotland-2021-to-2022/ target = _blank> Early child development, Public Health Scotland (external site)</a>.",
                                                                              "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                              "the year range 2021/22.",
                                                                              # "More up to date data is available at source.",
                                                                              "<br><br>These data are available at Scotland,",
                                                                              "NHS Health Board and Council Area levels,",
                                                                              "with additional breakdowns by sex, SIMD quintile and ethnicity.",
                                                                              "<br><br> More detailed information can be found in the accompanying",
                                                                              "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                        # p("Select up to 3 Health Boards and Council Areas to compare on the chart using the boxes below.",
                        #   "Scotland will always be displayed"),
                        #
                        # fluidRow(
                        #
                        #   column(4,
                        #          selectizeInput("child_development_cw_healthboard",
                        #                         label = "Select Health Board(s) (3 Max)",
                        #                         choices = unique(master_lookup$hb2019name),
                        #                         multiple = TRUE,
                        #                         selected = "NHS Ayrshire and Arran",
                        #                         width = "100%",
                        #                         options = list(maxItems = 3,
                        #                                        plugins = c('remove_button')))
                        #   ),
                        #   column(4,
                        #          selectizeInput("child_development_cw_local_LA",
                        #                         label = "Select Council Area(s) (3 Max)",
                        #                         choices = unique(lookup_LA),
                        #                         multiple = TRUE,
                        #                         selected = "Aberdeen City",
                        #                         width = "100%",
                        #                         options = list(maxItems = 3,
                        #                                        plugins = c('remove_button')))
                        #   )),

                        fluidRow(
                          column(4,
                                 selectInput("child_development_cw_geog_type",
                                             label = "Step 1. Select national or local geography level",
                                             choices = c("Scotland", "Health Board", "Council Area"),
                                             selected = "Scotland",
                                             selectize = FALSE,
                                             width = "100%")),
                          column(4,
                                 selectInput("child_development_cw_geog_name",
                                             label = "Step 2. Select national or local geography area",
                                             choices = unique(geog_lookup %>% filter(geography_type == "Scotland") %>% .$geography),
                                             selectize = FALSE,
                                             width = "100%",
                                 ))),


                        # plot_title("Proportion of health visitor reviews where any form of developmental concern was raised",
                        #            "child_development_cw_plot",
                        #            subtitle = "This chart will display a comparison line on the chart.
                        #            For health boards, Scotland data will also be provided.
                        #            For council areas, health board data will also be provided."),


                        altTextUI("child_development_cw_alt"),
                        withSpinner(plotlyOutput("child_development_cw_plot")),



                        uiOutput("child_development_cw_table_title"),
                        p("To view the full dataset, please use the download buttons below."),
                        # radioButtons("child_development_cw_geog_table",
                        #              "Select geography type for data table",
                        #              choices = unique(preschool$geography_type),
                        #              inline = TRUE),
                        dataDownloadUI("child_development_cw")
               ),

               ##############################################.
               # CHILDREN AT RISK OF OBESITY----
               ##############################################.

               tabPanel(title = "Children at risk of obesity (ages 2-15 years)",
                        value = "child_obesity",

                        h2("Children at risk of obesity",
                           iButtonUI("child_obesity", content = paste("This indicator provides data on children at risk of obesity i.e.",
                                                                     "children, ages 2-15 years, with a BMI at or above the 95th percentile.",
                                                                        "<br><br>Source:",
                                                                        "<a href=https://www.gov.scot/collections/scottish-health-survey/ target = _blank> Scottish Health Survey (SHeS), Scottish Government (external site)</a>.",
                                                                        "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                        "2021. Data for 2020 have not been included as data collection was affected by the COVID-19 pandemic.",
                                                                        #"More up to date data is available at source.",
                                                                        "<br><br>These data are available at a Scotland level.",
                                                                        #", NHS Health Board and Council Area level.",
                                                                     "<br><br> More detailed information can be found in the accompanying",
                                                                     "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                        altTextUI("child_obesity_alt"),
                        withSpinner(plotlyOutput("child_obesity_plot")),

                        br(),
                        h3("Data table: Percentage of children, ages 2-15 years, at risk of obesity in Scotland"),
                        p("To view the full dataset, please use the download buttons below."),
                        br(),
                        dataDownloadUI("children_at_risk_of_obesity")
               ),

               ##############################################.
               # INFANT MORTALITY ----
               ##############################################.

               tabPanel(title = "Infant mortality",
                        value = "infant_mortality_cw",

                        h2("Infant mortality",
                           iButtonUI("infant_mortality_cw", content = paste("This indicator provides data on all deaths in the first year  of life;",
                                                                            "this includes neonatal and post-neonatal deaths, but not stillbirths",
                                                                            "<br><br>Source:",
                                                                            "<a href=https://scotland.shinyapps.io/phs-covid-wider-impact/ target = _blank>  COVID-19 wider impacts on the health care system, Public Health Scotland (external site)</a>",
                                                                            "and",
                                                                            "<a href=https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/  target =_blank>Vital Events - Deaths, National Records of Scotland (external site)</a>.",
                                                                            "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                            "May, 2023.",
                                                                            # "More up to date data is available at source.",
                                                                            "<br><br>These data are available at a Scotland",
                                                                            "level.",
                                                                            "<br><br> More detailed information can be found in the accompanying",
                                                                            "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                        fluidRow(
                          column(4,
                                 radioButtons("inf_morality_rate_number",
                                              "View as Rate per 1,000 Live Births or as Number of Deaths",
                                              choices = c("Rate",
                                                          "Number"),
                                              width = "100%"))

                      ),



                          altTextUI("infant_mortality_cw_alt"),
                        withSpinner(plotlyOutput("infant_mortality_cw_plot")),


                        h3("Data table: Infant mortality in Scotland"),
                        p("To view the full dataset, please use the download buttons below."),

                        dataDownloadUI("infant_mortality_cw")
               ),

               ##############################################.
               # CHILD MATERIAL DEPRIVATION----
               ##############################################.

               tabPanel(title = "Child material deprivation (to be developed)",
                        value = "child_material_deprivation",

                        h2("Child material deprivation"),

                        p("Content to be developed")
               ),

               ##############################################.
               # CHILD WELLBEING AND HAPPINESS----
               ##############################################.

               tabPanel(title = "Child wellbeing and happiness (to be developed)",
                        value = "child_wellbeing",

                        h2("Child wellbeing and happiness"),

                        p("Content to be developed")
               ),

               ##############################################.
               # PERINATAL MORTALITY RATE----
               ##############################################.

               tabPanel(title = "Perinatal mortality rate (to be developed)",
                        value = "perinatal_mortality",

                        h2("Perinatal Mortality Rate"),

                        p("Content to be developed")
               ),



               ##############################################.
               # PHYSICAL ACTIVITY OF CHILDREN----
               ##############################################.

               tabPanel(title = "Physical activity of children (to be developed)",
                        value = "physical_activity_children",

                        h2("Physical Activity (of children)"),

                        p("Content to be developed")
               )







  )

)








