tagList(
  h1("Tackling discrimination, racism and their outcomes" ),
  br(),
  bsButton("discrimination_racism_to_info", "Go to information page", class = "info-btn"),
  h4(strong("Select indicator: ")),
  navlistPanel(widths = c(2,10),

               ##############################################.
               # GENDER BALANCE IN ORGANISATIONS----
               ##############################################.

               tabPanel(title = "Gender balance in organisations",
                        value = "gender_balance",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Gender balance in organisations")
               ),

               ##############################################.
               # PUBLIC SERVICES TREAT PEOPLE WITH DIGNITY AND RESPECT----
               ##############################################.

               tabPanel(title = "Public services treat people with dignity and respect",
                        value = "dignity_respect",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Public services treat people with dignity and respect")
               )


  )
)
