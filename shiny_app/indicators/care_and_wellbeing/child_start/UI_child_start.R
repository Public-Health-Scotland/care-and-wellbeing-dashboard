tagList(

  h1("Giving every child the best start in life" ),
  br(),

  navlistPanel(widths = c(2,10), id = "child_start_panel",

               ##############################################.
               # CHILD MATERIAL DEPRIVATION----
               ##############################################.

               tabPanel(title = "Child material deprivation",
                        value = "child_material_deprivation",

                        h2("Child material deprivation")
               ),

               ##############################################.
               # CHILD SOCIAL AND PHYSICAL DEVELOPMENT----
               ##############################################.
               tabPanel(title = "Child social and physical development",
                        value = "child_development_cw",

                        h2("Child social and physical development", iButtonUI("child_development_cw", content = "Paste background info and source for child social and physical development here")),

                        br(),
                        br(),

                        actionButton("child_development_cw_modal_info",
                                     tags$b("Background information and source"),
                                     icon = icon_no_warning_fn("info-circle")),
                        br(),
                        br(),

                        h4("Use the drop downs to select a geography area (Scotland, Health Board or Council Area)",
                           " and a specific geography of interest to filter the visualisation"),


                        fluidRow(
                          column(3,
                                 selectizeInput("child_development_cw_geog_type",
                                                label = "Step 1. Select national or local geography level",
                                                choices = c("Scotland", "Health Board", "Council Area"),
                                                selected = "Scotland")),
                          column(3,
                                 selectizeInput("child_development_cw_geog_name",
                                                label = "Step 2. Select national or local geography area",
                                                choices = unique(geog_lookup %>% filter(geography_type == "Scotland") %>% .$geography)
                                 ))),


                        plot_title("Proportion of health visitor reviews where any form of developmental concern was raised",
                                   "child_development_cw_plot",
                                   subtitle = "This chart will display a comparison line on the chart.
                                   For health boards, Scotland data will also be provided.
                                   For council areas, health board data will also be provided."),


                        h3("This is a sample of a different sort of geography input chart, with a bit more flexibility"),
                        p("Select up to 3 Health Boards and Council Areas to compare on the chart using the boxes below.",
                          "Scotland will always be displayed"),

                        fluidRow(

                          column(4,
                                 selectizeInput("child_development_cw_healthboard",
                                                label = "Select Health Board(s) (3 Max)",
                                                choices = unique(master_lookup$hb2019name),
                                                multiple = TRUE,
                                                selected = "NHS Ayrshire and Arran",
                                                options = list(maxItems = 3,
                                                               plugins = c('remove_button')))
                          ),
                          column(8,
                                 selectizeInput("child_development_cw_local_LA",
                                                label = "Select Council Area(s) (3 Max)",
                                                choices = unique(lookup_LA),
                                                multiple = TRUE,
                                                selected = "Aberdeen City",
                                                options = list(maxItems = 3,
                                                               plugins = c('remove_button')))
                          )),




                        plot_title("Proportion of health visitor reviews where any form of developmental concern was raised",
                                   "child_development_cw_plot_2"),



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

                        h2("Children at risk of obesity", iButtonUI("child_obesity", content = "Paste background info and source for children at risk of obesity here")),

                        h4("Percentage of children (2-15) at risk of obesity in Scotland over time"),

                        plotlyOutput("child_obesity_plot"),

                        br(),
                        h3("Data table: Percentage of children (2-15) at risk of obesity in Scotland"),
                        br(),
                        dataDownloadUI("children_at_risk_of_obesity")
               ),

               ##############################################.
               # INFANT MORTALITY ----
               ##############################################.

               tabPanel(title = "Infant mortality",
                        value = "infant_mortality_cw",

                        h2("Infant mortality", iButtonUI("infant_mortality_cw", content = "Paste background info and source for infant mortality here")),

                        actionButton(
                          "infant_mortality_cw_modal_info",
                          tags$b("Background information and source"),
                          icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton(
                          "infant_mortality_cw_modal_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),


                        plot_title("Month rate of infant deaths per 1,000 live births in Scotland",
                                   "infant_mortality_cw_plot"),


                        h3("Data table: Monthly rate of infant deaths per 1,000 live births in Scotland"),

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








