tagList(

  h1("Social carers survey" ),
  br(),
  h4(strong("Select indicator: ")),

  navlistPanel(widths = c(2,10),

               ##############################################.
               # EXPERIENCE OF SOCIAL CARE RECIPIENTS----
               ##############################################.


               tabPanel(title = "Experience of social care recipients ",
                        value = "experience_care_recipients",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Experience of social care recipients")

               ),

               ##############################################.
               # EXPERIENCE OF UNPAID CARERS----
               ##############################################.


               tabPanel(title = "Experience of unpaid carers ",
                        value = "experience_of_unpaid_carers",
                        icon = icon_no_warning_fn("hand-holding-hand"),

                        h3("Experience of unpaid carers"),

                        h4("Percentage of unpaid carers who agree with the sentence “I feel supported to continue caring“"),

                        plotlyOutput("experience_unpaid_carers_plot"),

                        DT::dataTableOutput("experience_unpaid_carers_table")


               )

  ) #navlistPanel
) # tagList








