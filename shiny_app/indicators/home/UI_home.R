sidebarLayout(
  sidebarPanel(width = 4,
               radioGroupButtons("home_select", status = "home",
                                 choices = home_list,
                                 direction = "vertical", justified = T)),

  mainPanel(width = 8,
            # About
            conditionalPanel(
              condition= 'input.home_select == "about"',
              tagList(h3("About")#div
              )# tagList
            ), # conditionalPanel

            # Using the dashboard
            conditionalPanel(
              condition= 'input.home_select == "use"',
              tagList(h3("Using the dashboard")) #tagList
                      ), # condtionalPanel

            # News and future updates
            conditionalPanel(
              condition= 'input.home_select == "future"',
              tagList(h3("News and future updates")) # tagList
            ), # conditionalPanel

            # Further information
            conditionalPanel(
              condition= 'input.home_select == "info"',
              tagList(h3("Further information")) # tagList
            ), # conditionalPane

            # Accessibility
            conditionalPanel(
              condition= 'input.home_select == "accessibility"',
              tagList(h3("Accessibility")
              ) # tagList
            ) # conditonalPanel
                      ) # mainPanel
  ) # sidebarLayout
