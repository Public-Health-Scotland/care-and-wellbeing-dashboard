tagList(

  h1("Wellbeing of children and young people"),
  br(),
  actionButton("wellbeing_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10),


               ##############################################.
               # CHILD POVERTY----
               ##############################################.
               tabPanel(title = "Child poverty",
                        value = "child_poverty",
                        icon = icon_no_warning_fn("house-chimney-user"),

                        h3("Child poverty"),

                        p("This indicator shows the rate of children in relative poverty after housing costs. ",
                          " Relative poverty means being below 60% of the UK median income."),
                        tags$b("The latest estimate for 2020/21 is unreliable. ",
                               "This is due to a small sample size during the pandemic. ",
                               "Therefore the sample size is not representative of Scotland."),
                        p("Source: Scottish Family Resources Survey"),


                        #bsButton("jump_home_child_poverty", "Go to home page"),
                        bsButton("childpoverty_to_info", "Go to information page"),





                        plot_title("Proportion of people who are in relative poverty
                                 (below 60% of UK median income after housing costs), Scotland",
                                   "child_poverty_chart",
                                   subtitle = "Click on the legend to filter the chart"),



                        h3("Data table: Proportion of people who are in relative poverty after housing costs in Scotland"),
                        DT::dataTableOutput("child_poverty_data"),

                        dataDownloadUI("child_poverty")


               ),

               ##############################################.
               # Positive desinations of school leavers----
               ##############################################.
               tabPanel(title = "Positive desinations of school leavers",
                        value = "positive_destinations",
                        icon = icon_no_warning_fn("school"),

                        h3("Positive destinations of school leavers"),

                        #bsButton("jump_home_positive_destinations", "Go to home page"),
                        bsButton("positivedestinations_to_info", "Go to information page"),

                        br(),
                        br(),



                        actionButton("positive_destinations_modal_info",
                                     tags$b("Background information and source"),
                                     icon = icon_no_warning_fn("info-circle")
                        ),

                        actionButton("positive_destinations_modal_comment",
                                     tags$b("Summary of indicator during covid and pre-covid period"),
                                     icon = icon_no_warning_fn("info-circle")
                        ),

                        br(),
                        br(),

                        selectizeInput("school_leavers_category_input",
                                       label = "Select pupil characteristic category:",
                                       choices = positive_destinations_school_leavers$category %>% unique(),
                                       selected = "All Leavers"),

                        withSpinner(plotlyOutput("school_leavers_line_figure")),

                        h3("Data table: Percentage of school leavers in positive destinations"),
                        DT::dataTableOutput("school_leavers_data"),

                        dataDownloadUI("school_leavers")
               ),


               ##############################################.
               # Pre-school development----
               ##############################################.
               tabPanel(title = "Pre-school development",
                        value = "pre_school_development",
                        icon = icon_no_warning_fn("shapes"),

                        h3("Pre-school development"),

                        #bsButton("jump_home_preschool", "Go to home page"),
                        bsButton("preschooldevelopment_to_info", "Go to information page"),
                        br(),
                        br(),

                        actionButton("preschool_modal_info",
                                     tags$b("Background information and source"),
                                     icon = icon_no_warning_fn("info-circle")),
                        br(),
                        br(),

                        h4("Use the drop downs to select a geography area (Scotland, Health Board or Council Area)",
                           " and a specific geography of interest to filter the visualisation"),


                        fluidRow(
                          column(4,
                                 selectizeInput("preschool_geog_type",
                                                label = "1. Select geography type",
                                                choices = c("Scotland", "Health Board", "Council Area"),
                                                selected = "Scotland")),
                          column(8,
                                 selectizeInput("preschool_geog_name",
                                                label = "2. Select geography",
                                                choices = unique(preschool %>% filter(geography == "Scotland") %>% .$geography),
                                                selected = "Scotland")
                          )),


                        plot_title("Proportion of health visitor reviews where any form of developmental concern was raised",
                                   "preschool_chart_line",
                                   subtitle = "This chart will display a comparison line on the chart.
                               For health boards, Scotland data will also be provided.
                               For council areas, health board data will also be provided."),


                        h3("This is a sample of a different sort of geography input chart, with a bit more flexibility"),
                        p("Select up to 3 Health Boards and Council Areas to compare on the chart using the boxes below.",
                          "Scotland will always be displayed"),

                        fluidRow(

                          column(4,
                                 selectizeInput("HB_input",
                                                label = "Select Health Board(s) (3 Max)",
                                                choices = unique(master_lookup$hb2019name),
                                                multiple = TRUE,
                                                selected = "NHS Ayrshire and Arran",
                                                options = list(maxItems = 3,
                                                               plugins = c('remove_button')))
                          ),
                          column(8,
                                 selectizeInput("LA_input",
                                                label = "Select Council Area(s) (3 Max)",
                                                choices = unique(lookup_LA),
                                                multiple = TRUE,
                                                selected = "Aberdeen City",
                                                options = list(maxItems = 3,
                                                               plugins = c('remove_button')))
                          )),




                        plot_title("Proportion of health visitor reviews where any form of developmental concern was raised",
                                   "preschool_chart_line2"),



                        h3("Data table"),
                        radioButtons("preschool_radiobuttons",
                                     "Select geography type for data table",
                                     choices = unique(preschool$geography_type),
                                     inline = TRUE),
                        DT::dataTableOutput("preschool_data")
               ),

               ##############################################.
               # Being listened to and involved in decision making----
               ##############################################.
               tabPanel(title = "Being listened to and involved in decision making",
                        value = "listen_to_decision_making",
                        icon = icon_no_warning_fn("comment"),

                        h3("Being listened to and involved in decision making"),

                        #bsButton("jump_home_listen_to_decision_making", "Go to home page"),
                        bsButton("listento_to_info", "Go to information page")),

               ##############################################.
               # CAMHS waiting times----
               ##############################################.
               tabPanel(title = "CAMHS waiting times",
                        value = "camhs_waiting_times",
                        icon = icon_no_warning_fn("clipboard-check"),

                        h3("CAMHS waiting times"),

                        #bsButton("jump_home_camhs_waiting_times", "Go to home page"),
                        bsButton("camhs_to_info", "Go to information tab"),
                        br(),
                        br(),

                        actionButton("camhs_modal_info",
                                     tags$b("Background information and source"),
                                     icon = icon_no_warning_fn("info-circle")),


                        p("Use the below drop-down menu to select a Health Board of interest.",
                          "Please note that for some healthboards there are no data in some months and will appear as a gap on the graphs."),

                        selectInput("HB_CAMHS",
                                    label = "Select Health Board",
                                    choices = lookup_HB,
                                    selected = "Scotland"),

                        plot_title("Proportion of CAMHS patients seen by wait time since referral",
                                   'camhs_waiting_times_graph_stack',
                                   subtitle = "Click on the legend to filter the chart"),
                        plot_title("Proportion of patients seen within 18 weeks of referral",
                                   "camhs_waiting_times_graph_line"),
                        radioButtons(inputId = "vlines_camhs",
                                     label = "Toggle lockdown timeline",
                                     choices = c("On", "Off"),
                                     selected = "On",
                                     inline = TRUE),


                        h3("Data table: Proportion of CAMHS patients seen by wait time since referral"),
                        DT::dataTableOutput("camhs_data"),

                        dataDownloadUI("camhs")

               ),

               ##############################################.
               # PROTECTION FROM HARM----
               ##############################################.
               tabPanel(title = "Protection from harm",
                        value = "protection_from_harm",
                        icon = icon_no_warning_fn("hands-holding-child"),

                        h3("Protection from harm"),

                        #bsButton("jump_home_protection_from_harm", "Go to home page"),
                        bsButton("protectionharm_to_info", "Go to information tab"),
                        br(),
                        br(),

                        actionButton("protection_from_harm_modal_info",
                                     tags$b("Background information and source"),
                                     icon = icon_no_warning_fn("info-circle")
                        ),
                        actionButton("protection_from_harm_modal_comment",
                                     tags$b("Summary of indicator during covid and pre-covid period"),
                                     icon = icon_no_warning_fn("info-circle")
                        ),


                        plot_title("Number of children subject to interagency referral discussions by fortnight ending (Wednesdays)",
                                   'protection_harm_line',
                                   subtitle = paste0("The fluctuations in the chart below reflect when schools are open or not, ",
                                                     "for both COVID-19 measures and school holidays. School holiday periods vary between local authority areas, ",
                                                     "but generally fall into the periods Easter (late March/early April), Summer (late June/early July), Autumn (October), and Christmas (December).")),


                        h3("Data table: Number of children subject to interagency referral discussions"),
                        DT::dataTableOutput("protection_harm_data"),

                        dataDownloadUI("protection_harm")


               ),

               ##############################################.
               # Infant mortality----
               ##############################################.
               tabPanel(title = "Infant mortality",
                        value = "infant_mortality",
                        icon = icon_no_warning_fn("hospital"),

                        h2("Infant mortality"),

                        #bsButton("jump_home_infant_mortality", "Go to home page"),
                        bsButton("infantmortality_to_info", "Go to information page"),
                        br(),
                        br(),


                        # actionButton(
                        #   "infant_mortality_modal_info",
                        #   tags$b("Background information and source"),
                        #   icon = icon_no_warning_fn("info-circle")
                        # ),

                        actionButton(
                          "infant_mortality_modal_comment",
                          tags$b("Summary of indicator during covid and pre-covid period"),
                          icon = icon_no_warning_fn("info-circle")
                        ),
                        br(),


                        plot_title("Month rate of infant deaths per 1,000 live births in Scotland",
                                   'infant_mortality_graph'),


                        h3("Data table: Monthly rate of infant deaths per 1,000 live births in Scotland"),
                        DT::dataTableOutput("infant_mortality_data"),

                        dataDownloadUI("infant_mortality")
               ),
               ##############################################.
               # Physical Activity----
               ##############################################.

               tabPanel(title = "Physical activity",
                        value = "physical_activity",
                        icon = icon_no_warning_fn("person-walking"),

                        h3("Physical Activity"),

                        #bsButton("jump_home_physical_activity", "Go to home page"),
                        bsButton("physicalactivity_to_info", "Go to information page")
               ),

               ##############################################.
               # Mental health and wellbeing----
               ##############################################.
               tabPanel(title = "Mental health and wellbeing",
                        value = "mental_health_wellbeing",
                        icon = icon_no_warning_fn("user-nurse"),

                        h3("Mental health and wellbeing"),

                        #bsButton("jump_home_mental_health_wellbeing", "Go to home page"),
                        bsButton("mentalhealthwellbeing_to_info", "Go to information page")
               )
  )
)
