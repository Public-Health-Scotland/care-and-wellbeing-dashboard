tagList(

  h1("Enable all children, young people and adults to maximise their capabilities and control over their lives"),
  br(),
  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10),


               ##############################################.
               # CHILDREN'S VOICES----
               ##############################################.
               tabPanel(title = "Children’s voices",
                        value = "childrens_voices",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Children’s voices")
               ),

               ##############################################.
               # CHILDREN HAVE POSITIVE RELATIONSHIPS----
               ##############################################.
               tabPanel(title = "Children have positive relationships",
                        value = "children_relationships",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Children have positive relationships")
               ),

               ##############################################.
               # CONFIDENCE AND RESILIENCE OF CHILDREN AND YOUNG PEOPLE----
               ##############################################.
               tabPanel(title = "Confidence and resilience of children and young people",
                        value = "confidence_of_young",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Confidence and resilience of children and young people")
               ),

               ##############################################.
               # MENTAL HEALTH / MENTAL WELLBEING----
               ##############################################.
               tabPanel(title = "Mental health / mental wellbeing ",
                        value = "mental_health",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Mental health / mental wellbeing ")
               ),

               ##############################################.
               # CAMHS WAITING TIMES----
               ##############################################.
               tabPanel(title = "CAHMS waiting times",
                        value = "camhs_waiting_times_2",
                        icon = icon_no_warning_fn("lemon"),

                        h3("CAHMS waiting times"),

                        actionButton("camhs_waiting_times_2_modal_info",
                                     tags$b("Background information and source"),
                                     icon = icon_no_warning_fn("info-circle")),


                        p("Use the below drop-down menu to select a Health Board of interest.",
                          "Please note that for some healthboards there are no data in some months and will appear as a gap on the graphs."),

                        selectInput("HB_camhs_waiting_times_2",
                                    label = "Select Health Board",
                                    choices = lookup_HB,
                                    selected = "Scotland"),

                        plot_title("Proportion of CAMHS patients seen by wait time since referral",
                                   'camhs_waiting_times_2_graph_stack',
                                   subtitle = "Click on the legend to filter the chart"),
                        plot_title("Proportion of patients seen within 18 weeks of referral",
                                   "camhs_waiting_times_2_graph_line"),
                        radioButtons(inputId = "vlines_camhs_waiting_times_2",
                                     label = "Toggle lockdown timeline",
                                     choices = c("On", "Off"),
                                     selected = "On",
                                     inline = TRUE),


                        h3("Data table"),
                        DT::dataTableOutput("camhs_waiting_times_2_data")

               )
  )
)

