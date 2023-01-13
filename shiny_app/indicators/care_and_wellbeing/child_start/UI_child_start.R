tagList(

  h1("Giving every child the best start in life" ),
  bsButton("child_start_to_info", "Go to 'Giving every child the best start in life' information page", class = "to_info-btn"),
  br(),
  h4(strong("Select indicator: ")),

  navlistPanel(widths = c(2,10),

         ##############################################.
         # INFANT MORTALITY ----
         ##############################################.

         tabPanel(title = "Infant mortality",
                  value = "infant_mortality",
                  icon = icon_no_warning_fn("hospital"),

                  h3("Infant mortality"),

                  #bsButton("jump_home_infant_mortality", "Go to home page"),
                  #bsButton("infantmortality_to_info", "Go to information page"),

                  # br(),
                  # br(),


                           actionButton(
                             "infant_mortality_modal_info",
                             tags$b("Background information and source"),
                             icon = icon_no_warning_fn("info-circle")
                           ),

                           actionButton(
                             "infant_mortality_modal_comment",
                             tags$b("Summary of indicator during covid and pre-covid period"),
                             icon = icon_no_warning_fn("info-circle")
                           ),


                    plot_title("Month rate of infant deaths per 1,000 live births in Scotland",
                               "infant_mortality_graph_2"),


                    h3("Data table"),
                    DT::dataTableOutput("infant_data_2")
                  ),



         ##############################################.
         # CHILDREN (2-15) AT RISK OF OBESITY----
         ##############################################.

         tabPanel(title = "Children at risk of obesity",
                  value = "child_obesity",
                  icon = icon_no_warning_fn("child-reaching"),

                  h3("Children at risk of obesity"),

                  h4("Percentage of children (2-15) at risk of obesity in Scotland over time"),

                  plotlyOutput("childhood_obesity_plot"),

                  DT::dataTableOutput("childhood_obesity_table")
                  )
  )

)








