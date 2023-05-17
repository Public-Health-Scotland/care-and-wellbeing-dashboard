tagList(

  h1("Enable all children, young people and adults to maximise their capabilities and control over their lives"),
  br(),

  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10),

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
                                         selected = "Scotland")),
                                 column(4,
                                        selectInput("camhs_waiting_times_cw_geog_name",
                                          "Step 2: Select national or local geography area",
                                          choices = c("Scotland"),
                                          width = "100%"))
                                 ),

                        withSpinner(plotlyOutput("camhs_waiting_times_cw_seen_since_plot")),

                        plot_title("Proportion of patients seen within 18 weeks of referral",
                                   "camhs_waiting_times_cw_seen_within_plot"),
                        radioButtons(inputId = "camhs_waiting_times_cw_vlines",
                                     label = "Toggle lockdown timeline",
                                     choices = c("On", "Off"),
                                     selected = "On",
                                     inline = TRUE),


                        h3(textOutput({"camhs_cw_table_title"})),
                        p("The data table is based on the selections above. To view the full dataset, please use the download buttons below."),

                        dataDownloadUI("camhs_cw")

               ),

               ##############################################.
               # CHILDREN HAVE POSITIVE RELATIONSHIPS----
               ##############################################.
               tabPanel(title = "Children have positive relationships",
                        value = "children_relationships",

                        h2("Children have positive relationships")
               ),

               ##############################################.
               # CHILDREN'S VOICES----
               ##############################################.
               tabPanel(title = "Children’s voices",
                        value = "childrens_voices",

                        h2("Children’s voices")
               ),



               ##############################################.
               # CONFIDENCE AND RESILIENCE OF CHILDREN AND YOUNG PEOPLE----
               ##############################################.
               tabPanel(title = "Confidence and resilience of children and young people",
                        value = "confidence_of_young",

                        h2("Confidence and resilience of children and young people")
               ),

               ##############################################.
               # MENTAL HEALTH / MENTAL WELLBEING----
               ##############################################.
               tabPanel(title = "Mental health / mental wellbeing ",
                        value = "mental_health_cw",

                        h2("Mental health / mental wellbeing ")
               )


  )
)

