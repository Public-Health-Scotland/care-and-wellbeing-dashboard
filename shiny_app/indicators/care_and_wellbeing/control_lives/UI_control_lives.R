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
                                                            content = paste("<p>Child and Adolescent Mental Health Services (CAMHS) data are collected from all NHS Health Boards ",
                                                                            "across Scotland in a variety of ways. The Scottish Government standard states that 90% of ",
                                                                            "children and young people should start treatment within 18 weeks of referral to CAMHS.</p>",

                                                                            "<p>For all children/young people referred into the service during the Covid-19 pandemic CAMHS ",
                                                                            "are providing initial telephone triage to elicit more information. Dependent on levels of ",
                                                                            "risk identified some will be offered a time/date to undertake a complete assessment where ",
                                                                            "others, where levels of risk/concern identified a face-to-face assessment will be offered.</p>",

                                                                            "<a href=https://publichealthscotland.scot/publications/show-all-releases?id=20497> Source: CAMHS Waiting Times, Public Health Scotland </a>"))),

                        # p("Use the below drop-down menu to select a Health Board of interest.",
                        #   "Please note that for some healthboards there are no data in some months and will appear as a gap on the graphs."),

                        fluidRow(column(4,
                                        selectInput("camhs_waiting_times_cw_geog_type",
                                                    "Step 1: Select national or local geography level",
                                                    choices = c("Scotland", "Health Board"),
                                                    selected = "Scotland",
                                                    width = "100%")),

                                 column(4,
                                        selectInput("camhs_waiting_times_cw_geog_name",
                                                    "Step 2: Select national or local geography area",
                                                    choices = c("Scotland"),
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
                        h3(textOutput({"camhs_cw_table_title"})),
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

