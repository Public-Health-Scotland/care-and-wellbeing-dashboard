tagList(

  h1("Giving every child the best start in life" ),
  bsButton("child_start_to_info", "Go to 'Giving every child the best start in life' information page", class = "to_info-btn"),
  br(),
  h4(strong("Select indicator: ")),

  navlistPanel(widths = c(2,10),

               ##############################################.
               # CHILD SOCIAL AND PHYSICAL DEVELOPMENT----
               ##############################################.
               tabPanel(title = "Child social and physical development",
                        value = "child_development_cw",
                        icon = icon_no_warning_fn("shapes"),

                        h3("Child social and physical development"),

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
                                                label = "1. Select geography type",
                                                choices = c("Scotland", "Health Board", "Council Area"),
                                                selected = "Scotland")),
                          column(3,
                                 selectizeInput("child_development_cw_geog_name",
                                                label = "2. Select geography",
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



                        h3("Data table"),
                        radioButtons("child_development_cw_geog_table",
                                     "Select geography type for data table",
                                     choices = unique(preschool$geography_type),
                                     inline = TRUE),
                        DT::dataTableOutput("child_development_cw_table")
                        ),

         ##############################################.
         # CHILD WELLBEING AND HAPPINESS----
         ##############################################.

         tabPanel(title = "Child wellbeing and happiness",
                  value = "child_wellbeing",
                  icon = icon_no_warning_fn("lemon"),

                  h3("Child wellbeing and happiness")
         ),

         ##############################################.
         # PERINATAL MORTALITY RATE----
         ##############################################.

         tabPanel(title = "Perinatal Mortality Rate",
                  value = "perinatal_mortality",
                  icon = icon_no_warning_fn("lemon"),

                  h3("Perinatal Mortality Rate")
         ),

         ##############################################.
         # CHILD MATERIAL DEPRIVATION----
         ##############################################.

         tabPanel(title = "Child material deprivation",
                  value = "child_material_deprevation",
                  icon = icon_no_warning_fn("lemon"),

                  h3("Child material deprivation")
         ),

         ##############################################.
         # PHYSICAL ACTIVITY OF CHILDREN----
         ##############################################.

         tabPanel(title = "Physical Activity (of children)",
                  value = "physical_activity_children",
                  icon = icon_no_warning_fn("lemon"),

                  h3("Physical Activity (of children)")
         ),



         ##############################################.
         # INFANT MORTALITY ----
         ##############################################.

         tabPanel(title = "Infant mortality",
                  value = "infant_mortality_cw",
                  icon = icon_no_warning_fn("hospital"),

                  h3("Infant mortality"),

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


                    h3("Data table"),
                    DT::dataTableOutput("infant_mortality_cw_table")
                  ),



         ##############################################.
         # AT RISK OF OBESITY----
         ##############################################.

         tabPanel(title = "Children at risk of obesity",
                  value = "child_obesity",
                  icon = icon_no_warning_fn("child-reaching"),

                  h3("Children at risk of obesity"),

                  h4("Percentage of children (2-15) at risk of obesity in Scotland over time"),

                  plotlyOutput("child_obesity_plot"),

                  DT::dataTableOutput("child_obesity_table")
                  )
  )

)








