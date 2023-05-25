tagList(
  h1("Tackling Discrimination, Racism and Their Outcomes" ),
  br(),
  bsButton("discrimination_racism_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),
  navlistPanel(widths = c(2,10),

               ##############################################.
               # GENDER BALANCE IN ORGANISATIONS----
               ##############################################.

               tabPanel(title = "Gender balance in organisations (to be developed)",
                        value = "gender_balance",

                        h2("Gender balance in organisations"),

                        p("Content to be developed")
               ),

               ##############################################.
               # PUBLIC SERVICES TREAT PEOPLE WITH DIGNITY AND RESPECT----
               ##############################################.

               tabPanel(title = "Public services treat people with dignity and respect (to be developed)",
                        value = "dignity_respect",

                        h2("Public services treat people with dignity and respect"),

                        p("Content to be developed")
               )


  )
)
