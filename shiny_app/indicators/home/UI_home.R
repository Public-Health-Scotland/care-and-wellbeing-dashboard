sidebarLayout(
  sidebarPanel(width = 4,
               radioGroupButtons("home_select", status = "home",
                                 choices = home_list,
                                 direction = "vertical", justified = T)),

  mainPanel(width = 8,
            # About
            conditionalPanel(
              condition= 'input.home_select == "about"',

              # These have to be uiOutputs rather than just tagLists because otherwise
              # the ui loads before the conditional panel hides the info so for some
              # time at the beginning of the app all of the panels are visible
              withSpinner(uiOutput("home_about"))

            ), # conditionalPanel

            # Using the dashboard
            conditionalPanel(
              condition= 'input.home_select == "use"',

              withSpinner(uiOutput("home_dashboard"))


            ), # condtionalPanel

            # News and future updates
            conditionalPanel(
              condition= 'input.home_select == "future"',

              withSpinner(uiOutput("home_news_updates"))

            ), # conditionalPanel

            # Further information
            conditionalPanel(
              condition= 'input.home_select == "info"',

              withSpinner(uiOutput("home_further_info"))

            ) # conditionalPane

            # Accessibility
            # conditionalPanel(
            #   condition= 'input.home_select == "accessibility"',
            #
            # withSpinner(uiOutput("home_accessibility"))
            #
            # ) # conditonalPanel
  ) # mainPanel
) # sidebarLayout
