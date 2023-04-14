tagList(
  fluidRow(width=12,
           h1("COVID-19 & respiratory surveillance in Scotland"),
           linebreaks(1),

           tagList(

             tabBox(width= NULL, type = "pills",
                    tabPanel("Covid Recovery",

                             linebreaks(2),
                             fluidRow(column(6,

                                             pickerInput("summary_v2_choice1",
                                                         "Step 1: ",
                                                         choices = c("1", "2"),
                                                         width = "100%")),
                                      column(6,

                                             pickerInput("summary_v2_choice2",
                                                         "Step 2: ",
                                                         choices = c("1", "2"),
                                                         width = "100%")
                                      )

                             )),

                    tabPanel("Care and Wellbeing",
                             linebreaks(2),
                             fluidRow(column(6,

                                             pickerInput("summary_v2_choice1",
                                                         "Step 1: ",
                                                         choices = c("1", "2"),
                                                         width = "100%")),
                                      column(6,

                                             pickerInput("summary_v2_choice2",
                                                         "Step 2: ",
                                                         choices = c("1", "2"),
                                                         width = "100%"))

                             ))
             )
           ))

)
