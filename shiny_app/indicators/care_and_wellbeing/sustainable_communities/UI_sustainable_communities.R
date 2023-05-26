tagList(

  h1("Create and Develop Healthy and Sustainable Places and Communities"),
  br(),
  bsButton("sustainable_communities_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10),

               ##############################################.
               # LONELINESS----
               ##############################################.
               tabPanel(title = "Loneliness (to be developed)",
                        value = "loneliness",

                        h2("Loneliness"),

                        p("Content to be developed")
               ),

               ##############################################.
               # NUMBER OF AREAS WHERE HEALTH INEQUALITIES ARE REDUCING----
               ##############################################.
               tabPanel(title = "Number of areas where health inequalities are reducing (to be developed)",
                        value = "ares_of_health_inequalities",

                        h2("Number of areas where health inequalities are reducing"),

                        p("Content to be developed")
               ),

               ##############################################.
               # PERCEPTIONS TO THE LOCAL AREA----
               ##############################################.
               tabPanel(title = "Perceptions of local area (to be developed)",
                        value = "perceptions_of_local_area",

                        h2("Perceptions of local area"),

                        p("Content to be developed")
               ),

               ##############################################.
               # PLACES TO INTERACT----
               ##############################################.
               tabPanel(title = "Places to interact (to be developed)",
                        value = "places_to_intereact",

                        h2("Places to interact"),

                        p("Content to be developed")
               )
  )
)
