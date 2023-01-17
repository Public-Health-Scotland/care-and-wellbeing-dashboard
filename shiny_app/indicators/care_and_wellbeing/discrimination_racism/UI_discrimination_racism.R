tagList(
  h1("Tackling discrimination, racism and their outcomes" ),
  br(),
  h4(strong("Select indicator: ")),
  navlistPanel(widths = c(2,10),

               ##############################################.
               # PUBLIC SERVICES TREAT PEOPLE WITH DIGNITY AND RESPECT----
               ##############################################.

               tabPanel(title = "Public services treat people with dignity and respect",
                        value = "dignity_respect",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Public services treat people with dignity and respect")
               ),

               ##############################################.
               # GENDER BALANCE IN ORGANISATIONS----
               ##############################################.

               tabPanel(title = "Gender balance in organisations",
                        value = "gender_balance",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Gender balance in organisations")
               )
  )
)
