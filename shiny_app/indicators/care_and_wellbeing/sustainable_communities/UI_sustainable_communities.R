tagList(

  h1("Create and develop healthy and sustainable places and communities"),
  br(),
  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10),


               ##############################################.
               # NUMBER OF AREAS WHERE HEALTH INEQUALITIES ARE REDUCING----
               ##############################################.
               tabPanel(title = "Number of areas where health inequalities are reducing",
                        value = "ares_of_health_inequalities",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Number of areas where health inequalities are reducing")
               ),

               ##############################################.
               # PERCEPTIONS TO THE LOCAL AREA----
               ##############################################.
               tabPanel(title = "Perceptions of local area",
                        value = "perceptions_of_local_area",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Perceptions of local area")
               ),

               ##############################################.
               # PLACES TO INTERACT----
               ##############################################.
               tabPanel(title = "Places to interact",
                        value = "places_to_intereact",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Places to interact")
               ),

               ##############################################.
               # LONELINESS----
               ##############################################.
               tabPanel(title = "Loneliness",
                        value = "loneliness",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Loneliness")
               )#,

               # ##############################################.
               # # ACCESS TO GREEN AND BLUE SPACE----
               # ##############################################.
               # tabPanel(title = "Access to green and blue space",
               #          value = "blue_green_space",
               #          icon = icon_no_warning_fn("lemon"),
               #
               #          h3("Access to green and blue space")
               # )
  )
)
