tagList(

  h1("Ensure healthy standard of living for all"),
  br(),

  navlistPanel(widths = c(2,10), id = "healthy_standard_panel",


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
