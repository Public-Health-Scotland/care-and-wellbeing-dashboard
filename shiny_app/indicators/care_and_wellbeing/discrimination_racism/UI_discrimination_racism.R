tagList(
  h1("Tackling discrimination, racism and their outcomes" ),
  br(),
  navlistPanel(widths = c(2,10), id = "discrimination_racism_panel",

               ##############################################.
               # GENDER BALANCE IN ORGANISATIONS----
               ##############################################.

               tabPanel(title = "Gender balance in organisations",
                        value = "gender_balance",

                        h2("Gender balance in organisations")
               ),

               ##############################################.
               # PUBLIC SERVICES TREAT PEOPLE WITH DIGNITY AND RESPECT----
               ##############################################.

               tabPanel(title = "Public services treat people with dignity and respect",
                        value = "dignity_respect",

                        h2("Public services treat people with dignity and respect")
               )


  )
)
