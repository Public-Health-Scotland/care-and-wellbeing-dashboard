##############################################.
# EMPLOYEES ON THE LIVING WAGE----
##############################################.

## lines overall
output$employees_living_wage_cw_plot = renderPlotly({

  measure_option = "proportion"
  earning_option = "Earning less than the living wage"

  plot_data = employees_living_wage_by_sector %>%
    filter(measure == measure_option,
           earning == earning_option)


  make_employees_living_wage_cw_line_plot(plot_data, color_column = "sector")

})


# map
employees_living_wage_cw_option = "Earning less than the living wage"

#add the values to the LA shapes
employees_living_wage_cw_by_LA_ind = employees_living_wage_by_LA %>%
  filter(earning == employees_living_wage_cw_option) %>%
  select(year, local_authority, ca2019, measure_value)



# output$employees_living_wage_2_year_ui = renderUI({
#
#   employees_living_wage_2_year_choices = employees_living_wage_cw_by_LA_ind$year %>%
#     unique()
#   employees_living_wage_2_year_selected = employees_living_wage_2_year_choices %>% tail(n=1)
#
#   selectizeInput(session,
#                  "employees_living_wage_2_year_input",
#                  label = "Select year to view on heatmap:",
#                  choices = employees_living_wage_2_year_choices,
#                  selected = employees_living_wage_2_year_selected)
# })


employees_living_wage_cw_las_shape = pub_las_simplified

# # value for storing the selected LA; initialized with Scotland geometry
# rv_employees_living_wage_cw = reactiveVal("S92000003")
#
# observeEvent(input$employees_living_wage_cw_map_button, {
#   rv_employees_living_wage_2("S92000003")
# })


# LA_Look_up = employees_living_wage_by_LA %>%
#   select(local_authority, ca2019) %>%
#   unique()
#
# LA_Look_up_list = list()
#
# for (i in 1:nrow(LA_Look_up))
# {
#   LA_Look_up_list[LA_Look_up$local_authority[i]] = LA_Look_up$ca2019[i]
# }
#
#
# output$employees_living_wage_LA_ui = renderUI({
#
#   #employees_living_wage_LA_selected = "Scotland"
#   selectizeInput("employees_living_wage_LA_input",
#                  label = "Select local authority for trend:",
#                  choices = LA_Look_up_list, #LA_Look_up$local_authority,
#                  selected = "S92000003")
# })
#
# observe({
#   print(input$employees_living_wage_LA_input)
#   rv_employees_living_wage(input$employees_living_wage_LA_input)
# })


# output$employees_living_wage_2_map = renderLeaflet({
#
#   employees_living_wage_2_by_LA_ind_year = employees_living_wage_by_LA_ind %>%
#     filter(year == input$employees_living_wage_2_year_input)
#
#   employees_living_wage_2_las_shape@data = employees_living_wage_2_las_shape@data %>%
#     left_join(employees_living_wage_2_by_LA_ind_year , by = c("code" = "ca2019"))
#
#   # features of the map
#   bins = c(0, 10, 15, 20, 25, 30, 35, 40, 100)
#   pal = colorBin("YlOrRd", domain = employees_living_wage_2_las_shape$measure_value, bins = bins)
#   indicator_name = tolower(employees_living_wage_2_option)
#   labels <- sprintf(
#     "<strong>%s</strong><br/> Employees %s (%%): %g%%",
#     employees_living_wage_2_las_shape@data[["local_authority"]], indicator_name, employees_living_wage_2_las_shape@data[["measure_value"]]
#   ) %>%
#     lapply(htmltools::HTML)
#
#
#   leaflet(employees_living_wage_2_las_shape, options = leafletOptions(zoomSnap = 0.25, zoomDelta=0.25)) %>%
#     setView(lng = -2, lat = 56.8, zoom = 6.25) %>%
#     addTiles() %>%
#     addPolygons(weight = 1, smoothFactor = 0.5,
#                 fillColor = ~pal(measure_value),
#                 opacity = 0.5, fillOpacity = 0.7,
#                 color = "white",
#                 dashArray = "3",
#                 popup = labels,
#                 highlightOptions =  highlightOptions(color = "white", weight = 2,
#                                                      bringToFront = TRUE),
#                 layerId = ~code) %>%
#     addLegend("bottomright", pal = pal, values = ~measure_value,
#               title = paste0("Percent of Employees (%)", "<br> in ", input$employees_living_wage_2_year_input),
#               labFormat = labelFormat(suffix  = "%"),
#               opacity = 1
#     )
# }
# )

# update the varible rv_fuel_poverty
# observeEvent(input$employees_living_wage_2_map_shape_click,{
#   rv_employees_living_wage_2(input$employees_living_wage_2_map_shape_click$id)

  # updateSelectizeInput(session, "employees_living_wage_LA_input",
  #                   #label = paste("Select input label", length(x)),
  #                   choices = input$employees_living_wage_map_shape_click$id)
})


# plot trend
# output$employees_living_wage_2_line_LA = renderPlotly({
#
#   employees_living_wage_2_line_LA_data = employees_living_wage_by_LA_ind %>%
#     filter(ca2019  == rv_employees_living_wage_2())
#
#
#   title = employees_living_wage_2_line_LA_data$local_authority %>% unique()
#   employees_living_wage_2_plot_line(employees_living_wage_2_line_LA_data, title = title)
# })



output$employees_living_wage_cw_table = DT::renderDataTable({

  data_table = employees_living_wage_by_sector %>% filter(measure == "proportion")

  datatable_style_download(data_table,
                           datetype = "year",
                           data_name = "employees_living_wage_2",
                           geogtype = "none")
})


##############################################.
#PAY GAP----
##############################################.


output$pay_gap_plot_line_output = renderPlotly({

  sector_option = input$pay_gap_sector_radio
  work_pattern_option = input$pay_gap_work_radio


  pay_gap_by_sector_pattern = gender_pay_gap_by_sector %>%
    filter(work_pattern == work_pattern_option)

  pay_gap_by_sector_line_data = pay_gap_by_sector_pattern %>%
    filter(sector == sector_option)

  plot_data =pay_gap_by_sector_line_data %>%
    pivot_wider(names_from = gender, values_from = measure_value)



  add_Earning = input$pay_gap_show_earnings_check_box
  pay_gap_plot_line(plot_data, second_axis = add_Earning)

})



output$pay_gap_data = DT::renderDataTable({

  pay_gap_by_sector_Gap = gender_pay_gap_by_sector %>%
    filter(gender == "Pay Gap") %>%
    rename("Measure" = "gender")

  datatable_style_download(pay_gap_by_sector_Gap,
                           datetype = "year",
                           data_name = "pay_gap",
                           geogtype = "none")
})


output$pay_gap_data_earnings = DT::renderDataTable({

  pay_gap_by_sector_earnings = gender_pay_gap_by_sector %>%
    filter(gender != "Pay Gap")

  datatable_style_download(pay_gap_by_sector_earnings,
                           datetype = "earnings",
                           data_name = "pay_gap",
                           geogtype = "none")
})

##############################################.
#WORK RELATED ILL HEALTH----
##############################################.

##############################################.
# ECONOMIC INACTIVITY ----
##############################################.

output$economic_inactivity_2_graph_line <- renderPlotly({
  region_filter_table(economic_inactivity, region_of_interest = input$region_economic_inactivity_2) %>%
    plot_economic_inactivity_2(.)

})

output$economic_inactivity_2_data <- DT::renderDataTable({
  # Formatting datatable output
  economic_inactivity %>%
    rename("Number of People" = "n") %>%
    datatable_style_download(., datetype = "year",
                             data_name = "economic_inactivity_2", geogtype = "")


})

