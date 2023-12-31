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
                                tags$li("There is no data available for the `not for profit or mutual organisation` sector for years 2012 and 2013.")#,
                                # tags$li("The percentage of employees earning less than the Living Wage in all sectors has decreased from 18.8%",
                                #         "in 2012 to 14.4% in 2021; and decreased 0.7 percentage points from 2020 to 2021."),
                                # tags$li("The percentage of employees earning less than the Living Wage is now lower than at",
                                #         "any previous point in the series, which began in 2012.")

              )
)

output$employees_living_wage_cw_sector_plot = renderPlotly({
  title <- glue("Percentage of employees (18+) earning less than the real Living Wage by sector in Scotland")

  data = employees_living_wage_by_sector %>%
    mutate(sector=str_replace(sector, "All", "All sectors")) %>%
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
  mutate(sector=str_replace(sector, "All", "All sectors")) %>%
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

mapAltTextServer("employees_living_wage_cw_map_alt",
                 title = "Employees earning less than the real Living Wage by council area map",
                 content = tags$ul(tags$li("This is a map for the percentage of employees (18+) earning less than the real Living Wage by council area in Scotland."),
                                   tags$li("The map splits Scotland into council areas using white lines as the borders."),
                                   tags$li("The dropdown above the map allows you to select the year for plotting on the map. The default is 2012"),
                                   tags$li("The colour that a council area is highlighted relates to a percentage range as indicated by the map legend.",
                                           "The colours range from light yellow for 0-10% to dark red for 40-100% between which the ranges cover 5% increments.",
                                           "The percentage range indicated relates to the key data for the council area for the chosen year."),
                                   tags$li("If an area is grey, then there is no available data for the chosen year for that council area.")
                 ))

altTextServer("employees_living_wage_cw_map_plot_alt",
              title = "Employees earning less than the real Living Wage by council area plot",
              content = tags$ul(tags$li("This is a plot for the trend in the percentage of employees (18+) earning less than the real Living Wage by council area in Scotland."),
                                tags$li("The x axis shows the year starting from 2012."),
                                tags$li("The y axis shows the percentage of employees earning less than the real Living Wage."),
                                tags$li("The purple line is the percentage of employees earning less than the real Living Wage for the corresponding council area."),
                                tags$li("By default, this chart will show the trend for Scotland. When an area of the map to the left hand side of this plot is clicked,",
                                        "the plot will update to show the trend of the corresponding council area."),
                                tags$li("Clicking the 'Trend for Scotland' button above will return this plot to it's default of showing the trend in Scotland."),
                                tags$li("When an area of the map is clicked where data is partially or completey unavailable,",
                                        "the plot will either show breaks in the trend line or the plot will show as empty.")
              ))


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

output$living_wage_cw_table_title <- renderUI({
  h3(glue("Data table: Percentage of employees (18+) earning less than the real Living Wage in Scotland"))
})

observeEvent(input$employees_living_wage_cw_map_button, {

  dataDownloadServer(data = living_wage_scotland, data_download = living_wage_all,
                     id = "living_wage_cw", filename = "living_wage_by_council",
                     add_separator_cols_1dp = c(3))

  output$living_wage_cw_table_title <- renderUI({
    h3(glue("Data table: Percentage of employees (18+) earning less than the real Living Wage in Scotland"))
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

  output$living_wage_cw_table_title <- renderUI({
    h3(glue("Data table: Percentage of employees (18+) earning less than the real Living Wage in ", la_selected))
  })

})



##############################################.
#PAY GAP----
##############################################.

altTextServer("gender_pay_gap_cw_alt",
              title = "Gender pay gap plot",
              content = tags$ul(tags$li("This is a plot for the trend in the gender pay gap between men and women."),
                                tags$li("The x axis shows the year, starting from 2014."),
                                tags$li("The y axis shows the difference between the median hourly earnings (excluding overtime) for ",
                                        "men and women as a percentage of the median hourly earnings (excluding overtime) for men."),
                                tags$li("There are two dropdowns above the chart. The first dropdown allows you to select by sector: `all`, `private`,",
                                        "or `public`. The second dropdown allows you to select by work pattern: `all`, `full-time`, or `part-time`.")

              )
)

altTextServer("gender_pay_gap_cw_earnings_alt",
              title = "Median Hourly Earnings (£) by gender plot",
              content = tags$ul(tags$li("This is a plot for the trend in the median hourly earnings (excluding overtime) for men and women."),
                                tags$li("The x axis shows the year, starting from 2014."),
                                tags$li("The y axis shows the median hourly earnings in pounds."),
                                tags$li("There are two dropdowns above the chart. The first dropdown allows you to select by sector: `all`, `private`,",
                                        "or `public`. The second dropdown allows you to select by work pattern: `all`, `full-time`, or `part-time`.")

              )
)


output$gender_pay_gap_cw_plot = renderPlotly({

  sector_option = input$gender_pay_gap_cw_sector_type
  work_pattern_option = input$gender_pay_gap_cw_work_pattern_type

  string_sector <- ifelse(input$gender_pay_gap_cw_sector_type == "All",
                          " in all sectors",
                          tolower(paste0(" in the ", input$gender_pay_gap_cw_sector_type, " sector")))
  string_work <- tolower(paste0(input$gender_pay_gap_cw_work_pattern_type, " work patterns"))

  title <- glue("Gender pay gap for ", string_work, string_sector)

  plot_data <- gender_pay_gap_by_sector %>%
    mutate(year = as.character(year)) %>%
    filter(work_pattern == work_pattern_option,
           sector == sector_option,
           gender == "Pay Gap") %>%
    select(year, sector, work_pattern, measure_value) %>%
    rename(indicator = measure_value,
           date = year)

  ylimits <- gender_pay_gap_by_sector %>%
    filter(gender == "Pay Gap") %>%
    mutate(measure_value = abs(round(measure_value/10)*10))
  ylim <- max(ylimits$measure_value)

  line_chart_function_pg(plot_data, y_title = "Pay Gap (Women/Men) (%)",
                         x_title = "Year", title = title, ylim = ylim)


})


output$gender_pay_gap_cw_earnings_plot = renderPlotly({

  sector_option = input$gender_pay_gap_cw_sector_type
  work_pattern_option = input$gender_pay_gap_cw_work_pattern_type

  string_sector <- ifelse(input$gender_pay_gap_cw_sector_type == "All",
                          " in all sectors",
                          tolower(paste0(" in the ", input$gender_pay_gap_cw_sector_type, " sector")))
  string_work <- tolower(paste0(input$gender_pay_gap_cw_work_pattern_type, " work patterns"))

  title <- glue("Median Hourly Earnings (£) by gender for ", string_work, string_sector)

  ylimits <- gender_pay_gap_by_sector %>%
    filter(gender != "Pay Gap") %>%
    mutate(measure_value = abs(round(measure_value/5)*5))
  ylim <- max(ylimits$measure_value)

  plot_data <- gender_pay_gap_by_sector %>%
    mutate(year = as.character(year)) %>%
    filter(work_pattern == work_pattern_option,
           sector == sector_option,
           gender != "Pay Gap") %>%
    select(year, sector, work_pattern, gender, measure_value) %>%
    rename(indicator = measure_value,
           date = year) %>%
    make_line_chart_multi_lines_pg(x = .$date,
                                   y = .$indicator, colour = .$gender,
                                   y_axis_title = "Median Hourly Earnings (£)",
                                   title = title, ylim = ylim)


})


observeEvent(input$gender_pay_gap_cw_sector_type, {

  observeEvent(input$gender_pay_gap_cw_work_pattern_type, {

    string_sector <- ifelse(input$gender_pay_gap_cw_sector_type == "All",
                            " in all sectors",
                            tolower(paste0(" in the ", input$gender_pay_gap_cw_sector_type, " sector")))
    string_work <- tolower(paste0(input$gender_pay_gap_cw_work_pattern_type, " work patterns"))

    title <- glue("Data table: Gender pay gap for ", string_work, string_sector)

    output$gender_pay_gap_cw_table_title <- renderUI({h3(title)})

    data_unfiltered <- gender_pay_gap_by_sector %>%
      filter(gender == "Pay Gap") %>%
      select(year, sector, work_pattern, measure_value) %>%
      rename("Gender Pay Gap (%)" = "measure_value")

    data_filtered <- data_unfiltered %>%
      filter(sector == input$gender_pay_gap_cw_sector_type) %>%
      filter(work_pattern == input$gender_pay_gap_cw_work_pattern_type) %>%
      mutate(year = factor(year))

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "gender_pay_gap_cw", filename = "gender_pay_gap")
  })
})

observeEvent(input$gender_pay_gap_cw_sector_type, {

  observeEvent(input$gender_pay_gap_cw_work_pattern_type, {

    string_sector <- ifelse(input$gender_pay_gap_cw_sector_type == "All",
                            " in all sectors",
                            tolower(paste0(" in the ", input$gender_pay_gap_cw_sector_type, " sector")))
    string_work <- tolower(paste0(input$gender_pay_gap_cw_work_pattern_type, " work patterns"))

    title <- glue("Data table: Median Hourly Earnings (£) by gender for ", string_work, string_sector)

    output$gender_pay_gap_cw_earnings_table_title <- renderUI({h3(title)})

    data_unfiltered <- gender_pay_gap_by_sector %>%
      filter(gender != "Pay Gap") %>%
      select(year, sector, work_pattern, gender, measure_value) %>%
      rename("Median Hourly Earnings (£)" = "measure_value")

    data_filtered <- data_unfiltered %>%
      filter(sector == input$gender_pay_gap_cw_sector_type) %>%
      filter(work_pattern == input$gender_pay_gap_cw_work_pattern_type) %>%
      mutate(year = factor(year),
             gender = factor(gender))

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "gender_pay_gap_earnings_cw", filename = "gender_pay_gap_earnings")
  })
})



# observeEvent(input$gender_pay_gap_cw_tabBox, {
#   observeEvent(input$gender_pay_gap_cw_sector, {
#     observeEvent(input$gender_pay_gap_cw_work, {
#
#   string_tab <- ifelse(input$gender_pay_gap_cw_tabBox == "Earnings",
#                     "Data table: Median Hourly Earnings (£) by gender - ",
#                     "Data table: Gender pay gap (%) - ")
#   string_sector <- ifelse(input$gender_pay_gap_cw_sector == "All",
#                     "all sectors, ",
#                     tolower(paste0(input$gender_pay_gap_cw_sector, " sector, ")))
#   string_work <- tolower(paste0(input$gender_pay_gap_cw_work, " work patterns"))
#
#   output$gender_pay_gap_cw_table_title <- renderUI({h3(glue(string_tab, string_sector, string_work))})
#     })
#   })
# })
#
###########################.
#WORK RELATED ILL HEALTH----
##############################################.

##############################################.
# ECONOMIC INACTIVITY ----
##############################################.

altTextServer("economic_inactivity_cw_alt",
              title = "Economic inactivity by year plot",
              content = tags$ul(tags$li("This is a bar plot representing the percentage of economically inactive people aged 16 to 64 who don't want to work."),
                                tags$li("The x axis shows the year, starting from 2008."),
                                tags$li("The y axis shows the percentage of economically inactive people."),
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

  title <- glue("Percentage of economically inactive people aged 16 to 64
                who don't want to work in ",
                input$economic_inactivity_cw_geog_name)

  economic_inactivity %>%
    filter(geography == input$economic_inactivity_cw_geog_name) %>%
    make_economic_inactivity_cw_plot(title = title)

})


observeEvent(input$economic_inactivity_cw_geog_name, {

  data_unfiltered <- economic_inactivity %>%
    select(Year, geography_type, geography, number, percentage) %>%
    rename("Number of People" = "number",
           "Percentage of people (%)" = "percentage")

  data_filtered <- data_unfiltered %>%
    filter(geography == input$economic_inactivity_cw_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "economic_inactivity_cw", filename = "economic_inactivity",
                     add_separator_cols = c(4),
                     add_percentage_cols_1dp = c(5))
})

observeEvent(input$economic_inactivity_cw_geog_name, {

  output$economic_inactivity_cw_table_title <- renderUI({
    h3(glue("Data table: Economically inactive people aged 16 to 64 who don't want to work in ",
            input$economic_inactivity_cw_geog_name))})

})



