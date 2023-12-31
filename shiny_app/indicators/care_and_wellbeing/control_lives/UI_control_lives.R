tagList(

  h1("Enable All Children, Young People and Adults to Maximise Their Capabilities and Control Over Their Lives"),
  br(),

  navlistPanel(widths = c(2,10), id = "control_lives_panel",

               ##############################################.
               # CAMHS WAITING TIMES----
               ##############################################.
               tabPanel(title = "CAMHS waiting times",
                        value = "camhs_waiting_times_cw",

                        h2("CAMHS waiting times", iButtonUI("camhs_waiting_times_cw",
                                                            content = paste("This indicator provides data on Child and Adolescent Mental Health Services",
                                                            "(CAMHS) appointment waiting times.",
                                                                            "<br><br>Source:",
                                                                            "<a href= https://www.publichealthscotland.scot/publications/child-and-adolescent-mental-health-services-camhs-waiting-times/child-and-adolescent-mental-health-services-camhs-waiting-times-quarter-ending-31-december-2021/#:~:text=For%20the%20quarter%20ending%20December%202021%3A%20Seven%20out,from%2073.1%25%20for%20the%20quarter%20ending%20December%202020./ target =_blank> CAMHS Waiting Times,  Public Health Scotland (external site)</a>.",
                                                                            "<br><br>The most current data available displayed in the Care and Wellbeing dashboard is",
                                                                            "March 2023.",
                                                                            # "More up to date data is available at source.",
                                                                            "<br><br>These data are available at Scotland",
                                                                            "and NHS Health Board levels.",
                                                            "<br><br> More detailed information can be found in the accompanying",
                                                            "<a href=https://www.publichealthscotland.scot/media/20214/care-and-wellbeing-dashboard-metadata.xlsx target = blank> metadata </a> file."))),

                        # p("Use the below drop-down menu to select a Health Board of interest.",
                        #   "Please note that for some healthboards there are no data in some months and will appear as a gap on the graphs."),

                        fluidRow(column(4,
                                        selectInput("camhs_waiting_times_cw_geog_type",
                                                    "Step 1: Select national or local geography level",
                                                    choices = c("Scotland", "Health Board"),
                                                    selected = "Scotland",
                                                    selectize = FALSE,
                                                    width = "100%")),

                                 column(4,
                                        selectInput("camhs_waiting_times_cw_geog_name",
                                                    "Step 2: Select national or local geography area",
                                                    choices = c("Scotland"),
                                                    selectize = FALSE,
                                                    width = "100%"))
                        ),

                        altTextUI("camhs_waiting_times_cw_seen_since_alt"),
                        withSpinner(plotlyOutput("camhs_waiting_times_cw_seen_since_plot")),

                        br(),
                        altTextUI("camhs_waiting_times_cw_seen_within_alt"),
                        radioButtons(inputId = "camhs_waiting_times_cw_vlines",
                                     label = "Toggle lockdown timeline",
                                     choices = c("On", "Off"),
                                     selected = "On",
                                     inline = TRUE),
                        withSpinner(plotlyOutput("camhs_waiting_times_cw_seen_within_plot")),

                        br(),
                        uiOutput({"camhs_cw_table_title"}),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),

                        dataDownloadUI("camhs_cw")

               ),

               ##############################################.
               # CHILDREN HAVE POSITIVE RELATIONSHIPS----
               ##############################################.
               tabPanel(title = "Children have positive relationships (to be developed)",
                        value = "children_relationships",

                        h2("Children have positive relationships"),

                        p("Content to be developed")
               ),

               ##############################################.
               # CHILDREN'S VOICES----
               ##############################################.
               tabPanel(title = "Children’s voices (to be developed)",
                        value = "childrens_voices",

                        h2("Children’s voices"),

                        p("Content to be developed")
               ),



               ##############################################.
               # CONFIDENCE AND RESILIENCE OF CHILDREN AND YOUNG PEOPLE----
               ##############################################.
               tabPanel(title = "Confidence and resilience of children and young people (to be developed)",
                        value = "confidence_of_young",

                        h2("Confidence and resilience of children and young people"),

                        p("Content to be developed")
               ),

               ##############################################.
               # MENTAL HEALTH / MENTAL WELLBEING----
               ##############################################.
               tabPanel(title = "Mental health / mental wellbeing (to be developed)",
                        value = "mental_health_cw",

                        h2("Mental health / mental wellbeing "),

                        p("Content to be developed")
               )


  )
)

