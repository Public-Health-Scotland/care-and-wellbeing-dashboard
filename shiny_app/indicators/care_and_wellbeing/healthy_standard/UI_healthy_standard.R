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
                        icon = icon_no_warning_fn("lemon"),

                        h3("Food insecurity")
               ),

               ##############################################.
               # PERSISTENT POVERTY----
               ##############################################.
               tabPanel(title = "Persistent poverty",
                        value = "persistent_poverty",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Persistent poverty")
               ),

               ##############################################.
               # SATISFCATION WITH HOUSING----
               ##############################################.
               tabPanel(title = "Satisfaction with housing",
                        value = "satisfaction_with_housing",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Satisfaction with housing")
               )


  )
)
