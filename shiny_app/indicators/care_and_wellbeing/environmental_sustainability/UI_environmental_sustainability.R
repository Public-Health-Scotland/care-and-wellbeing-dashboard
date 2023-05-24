tagList(
  h1("Pursuing environmental sustainability and health equity together" ),
  br(),
  navlistPanel(widths = c(2,10), id = "environmental_sustainability_panel",

               ##############################################.
               # ACCESS TO GREEN AND BLUE SPACE----
               ##############################################.
               tabPanel(title = "Access to green and blue space",
                        value = "blue_green_space",

                        h2("Access to green and blue space")
               ),

               ##############################################.
               # JOURNEYS BY ACTIVE TRAVEL----
               ##############################################.

               tabPanel(title = "Journeys by active travel",
                        value = "journeys_active",

                        h2("Journeys by active travel")
               ),

               ##############################################.
               # VISITS TO THE OUTDOORS----
               ##############################################.

               tabPanel(title = "Visits to the outdoors",
                        value = "visit_outdoors",

                        h2("Visits to the outdoors")
               )

  )
)
