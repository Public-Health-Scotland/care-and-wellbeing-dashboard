tagList(
  h1("Pursuing Environmental Sustainability and Health Equity Together" ),
  br(),
  bsButton("environmental_sustainability_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),
  navlistPanel(widths = c(2,10),

               ##############################################.
               # ACCESS TO GREEN AND BLUE SPACE----
               ##############################################.
               tabPanel(title = "Access to green and blue space (to be developed)",
                        value = "blue_green_space",

                        h2("Access to green and blue space"),

                        p("Content to be developed")
               ),

               ##############################################.
               # JOURNEYS BY ACTIVE TRAVEL----
               ##############################################.

               tabPanel(title = "Journeys by active travel (to be developed)",
                        value = "journeys_active",

                        h2("Journeys by active travel"),

                        p("Content to be developed")
               ),

               ##############################################.
               # VISITS TO THE OUTDOORS----
               ##############################################.

               tabPanel(title = "Visits to the outdoors (to be developed)",
                        value = "visit_outdoors",

                        h2("Visits to the outdoors"),

                        p("Content to be developed")
               )

  )
)
