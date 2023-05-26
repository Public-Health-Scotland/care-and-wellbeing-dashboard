tagList(

  h1("Ensure Healthy Standard of Living For All"),
  br(),
  bsButton("healthy_standard_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),


  navlistPanel(widths = c(2,10),


               ##############################################.
               # FOOD INSECURITY----
               ##############################################.
               tabPanel(title = "Food insecurity (to be developed)",
                        value = "food_insecurity",

                        h2("Food insecurity"),

                        p("Content to be developed")
               ),

               ##############################################.
               # PERSISTENT POVERTY----
               ##############################################.
               tabPanel(title = "Persistent poverty (to be developed)",
                        value = "persistent_poverty",

                        h2("Persistent poverty"),

                        p("Content to be developed")
               ),

               ##############################################.
               # SATISFCATION WITH HOUSING----
               ##############################################.
               tabPanel(title = "Satisfaction with housing (to be developed)",
                        value = "satisfaction_with_housing",

                        h2("Satisfaction with housing"),

                        p("Content to be developed")
               )


  )
)
