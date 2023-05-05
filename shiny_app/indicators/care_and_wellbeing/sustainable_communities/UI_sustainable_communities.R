tagList(

  h1("Create and develop healthy and sustainable places and communities"),
  br(),
  bsButton("sustainable_communities_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10),

               ##############################################.
               # LONELINESS----
               ##############################################.
               tabPanel(title = "Loneliness",
                        value = "loneliness",

                        h2("Loneliness")
               ),

               ##############################################.
               # NUMBER OF AREAS WHERE HEALTH INEQUALITIES ARE REDUCING----
               ##############################################.
               tabPanel(title = "Number of areas where health inequalities are reducing",
                        value = "ares_of_health_inequalities",

                        h2("Number of areas where health inequalities are reducing")
               ),

               ##############################################.
               # PERCEPTIONS TO THE LOCAL AREA----
               ##############################################.
               tabPanel(title = "Perceptions of local area",
                        value = "perceptions_of_local_area",

                        h2("Perceptions of local area")
               ),

               ##############################################.
               # PLACES TO INTERACT----
               ##############################################.
               tabPanel(title = "Places to interact",
                        value = "places_to_intereact",

                        h2("Places to interact")
               )
  )
)
