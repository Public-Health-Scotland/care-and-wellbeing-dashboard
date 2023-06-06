sidebarLayout(
  sidebarPanel(width = 4,
               radioGroupButtons("home_select", status = "home",
                                 choices = home_list,
                                 direction = "vertical", justified = T)),

  mainPanel(width = 8,
            # About
            conditionalPanel(
              condition= 'input.home_select == "about"',
              tagList(h3(tags$b("Care & Wellbeing Dashboard")),

                      box(width = 12,
                          status = "warning",
                          p(icon("inbox", style = "color: #4B006E"),
                            "  This is an early release of the dashboard and it will be further developed following",
                            "user feedback. The dashboard and indicators will continue to be updated over the coming months.",
                            "Please send any feeback to",
                            tags$a(href = "phs.Covid19Data&Analytics@phs.scot", "phs.Covid19Data&Analytics@phs.scot."))),
                      br(),
                      br(),

                        p("The Care & Wellbeing dashboard is one source of data and intelligence to support the",
                          "ambitions of the ",
                          tags$a(href= "https://www.gov.scot/groups/care-and-wellbeing-portfolio-board/", "Care & Wellbeing Portfolio"),
                          "to improve population health, address health inequalities and improve the health and care system."),
                        p("Many of the influences on health outcomes lie out with health and social care.",
                          "Collective action across government, with local government partners and the wider",
                          "public sector, is fundamental to improving population health and reducing health inequalities."),
                        p("A range of indicators are included in this dashboard structured around the evidence-based",
                          "Marmot framework which looks at the social determinants of health, the conditions in which",
                          "people are born, grow, live, work and age which can lead to health inequalities."),
                        p("Explore the latest data below."),
                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_child_start", "Early years"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_child_start2", "Giving every child the best start in life")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_control_lives", "Education"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_control_lives2", "Enabling all to maximise their capabilities and have control over their lives")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_fair_work", "Work"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_fair_work2", "Creating fair employment and good work for all")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_healthy_standard", "Living standards"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_healthy_standard2", "Ensuring a healthy standard of living for all")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_sustainable_communities", "Places"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_sustainable_communities2", "Creating and developing healthy and sustainable places and communities")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_strengthen_prevention", "Ill health prevention"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_strengthen_prevention2", "Strengthening the role and impact of ill health prevention")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_discrimination_racism", "Discrimination and racism"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_discrimination_racism2", "Tackling discrimination, racism and their outcomes")))),

                        br(),


                        fluidRow(
                          column(4, tags$div(class = "special_button",
                                             actionButton("jump_to_environmental_sustainability", "Sustainability and equity"))),
                          column(8, tags$div(class= "invisible_button",
                                             actionButton("jump_to_environmental_sustainability2", "Pursuing environmental sustainability and health equity together.")))),


                      br(),
                      br(),

                        #                       h4("Covid Recovery"),
                        #
                        #                       p("The Scottish Government’s Covid Recovery Strategy aims to reduce systemic inequalities and focuses on three outcomes: "),
                        #                       p(tags$li("enhancing the wellbeing of children and young people;"),
                        #                         tags$li("increasing financial security for low income households; and "),
                        #                         tags$li("creating good, green jobs and fair work.")),



                ) # tagList
              ), # conditionalPanel

            # Using the dashboard
            conditionalPanel(
              condition= 'input.home_select == "use"',
              tagList(h3(tags$b("Using the dashboard")),
                              p(tags$li("Click on tabs in the purple navigation bar at the top to view each section")),
                                # tags$img(src = "intro_images/nav_bar.png", height = 50,
                                # alt ="Image of the a part of the navigation bar for reference")),
                              p(tags$li("Click on 'At a glance' to view the most recently available statistics")),
                                # tags$img(src = "intro_images/at_a_glance_tab.png", height = 50,
                                # alt ="Image of the 'At a glance' tab in the navigation bar")),
                              p(tags$li("Click on 'Care and Wellbeing' to view the indicators in each objective in more detail")),
                                # tags$img(src = "intro_images/cases.png", height = 50,
                                # alt ="Image of the 'COVID-19 cases' tab in the navigation bar"),
                             br(),

                             p(tags$b("Within each indicator tab")),
                            # p(tags$li("Click the 'Metadata' button in each tab to navigate to corresponding notes"),
                            #   tags$img(src = "intro_images/metadata_btn.png", height = 50,
                            #            alt ="Image of the metadata button")),
                             p(tags$li("Click on the toggles to change the visible sub-indicator")),
                            #   "e.g.", tags$img(src = "intro_images/tab_toggles.png", height = 50,
                            #                    alt ="Image of the tab toggle options used in the tabs. This image shows an example of the toggles
                            #    in the 'COVID-19 hospital admissions' tab")),
                             p(tags$li("Click the 'background information and source' button for further information on the indicator and the data source")),
                            # p(tags$li("Click 'Plot/Data' toggle to switch between chart and data table view"),
                            #   tags$img(src = "intro_images/plot_data_toggle.png", height = 60,
                            #            alt ="Image of the plot and data toggle")),
                             p(tags$li("Select an appropriate breakdown if available using the drop down menus. This will change the data displayed in both the chart and the table.")),
                             br(),

                             p(tags$b("Interacting with the charts")),
                             p(tags$li("Click the 'Plot description' button for a summary of the plot content")),
                            #   tags$img(src = "intro_images/plot_description.png", height = 50,
                            #            alt ="Image of the plot description button")),
                             p(tags$li("Click the 'Using the plot' button for a recap of the information in this section")),
                              #   tags$img(src = "intro_images/using_the_plot.png", height = 50,
                              #            alt ="Image of the 'using the plot' button on the charts which when clicked,
                              #    provides a recap of the 'ineracting with the charts' section")),
                             p(tags$li("Move the cursor over the data points in the charts to see the data values")),
                             p(tags$li("Click the magnifying glass in the top right of the charts to enable zoom capabilities.
                                        Then zoom into the plot by holding down the cursor and dragging to select the region")),
                            # tags$a(img(src = "intro_images/zoom_graph.png", height = 60,
                            #            alt ="Image of the zoom button on the graphs"))),
                             p(tags$li("Click the pan button (four way arrows) in the top right of the charts to enable panning capabilites.
                                        Then move the chart around by holding down the cursor and dragging")),
                            # tags$img(src = "intro_images/pan_graph.png", height = 60,
                            #          alt ="Image of the pan button")),
                            # p(tags$li("Alter the x axis range by dragging the vertical white bars on the left and right of the bottom panel")),
                             p(tags$li("Click the home button in the top right to reset the axes")),
                            #   tags$img(src = "intro_images/home_graph.png", height = 50,
                            #            alt ="Image of the home button on the graphs used to reset the axes")),
                             p(tags$li("Single click on legend variables to remove the corresponding trace")),
                             p(tags$li("Double click on legend variables to isolate the corresponding trace")),
                             p(tags$li("Double click on the legend to restore all traces")),
                             p(tags$li("Click the camera icon in the top right to download the plot as a png file")),
                            #   tags$a(img(src = "intro_images/camera.png", height = 50,
                            #              alt ="Image of the camera button on the graphs used to download the plot as a png file"))),

                             br(),
                             p(tags$b("Downloading data")),
                             p(tags$li("Data can be downloaded from the data table within each indicator. Click either the 'CSV' or 'Excel' button above
                                       the table depending on what format you require")),
                            # tags$a(href="https://www.opendata.nhs.scot",
                            #        "Scottish Health and Social Care Open Data platform (external website)", target="_blank")),
                            # tags$img(src = "intro_images/download_data.png", height = 50,
                            #          alt ="Image of the download data button")


            )
              ), # condtionalPanel

            # News and future updates
            conditionalPanel(
              condition= 'input.home_select == "future"',
              tagList(h3(tags$b("News and future updates")),
                      p("This is an early release of the dashboard and it will be further developed shaped by user feedback."),
                      p("Over the coming months, we are planning to:",
                        tags$li("Add content for all indicators"),
                        tags$li("Review and add further equalities breakdowns where data exists"),
                        tags$li("Develop the ‘at a glance’ section to make it easier to gain a quick overview and assessment of progress across the Marmot policy objectives"),
                        tags$li("Add further metadata to help explain the rationale for each indicator"),
                        tags$li("Review and add new indicators where needed")),
                      p("We are keen to develop the dashboard in an agile way and hear feedback from users."),
                      p("Please send any feedback to", tags$a(href = "phs.Covid19Data&Analytics@phs.scot", "phs.Covid19Data&Analytics@phs.scot."))
                ) # tagList
            ), # conditionalPanel

            # Further information
            conditionalPanel(
              condition= 'input.home_select == "info"',
              tagList(h3(tags$b("Care & Wellbeing Portfolio")),
                      p("The", tags$a(href= "https://www.gov.scot/groups/care-and-wellbeing-portfolio-board/", "Care & Wellbeing Portfolio (CWP)"),
                        "is the principal strategic reform vehicle in the Scottish Government.  It brings oversight and coherence to the",
                        "major health and care reform programmes designed to improve population health, address health inequalities",
                        "and improve health and care system sustainability."),

                      p("The underpinning framework of the Portfolio is the evidence-based Marmot model of factors – \"policy objectives\"",
                        "that create health and reduce inequalities.  This globally recognised framework was first set out in",
                        tags$a(href= "https://www.instituteofhealthequity.org/resources-reports/fair-society-healthy-lives-the-marmot-review", "Fair Society, Health Lives"),
                        "in 2010, updated in a", tags$a(href = "https://www.health.org.uk/publications/reports/the-marmot-review-10-years-on", "10 year on report."),
                        "These include good early years; good education; good work; good income; healthy places; tackling discrimination",
                        "and racism; and good ill health prevention."),
                      br(),


                      h4("Other resources"),

                      p("The Care & Wellbeing dashboard is one source of data and intelligence.",
                        "A number of other sources of helpful information is also available:"),


                      p(tags$li("The ", tags$b("Scottish Public Health Observatory"), "collaboration is led by Public Health Scotland, ",
                                "and includes the Glasgow Centre for Population Health, the MRC/CSO Social and Public Health Sciences Unit, ",
                                "National Records of Scotland and the Scottish Learning Disabilities Observatory. ",
                                "The ScotPHO profiles present a range of indicators to give an overview of health",
                                "and its wider determinants at a local level. More information can be found at: ",
                                tags$a(href="https://www.scotpho.org.uk/comparative-health/profiles/online-profiles-tool/", "Online Profiles Tool - ScotPHO"))),
                      p(tags$li("The ",  tags$b("Improvement Service (IS)"),  "is the 'go-to' organisation for local government improvement in Scotland. ",
                                "It provides performance management and benchmarking products and services to help councils assess and improve",
                                "their own performance, and support decision-making in councils and community planning partnerships.",
                                "More information can be found at: ",
                                tags$a(href="https://www.improvementservice.org.uk/products-and-services/performance-management-and-benchmarking","Performance Management and Benchmarking | Improvement Service"))),
                      p(tags$li("The ", tags$b("National Performance Framework (NPF)"), "provides a measure of national wellbeing and keeps track",
                                "of how Scotland is performing. It aims to reduce inequalities and gives equal importance to economic,",
                                "environmental and social progress. More information can be found at:",
                                tags$a(href= "https://nationalperformance.gov.scot/measuring-progress", "Measuring progress | National Performance Framework")))


                      ) # tagList
            ), # conditionalPane

            # Accessibility
            # conditionalPanel(
            #   condition= 'input.home_select == "accessibility"',
            #   tagList(h3("Accessibility"),
            #
            #                   p("This website is run by ", tags$a(href="https://www.publichealthscotland.scot/",
            #                                                       "Public Health Scotland", target="_blank"),
            #                     ", Scotland's national organisation for public health. As a new organisation formed
            #                        on 01 April 2020, Public Health Scotland is currently reviewing its web estate. Public
            #                        Health Scotland is committed to making its website accessible, in accordance with
            #                        the Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility
            #                        Regulations 2018. This accessibility statement applies to the dashboard that accompanies
            #                        the HSMR quarterly publication."),
            #                   p(tags$a(href="https://mcmw.abilitynet.org.uk/", "AbilityNet (external website)", target="_blank"),
            #                     " has advice on making your device easier to use if you have a disability."),
            #
            #                   p(tags$b("Compliance status")),
            #                   p("This site has not yet been evaluated against Web Content Accessibility Guidelines
            #                        version 2.1 level AA standard. We are currently working towards an evaluation."),
            #                   br(),
            #                   p(tags$b("Accessible features")),
            #                   p("We have taken the following steps to make this dashboard more accessible:"),
            #                   p(tags$li("Colours have been chosen to meet colour contrast standards")),
            #                   p(tags$li("Plot colours have been chosen to be colour blind friendly")),
            #                   p(tags$li("The dashboard can be navigated using a keyboard")),
            #                   p(tags$li("The content is still readable at 400% zoom")),
            #                   p(tags$li("Alternative descriptions of plot contents have been provided via 'Plot description' buttons")),
            #                   p(tags$li("Data tables have been provided alongside plots where possible")),
            #                   p(tags$li("Hover content has been replaced with clickable content where possible")),
            #                   br(),
            #                   p(tags$b("Reporting any accessibility problems with this website")),
            #                   p("If you wish to contact us about any accessibility issues you encounter on this
            #                        site, please email "), #, tags$a(href="mailto:phs.covid19data&analytics@phs.scot", "phs.covid19data&analytics@phs.scot", ".")),
            #
            #                   p(tags$b("Enforcement procedure")),
            #                   p("The Equality and Human Rights Commission (EHRC) is responsible for enforcing the
            #                        Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility Regulations
            #                        2018 (the ‘accessibility regulations’). If you’re not happy with how we respond to your complaint,",
            #                     tags$a(href="https://www.equalityadvisoryservice.com/", "contact the Equality Advisory and Support Service (EASS) (external website).",
            #                            target = "_blank")),
            #
            #                   p(tags$b("Preparation of this accessibility statement")),
            #                   p("This statement was prepared on 13 January 2023. It was last reviewed on 13 January 2023.")
            #   ) # tagList
            # ) # conditonalPanel
                      ) # mainPanel
  ) # sidebarLayout
