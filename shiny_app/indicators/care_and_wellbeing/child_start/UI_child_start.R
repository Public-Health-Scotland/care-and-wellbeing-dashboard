tagList(

  h1("Giving every child the best start in life" ),
  br(),
  navlistPanel(widths = c(2,10),

               ##############################################.
               # CHILD MATERIAL DEPRIVATION----
               ##############################################.

               tabPanel(title = "Child material deprivation",
                        value = "child_material_deprevation",

                        h2("Child material deprivation")
               ),

               ##############################################.
               # CHILD SOCIAL AND PHYSICAL DEVELOPMENT----
               ##############################################.
               tabPanel(title = "Child social and physical development",
                        value = "child_development_cw",

                        h2("Child social and physical development",
                        iButtonUI("child_development_cw", content = paste("A review for children aged 27-30 months was introduced in Scotland in April 2013.",
                                                                          "Publications of statistics from Health Visitors’ assessment of children’s development",
                                                                          "at these reviews have been published since 2013. The latest publication can be found here:",
                                                                          "<a href=https://publichealthscotland.scot/publications/early-child-development/early-child-development-statistics-scotland-2020-to-2021/ target=_blank> Early child development statistics - Scotland 2020 to 2021 - Early child development - Publications - Public Health Scotland </a>",
                                                                          "<br> <br>",
                                                                          "Health Visitors assess children’s development during child health reviews by:",
                                                                          "<br> <br>",
                                                                          "<li> Asking parents/carers about any concerns they have regarding their child’s development </li>",
                                                                          "<li> Asking about the child’s developmental abilities and attainment of relevant milestones </li>",
                                                                          "<li> Careful observation of the child </li>",
                                                                          "<li> Asking parents to complete a questionnaire about their child’s development </li>",
                                                                          "<br> <br>",
                                                                          "Since April 2017, Health Visitors have been asked to assess the following eight domains of children’s",
                                                                          "development during 27-30 month reviews:",
                                                                          "<br> <br>",
                                                                          "<li> Speech, language and communication </li>",
                                                                          "<li> Gross motor </li>",
                                                                          "<li> Fine motor </li>",
                                                                          "<li> Problem solving </li>",
                                                                          "<li> Personal/social </li>",
                                                                          "<li> Emotional/behavioural </li>",
                                                                          "<li> Vision </li>",
                                                                          "<li> Hearing </li>",
                                                                          "<br> <br>",
                                                                          "Between April 2013 and March 2017, Health Visitors used a slightly different list of domains, and information",
                                                                          "was not collected on the Problem solving domain."))),


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
               # CHILD WELLBEING AND HAPPINESS----
               ##############################################.

               tabPanel(title = "Child wellbeing and happiness",
                        value = "child_wellbeing",

                        h2("Child wellbeing and happiness")
               ),

               ##############################################.
               # CHILDREN AT RISK OF OBESITY----
               ##############################################.

               tabPanel(title = "Children at risk of obesity",
                        value = "child_obesity",

                        h2("Children at risk of obesity",
                        iButtonUI("child_obesity", content = paste("Obesity is defined by the World Health Organisation as a disease characterised by excess adiposity.",
                                                                   "It is a chronic, relapsing disease resulting from complex interactions between a range of factors, including those that occur",
                                                                   "at a biological, commercial, social and political level.",
                                                                   "<br> <br>",
                                                                   "Obesity is classified as having a Body Mass Index (BMI) of 30 kg/m2 or more.",
                                                                   "Children at risk of obesity are those with a BMI at or above 95th percentile"))),

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
                                                                      "<a href=https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/deaths-time-series-data target=_blank> National Records of Scotland’s (NRS\\'s) statistics of deaths </a>",
                                                                      "Information about the basis of these statistics is available from the Vital Events – General Background Information and the Deaths – Background Information pages."))),

                        altTextUI("infant_mortality_cw_alt"),
                        withSpinner(plotlyOutput("infant_mortality_cw_plot")),


                        h3("Data table: Monthly rate of infant deaths per 1,000 live births in Scotland"),
                        p("To view the full dataset, please use the download buttons below."),

                        dataDownloadUI("infant_mortality_cw")
               ),


               ##############################################.
               # PERINATAL MORTALITY RATE----
               ##############################################.

               tabPanel(title = "Perinatal Mortality Rate",
                        value = "perinatal_mortality",

                        h2("Perinatal Mortality Rate")
               ),



               ##############################################.
               # PHYSICAL ACTIVITY OF CHILDREN----
               ##############################################.

               tabPanel(title = "Physical Activity (of children)",
                        value = "physical_activity_children",

                        h2("Physical Activity (of children)")
               )







  )

)








