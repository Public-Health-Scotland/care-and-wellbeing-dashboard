tagList(
  h1("Pursuing environmental sustainability and health equity together" ),
  br(),
  bsButton("environmental_sustainability_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),
  navlistPanel(widths = c(2,10),

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
