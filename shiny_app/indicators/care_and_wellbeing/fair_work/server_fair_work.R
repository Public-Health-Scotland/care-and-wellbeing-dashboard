##############################################.
# EMPLOYEES ON THE LIVING WAGE----
##############################################.

altTextServer("employees_living_wage_cw_sector_alt",
              title = "Employees earning less than the real Living Wage by sector plot",
              content = tags$ul(tags$li("This is a plot for the trend in the percentage of employees (18+) earning less than the real Living Wage by sector in Scotland."),
                                tags$li("The x axis shows the year, starting from 2012."),
                                tags$li("The y axis shows the percentage of employees earning less than the real  Living Wage."),
                                tags$li("The purple line is the percentage of employees earning less than the real Living Wage in all sectors."),
                                tags$li("The light grey line is the percentage of employees earning less than the real Living Wage in the public sector."),
                                tags$li("The blue line is the percentage of employees earning less than the real Living Wage in the private sector."),
                                tags$li("The dark grey  line is the percentage of employees earning less than the real Living Wage in the Not for profit or mutual organisation sector."),
                                tags$li("There is no data available for the `not for profit or mutual organisation` sector for years 2012 and 2013."),
                                tags$li("The percentage of employees earning less than the Living Wage in all sectors has decreased from 18.8%",
                                        "in 2012 to 14.4% in 2021; and decreased 0.7 percentage points from 2020 to 2021."),
                                tags$li("The percentage of employees earning less than the Living Wage is now lower than at",
                                        "any previous point in the series, which began in 2012.")

              )
)

output$employees_living_wage_cw_sector_plot = renderPlotly({
  title <- glue("Percentage of employees (18+) earning less than the real Living Wage by sector in Scotland")

  data = employees_living_wage_by_sector %>%
    filter(measure == "proportion",
           earning == "Earning less than the living wage") %>%
    make_line_chart_multi_lines(.,x = .$year, y = .$measure_value, colour = .$sector, y_axis_title = "Percentage",
                                title = title, label = "Percentage",
                                hover_end = "%") %>%
    layout(yaxis = list(rangemode="tozero",
                        title = "Percentage (%)",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        ticksuffix = "%",
                        range=c(0,35)),
           legend = list(y = -0.4))

})

employees_living_wage_by_sector %>%
  filter(measure == "proportion",
         earning == "Earning less than the living wage") %>%
  select(year, sector, measure_value) %>%
  arrange(year, sector) %>%
  mutate(year = factor(year),
         sector = factor(sector)) %>%
  rename(`Percentage of employees (18+) earning less than the real Living Wage (%)` = measure_value) %>%
  dataDownloadServer(id = "living_wage_sector_cw", filename = "living_wage_by_sector",
                     add_separator_cols_1dp = c(3))


# map
employees_living_wage_cw_option = "Earning less than the living wage"

# add the values to the LA shapes
employees_living_wage_cw_by_LA_ind = employees_living_wage_by_LA %>%
  filter(earning == employees_living_wage_cw_option) %>%
  select(year, local_authority, ca2019, measure_value)

employees_living_wage_cw_las_shape = pub_las_simplified

# value for storing the selected LA; initialized with Scotland geometry
rv_employees_living_wage_cw = reactiveVal("S92000003")

observeEvent(input$employees_living_wage_cw_map_button, {
  rv_employees_living_wage_cw("S92000003")
})


LA_Look_up = employees_living_wage_by_LA %>%
  select(local_authority, ca2019) %>%
  unique()

LA_Look_up_list = list()

for (i in 1:nrow(LA_Look_up))
{
  LA_Look_up_list[LA_Look_up$local_authority[i]] = LA_Look_up$ca2019[i]
}


# output$employees_living_wage_cw_LA_ui = renderUI({
#
#   #employees_living_wage_LA_selected = "Scotland"
#   selectizeInput("employees_living_wage_LA_input",
#                  label = "Select local authority for trend:",
#                  choices = LA_Look_up_list, #LA_Look_up$local_authority,
#                  selected = "S92000003")
# })
#
# observe({
#   print(input$employees_living_wage_cw_LA_input)
#   rv_employees_living_wage(input$employees_living_wage_cw_LA_input)
# })


output$employees_living_wage_cw_map = renderLeaflet({

  employees_living_wage_cw_by_LA_ind_year = employees_living_wage_cw_by_LA_ind %>%
    filter(year == input$employees_living_wage_cw_year)

  employees_living_wage_cw_las_shape@data = employees_living_wage_cw_las_shape@data %>%
    left_join(employees_living_wage_cw_by_LA_ind_year , by = c("code" = "ca2019"))

  # features of the map
  bins = c(0, 10, 15, 20, 25, 30, 35, 40, 100)
  pal = colorBin("YlOrRd", domain = employees_living_wage_cw_las_shape$measure_value, bins = bins)
  indicator_name = tolower(employees_living_wage_cw_option)
  labels <- sprintf(
    "<strong>%s</strong><br/> Employees %s (%%): %g%%",
    employees_living_wage_cw_las_shape@data[["local_authority"]], indicator_name, employees_living_wage_cw_las_shape@data[["measure_value"]]
  ) %>%
    lapply(htmltools::HTML)


  leaflet(employees_living_wage_cw_las_shape, options = leafletOptions(zoomSnap = 0.25, zoomDelta=0.25)) %>%
    setView(lng = -2, lat = 56.8, zoom = 6.25) %>%
    addTiles() %>%
    addPolygons(weight = 1, smoothFactor = 0.5,
                fillColor = ~pal(measure_value),
                opacity = 0.5, fillOpacity = 0.7,
                color = "white",
                dashArray = "3",
                popup = labels,
                highlightOptions =  highlightOptions(color = "white", weight = 2,
                                                     bringToFront = TRUE),
                layerId = ~code) %>%
    addLegend("bottomright", pal = pal, values = ~measure_value,
              title = paste0("Percent of Employees (%)", "<br> in ", input$employees_living_wage_cw_year),
              labFormat = labelFormat(suffix  = "%"),
              opacity = 1
    )
}
)

# update the varible rv_fuel_poverty
observeEvent(input$employees_living_wage_cw_map_shape_click,{
  rv_employees_living_wage_cw(input$employees_living_wage_cw_map_shape_click$id)

updateSelectizeInput(session, "employees_living_wage_cw_LA_input",
                  #label = paste("Select input label", length(x)),
                  choices = input$employees_living_wage_cw_map_shape_click$id)
})


# # plot trend
# output$employees_living_wage_cw_line_LA = renderPlotly({
#
#   employees_living_wage_cw_line_LA_data = employees_living_wage_cw_by_LA_ind %>%
#     filter(ca2019  == rv_employees_living_wage_cw())
#
#
#   title = employees_living_wage_cw_line_LA_data$local_authority %>% unique()
#   make_employees_living_wage_cw_line_plot(employees_living_wage_cw_line_LA_data, title = title)
# })

output$employees_living_wage_cw_line_LA = renderPlotly({

  employees_living_wage_cw_line_LA_data = employees_living_wage_cw_by_LA_ind %>%
    filter(ca2019  == rv_employees_living_wage_cw())

  geog = employees_living_wage_cw_line_LA_data$local_authority %>% unique()
  title = paste("Percentage of employees (18+) earning less than the real Living Wage in ",
                geog)

  plot <- employees_living_wage_cw_line_LA_data %>%
    mutate(indicator = round(as.integer(measure_value), 1),
           date = year) %>%
    line_chart_function_lw_la(., y_title = "Percentage", label = "Percentage (%)", title = title) %>%
  layout(yaxis = list(rangemode="tozero",
                      title = "Percentage (%)",
                      tickfont = list(size=14),
                      titlefont = list(size=18),
                      showline = FALSE,
                      ticksuffix = "%",
                      range=c(0,35)))
})



living_wage_sector <- employees_living_wage_by_sector %>%
  filter(measure == "proportion") %>%
  mutate(local_authority = "Scotland",
         ca2019 = "S92000003") %>%
  select(year, ca2019, local_authority, sector, earning, measure_value) %>%
  rename(`Percentage of employees (18+) earning less than the real Living Wage (%)` = "measure_value")

living_wage_la <- employees_living_wage_by_LA %>%
  filter(local_authority != "Scotland") %>%
  filter(measure == "proportion") %>%
  mutate(sector = "All") %>%
  select(year, ca2019, local_authority, sector, earning, measure_value) %>%
  rename(`Percentage of employees (18+) earning less than the real Living Wage (%)` = "measure_value")

living_wage_all <- bind_rows(living_wage_sector, living_wage_la) %>%
  arrange(year, sector, earning) %>%
  filter(earning == "Earning less than the living wage") %>%
  filter(sector == "All") %>%
  select(-earning, -sector)

living_wage_scotland <- living_wage_all %>%
  filter(local_authority == "Scotland") %>%
  mutate(year = factor(year)) %>%
  select(-ca2019)

dataDownloadServer(data = living_wage_scotland, data_download = living_wage_all,
                   id = "living_wage_cw", filename = "living_wage_by_council",
                   add_separator_cols_1dp = c(3))

output$living_wage_cw_table_title <- renderText({
  glue("Data table: Percentage of employees (18+) earning less than the real Living Wage in Scotland")
})

observeEvent(input$employees_living_wage_cw_map_button, {

  dataDownloadServer(data = living_wage_scotland, data_download = living_wage_all,
                     id = "living_wage_cw", filename = "living_wage_by_council",
                     add_separator_cols_1dp = c(3))

  output$living_wage_cw_table_title <- renderText({
    glue("Data table: Percentage of employees (18+) earning less than the real Living Wage in Scotland")
  })

})

observeEvent(input$employees_living_wage_cw_map_shape_click,{

  living_wage_la <- living_wage_all %>%
    filter(ca2019 == rv_employees_living_wage_cw()) %>%
    mutate(year = factor(year)) %>%
    select(-ca2019)

  dataDownloadServer(data = living_wage_la, data_download = living_wage_all,
                     id = "living_wage_cw", filename = "living_wage_by_council",
                     add_separator_cols_1dp = c(3))

  la_selected <- unique(living_wage_la$local_authority)

  output$living_wage_cw_table_title <- renderText({
    glue("Data table: Percentage of employees (18+) earning less than the real Living Wage in ", la_selected)
  })

})



##############################################.
#PAY GAP----
##############################################.

altTextServer("gender_pay_gap_cw_alt",
              title = "Gender pay gap plot",
              content = tags$ul(tags$li("This is a plot for the trend in the difference in full-time hourly earnings between women and men."),
                                tags$li("The x axis shows the year, starting from 2014."),
                                tags$li("The y axis shows the difference in earnings as a percentage of male full time hourly earnings."),
                                tags$li("There are two panels on the left of the chart. The first panel allows you to select the private,",
                                        "public, or all sectors. The second panel allows you to select a work pattern of full-time, part-time,",
                                        "or all work patterns. The default is all work patterns for all sectors."),
                                tags$li("There is a checkbox to the left of the chart which allows you to show women and men's earnings",
                                        "on a secondary axis alongside the difference in pay.")

              )
)

output$gender_pay_gap_cw_plot = renderPlotly({

  sector_option = input$gender_pay_gap_cw_sector
  work_pattern_option = input$gender_pay_gap_cw_work


  pay_gap_by_sector_pattern = gender_pay_gap_by_sector %>%
    filter(work_pattern == work_pattern_option)

  pay_gap_by_sector_line_data = pay_gap_by_sector_pattern %>%
    filter(sector == sector_option)

  plot_data =pay_gap_by_sector_line_data %>%
    pivot_wider(names_from = gender, values_from = measure_value)

  string_sector <- ifelse(input$gender_pay_gap_cw_sector == "All",
                          "all sectors, ",
                          tolower(paste0("the ", input$gender_pay_gap_cw_sector, " sector, ")))
  string_work <- tolower(paste0(input$gender_pay_gap_cw_work, " work patterns"))

  title <- glue("Difference between women and men's full-time hourly earnings in ",
                string_sector, string_work)

  add_Earning = input$gender_pay_gap_cw_show_earnings_check_box
  make_gender_pay_gap_cw_plot(plot_data, second_axis = add_Earning, title = title)


})



observeEvent(input$gender_pay_gap_cw_sector, {

  observeEvent(input$gender_pay_gap_cw_work, {

    data_unfiltered <- gender_pay_gap_by_sector %>%
      filter(gender == "Pay Gap") %>%
      select(year, sector, work_pattern, measure_value) %>%
      rename("Gender Pay Gap (%)" = "measure_value")

    data_filtered <- data_unfiltered %>%
      filter(sector == input$gender_pay_gap_cw_sector) %>%
      filter(work_pattern == input$gender_pay_gap_cw_work)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "gender_pay_gap_cw", filename = "gender_pay_gap")
  })
})

observeEvent(input$gender_pay_gap_cw_sector, {

  observeEvent(input$gender_pay_gap_cw_work, {

    data_unfiltered <- gender_pay_gap_by_sector %>%
      filter(gender != "Pay Gap") %>%
      select(year, sector, work_pattern, gender, measure_value) %>%
      rename("Median Hourly Earnings (£)" = "measure_value")

    data_filtered <- data_unfiltered %>%
      filter(sector == input$gender_pay_gap_cw_sector) %>%
      filter(work_pattern == input$gender_pay_gap_cw_work)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "gender_pay_gap_earnings_cw", filename = "gender_pay_gap_earnings")
  })
})


observeEvent(input$gender_pay_gap_cw_tabBox, {
  observeEvent(input$gender_pay_gap_cw_sector, {
    observeEvent(input$gender_pay_gap_cw_work, {

  string_tab <- ifelse(input$gender_pay_gap_cw_tabBox == "Earnings",
                    "Data table: Median Hourly Earnings (£) by gender - ",
                    "Data table: Gender pay gap (%) - ")
  string_sector <- ifelse(input$gender_pay_gap_cw_sector == "All",
                    "all sectors, ",
                    tolower(paste0(input$gender_pay_gap_cw_sector, " sector, ")))
  string_work <- tolower(paste0(input$gender_pay_gap_cw_work, " work patterns"))

  output$gender_pay_gap_cw_table_title <- renderText({glue(string_tab, string_sector, string_work)})
    })
  })
})

##############################################.
#WORK RELATED ILL HEALTH----
##############################################.

##############################################.
# ECONOMIC INACTIVITY ----
##############################################.

altTextServer("economic_inactivity_cw_alt",
              title = "Economic inactivity by year plot",
              content = tags$ul(tags$li("This is a plot for the trend in economically inactive people aged 16 to 64 by willingness to work."),
                                tags$li("It is a stacked bar plot, where each bar refers to one year, and each bar is split into",
                                        "two sections representing the percentage of economically inactive people who want to work",
                                        "in contrast with the percentage of these individuals who do not want to work."),
                                tags$li("The x axis shows the year, starting from 2008."),
                                tags$li("The y axis shows the percentage of economically inactive people."),
                                tags$li("The legend shows two categories: 'Wants to work' and 'Does not want to work', which are displayed",
                                        "on the plot in this order from top to bottom."),
                                tags$li("There are two drop downs above the chart which allow you to select a national",
                                        "or local geography level and area for plotting. The default is Scotland."),
              )
)


observeEvent(input$economic_inactivity_cw_geog_type,
             {

               economic_inactivity_filtered = economic_inactivity %>%
                 filter(geography_type == input$economic_inactivity_cw_geog_type)

               #select_choice <- ifelse(input$geog_type_summary_CW == "Scotland", "area", input$geog_type_summary)

               updateSelectizeInput(session, "economic_inactivity_cw_geog_name",
                                    #label = glue("4. Select {select_choice}"),
                                    choices = unique(economic_inactivity_filtered$geography))#,
               #selected = "")
             })


output$economic_inactivity_cw_plot <- renderPlotly({

  title <- glue("Percentage of economically inactive people aged 16 to 64 by willingness to work in ",
                input$economic_inactivity_cw_geog_name)

  region_filter_table(economic_inactivity, region_of_interest = input$economic_inactivity_cw_geog_name) %>%
    filter(year >= 2008) %>%
    mutate(breakdown = gsub("\r\n", " ", breakdown)) %>%
    make_economic_inactivity_cw_plot(., title = title)

})


observeEvent(input$economic_inactivity_cw_geog_name, {

  data_unfiltered <- economic_inactivity %>%
    select(year, region, breakdown, n, percent) %>%
    filter(year >= 2008) %>%
    rename("Geography" = "region",
           "Category" = "breakdown",
           "Number of People" = "n",
           "Percentage of People (%)" = "percent")

  data_filtered <- data_unfiltered %>%
    filter(Geography == input$economic_inactivity_cw_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "economic_inactivity_cw", filename = "economic_inactivity",
                     add_separator_cols = c(4),
                     add_separator_cols_1dp = c(5))
})

observeEvent(input$economic_inactivity_cw_geog_name, {

  output$economic_inactivity_cw_table_title <- renderText({
    glue("Data table: Percentage of economically inactive people aged 16 to 64 by willingness to work in ",
         input$economic_inactivity_cw_geog_name)})

})



