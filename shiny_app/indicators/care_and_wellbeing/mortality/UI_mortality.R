tagList(

  h1("Mortality" ),
  br(),
  h4(strong("Select indicator: ")),

  navlistPanel(widths = c(2,10),

               ##############################################.
               # ALL-CAUSE MORTALITY (15-44)----
               ##############################################.

               tabPanel(title = "All-cause mortality",
                        value = "all-cause_mortality",
                        icon = icon_no_warning_fn("file-waveform"),

                        h3("All-cause mortality (ages 15-44)"),

                        fluidRow(
                          column(2,
                                 selectizeInput("geog_type_mortality",
                                                "1. Select geography type",
                                                choices = c("Scotland",
                                                            "Health Board",
                                                            "Council Area"))),
                          column(2,
                                 uiOutput("mortality_input_ui")),
                          column(8,
                                 radioButtons("rate_number_mortality",
                                              "3. View rate per 100,000 population or number of deaths",
                                              choices = c("Rate",
                                                          "Number")))

                        ),


                          h3("All-cause mortality, ages 15-44"),
                          plotlyOutput("mortality_line_chart"),
                          h3("Data table"),
                          DT::dataTableOutput("mortality_data")


               ),

               ##############################################.
               # CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
               ##############################################.

               tabPanel(title = "Coronary heart disease deaths",
                        value = "chd_deaths",
                        icon = icon_no_warning_fn("heart"),


                        h3("Coronary heart disease (CHD) deaths (aged <75)"),

                        fluidRow(
                          column(2,
                                 selectizeInput("geog_type_chd",
                                                "1. Select geography type",
                                                choices = c("Scotland",
                                                            "Health Board",
                                                            "HSCP",
                                                            "Council Area",
                                                            "Locality",
                                                            "Intermediate Zone"))
                          ),
                          column(10,
                                 uiOutput("chd_input_ui"))
                        ),

                        plot_title("Coronary heart disease deaths (aged <75), age-sex standardised rates per 100,000",
                                   "chd_CI_chart",
                                   subtitle = "The shaded line indicates confidence intervals"),

                        h3("Data table"),
                        DT::dataTableOutput("chd_data")



               ),

               ##############################################.
               # DRUG RELATED DEATHS----
               ##############################################.

               tabPanel(title = "Drug-related deaths",
                        value = "drug_deaths",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Drug relatedf deaths"),



                 fluidRow(
                   column(2,
                          selectizeInput("geog_type_drug_deaths", "1. Select a geography type",
                                         choices = c("Scotland", "Health Board", "Council Area"))),

                   column(2,

                          uiOutput("geography_drug_deaths")),

                   column(8,
                          radioButtons("rate_number_drug_deaths",
                                       "3. View rate per 100,000 population or number of deaths",
                                       choices = c("Rate",
                                                   "Number")))
                 ),

                 plot_title("Drug misuse deaths by 5 year periods",
                            "drug_deaths_chart",
                            subtitle = "Please note, rates based on fewer than 10 deaths are not shown"),

                 h3("Data table"),
                 DT::dataTableOutput("drug_deaths_data")



               ),

               ##############################################.
               # ALCOHOL SPECIFIC DEATHS  (aged 45-74)----
               ##############################################.

               tabPanel(title = "Alcohol specific deaths",
                        value = "alcohol_specific_deaths",
                        icon = icon_no_warning_fn("lemon"),

                        h3("Alcohol specific deaths")
               )
  )

)








