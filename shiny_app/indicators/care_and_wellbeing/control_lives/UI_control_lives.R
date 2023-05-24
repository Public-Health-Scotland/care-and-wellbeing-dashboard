tagList(

  h1("Enable all children, young people and adults to maximise their capabilities and control over their lives"),
  br(),
  #bsButton("control_lives_to_info", "Go to information page", class = "info-btn"),

  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10), id = "control_lives_panel",

               ##############################################.
               # CAMHS WAITING TIMES----
               ##############################################.
               tabPanel(title = "CAMHS waiting times",
                        value = "camhs_waiting_times_cw",

                        h2("CAMHS waiting times", iButtonUI("camhs_waiting_times_cw", content = "Paste background info and source for camhs waiting times here")),

                        actionButton("camhs_waiting_times_cw_modal_info",
                                     tags$b("Background information and source"),
                                     icon = icon_no_warning_fn("info-circle")),


                        p("Use the below drop-down menu to select a Health Board of interest.",
                          "Please note that for some healthboards there are no data in some months and will appear as a gap on the graphs."),

                        fluidRow(column(3,
                                         selectInput("camhs_waiting_times_cw_geog_type",
                                         "Step 1: Select national or local geography level",
                                         choices = c("Scotland", "Health Board"),
                                         selected = "Scotland")),
                                 column(3,
                                        selectInput("camhs_waiting_times_cw_geog_name",
                                          "Step 2: Select national or local geography area",
                                          choices = c("Scotland"),
                                          width = "100%"))
                                 ),

                        plot_title("Proportion of CAMHS patients seen by wait time since referral",
                                   'camhs_waiting_times_cw_seen_since_plot',
                                   subtitle = "Click on the legend to filter the chart"),
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

