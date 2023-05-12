tagList(

  h1("Ensure healthy standard of living for all"),
  br(),
  bsButton("healthy_standard_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10),


               ##############################################.
               # FOOD INSECURITY----
               ##############################################.
               tabPanel(title = "Food insecurity",
                        value = "food_insecurity",

                        h2("Food insecurity")
               ),

               ##############################################.
               # PERSISTENT POVERTY----
               ##############################################.
               tabPanel(title = "Persistent poverty",
                        value = "persistent_poverty",

                        h2("Persistent poverty")
               ),

               ##############################################.
               # SATISFCATION WITH HOUSING----
               ##############################################.
               tabPanel(title = "Satisfaction with housing",
                        value = "satisfaction_with_housing",

                        h2("Satisfaction with housing")
               )


  )
)
