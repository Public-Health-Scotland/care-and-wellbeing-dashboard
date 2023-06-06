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
                                                                              "<a href=https://publichealthscotland.scot/publications/show-all-releases?id=20569/ target = _blank> Early child development, PHS (external site)</a>.",
                                                                              "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is ",
                                                                              "is the year range 2020/21.",
                                                                              "More up to data is available at source.",
                                                                              "<br><br>These data are available at Scotland",
                                                                              ", NHS Health Board and Council Area levels.",
                                                                              "<br><br> More detailed information can be found in the accompanying metadata file."))),

                        p("Select up to 3 Health Boards and Council Areas to compare on the chart using the boxes below.",
                          "Scotland will always be displayed"),

                        fluidRow(

                          column(4,
                                 selectizeInput("child_development_cw_healthboard",
                                                label = "Select Health Board(s) (3 Max)",
                                                choices = unique(master_lookup$hb2019name),
                                                multiple = TRUE,
                                                selected = "NHS Ayrshire and Arran",
                                                width = "100%",
                                                options = list(maxItems = 3,
                                                               plugins = c('remove_button')))
                          ),
                          column(4,
                                 selectizeInput("child_development_cw_local_LA",
                                                label = "Select Council Area(s) (3 Max)",
                                                choices = unique(lookup_LA),
                                                multiple = TRUE,
                                                selected = "Aberdeen City",
                                                width = "100%",
                                                options = list(maxItems = 3,
                                                               plugins = c('remove_button')))
                          )),



                        altTextUI("child_development_cw_alt"),
                        withSpinner(plotlyOutput("child_development_cw_plot_2")),



                        h3(textOutput("child_development_cw_table_title")),
                        p("To view the full dataset, please use the download buttons below."),
                        radioButtons("child_development_cw_geog_table",
                                     "Select geography type for data table",
                                     choices = unique(preschool$geography_type),
                                     inline = TRUE),
                        dataDownloadUI("child_development_cw")
               ),

               ##############################################.
               # CHILDREN AT RISK OF OBESITY----
               ##############################################.

               tabPanel(title = "Children at risk of obesity",
                        value = "child_obesity",

                        h2("Children at risk of obesity",
                           iButtonUI("child_obesity", content = paste("This indicator provides data on children at risk of obesity i.e.",
                                                                     "children aged 2-15 with a BMI at or above 95th percentile.",
                                                                        "<br><br>Source:",
                                                                        "<a href=https://www.gov.scot/collections/scottish-health-survey/ target = _blank> Source: Scottish Health Survey (SHeS) Scottish Government (external site).</a>.",
                                                                        "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is ",
                                                                        "is 2021. Data for 2020 have not been included ",
                                                                        "as data collection was affected by the COVID-19 pandemic.",
                                                                        #"More up to data is available at source.",
                                                                        "<br><br>These data are available at Scotland level",
                                                                        #", NHS Health Board and Council Area levels.",
                                                                        "<br><br> More detailed information can be found in the accompanying metadata file."))),

                        altTextUI("child_obesity_alt"),
                        withSpinner(plotlyOutput("child_obesity_plot")),

                        br(),
                        h3("Data table: Percentage of children (2-15) at risk of obesity in Scotland"),
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
                           iButtonUI("infant_mortality_cw", content = paste("This indicator uses the",
                                                                            "<a href=https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/deaths-time-series-data target=_blank> National Records of Scotland’s (NRS\\'s) statistics of deaths. </a></a>",
                                                                            "Information about the basis of these statistics is available from the Vital Events – General Background Information and the Deaths – Background Information pages. ",
                                                                            "<br> <br>",
                                                                            "A live birth is where the baby was born breathing or showing other signs of life."))),

                        altTextUI("infant_mortality_cw_alt"),
                        withSpinner(plotlyOutput("infant_mortality_cw_plot")),


                        h3("Data table: Monthly rate of infant deaths per 1,000 live births in Scotland"),
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








