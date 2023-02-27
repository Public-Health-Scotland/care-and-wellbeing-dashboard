##############################################.
# Fuel Affordability----
##############################################.

output$fuel_afford_data = DT::renderDataTable({

  datatable_style_download(fuel_number,
                           datetype = "year",
                           data_name = "fuel_number",
                           geogtype = "none")
})




output$fuel_afford_line = renderPlotly({

  data = fuel_SHCS_num %>%
    filter(measurement == 'Percent')

  fuel_afford_plot_line(data)

})



##map for fuel poverty
fuel_afford_indicator = "Fuel Poor"

#add the fuel poverty values to the LA shapes
fuel_SHCS_LA_per_ind = fuel_SHCS_LA %>%
  filter(fuel_poverty == fuel_afford_indicator)



output$fuel_afford_year_ui = renderUI({

  fuel_afford_year_choices = fuel_SHCS_LA_per_ind$date_code %>%
    unique() %>%
    sort()
  fuel_afford_year_selected = fuel_afford_year_choices %>% tail(1)

  selectInput("fuel_afford_year_input",
                 label = "Select year to view on heatmap:",
                 choices = fuel_afford_year_choices,
                 selected = fuel_afford_year_selected)
})



# value for storing the selected LA; initialized with Scotland geometry
rv_fuel_poverty = reactiveVal("S92000003")

observeEvent(input$fuel_afford_year_button, {
  rv_fuel_poverty("S92000003")
})


# output$fuel_afford_SHCS_map = renderLeaflet({
#
#
#   fuel_SHCS_LA_per_ind_year = fuel_SHCS_LA_per_ind %>%
#     filter(date_code == input$fuel_afford_year_input)
#
#
#   fuel_afford_las_shape = pub_las_simplified
#   fuel_afford_las_shape@data = fuel_afford_las_shape@data %>%
#     left_join(fuel_SHCS_LA_per_ind_year , by = c("code" = "feature_code"))
#
#   # features of the map
#   bins = c(0, 10, 15, 20, 25, 30, 35, 40, 100)
#   pal = colorBin("YlOrRd", domain = fuel_afford_las_shape$value, bins = bins)
#   indicator_name = "Fuel Poverty"
#   labels <- sprintf(
#     "<strong>%s</strong><br/> %s Household (%%): %g%%",
#     fuel_afford_las_shape@data[["local_auth"]], indicator_name, fuel_afford_las_shape@data[["value"]]
#   ) %>%
#     lapply(htmltools::HTML)
#
#
#   leaflet(fuel_afford_las_shape, options = leafletOptions(zoomSnap = 0.25, zoomDelta=0.25)) %>%
#     setView(lng = -2, lat = 56.8, zoom = 6.25) %>%
#     addTiles() %>%
#     addPolygons(weight = 1, smoothFactor = 0.5,
#                 fillColor = ~pal(value),
#                 opacity = 0.5, fillOpacity = 0.7,
#                 color = "white",
#                 dashArray = "3",
#                 popup = labels,
#                 highlightOptions =  highlightOptions(color = "white", weight = 2,
#                                                      bringToFront = TRUE),
#                 layerId = ~code) %>%
#     addLegend("bottomright", pal = pal, values = ~value,
#               title = paste0("Percent of Household (%)", "<br> in ", input$fuel_afford_year_input),
#               labFormat = labelFormat(suffix  = "%"),
#               opacity = 1
#     )
#     }
# )

# update the varible rv_fuel_poverty
observeEvent(input$fuel_afford_SHCS_map_shape_click,{
  rv_fuel_poverty(input$fuel_afford_SHCS_map_shape_click$id)
})


# plot trend
output$fuel_afford_line_LA = renderPlotly({
  fuel_afford_LA_line_data = fuel_SHCS_LA %>%
    filter(fuel_poverty == fuel_afford_indicator,
           feature_code == rv_fuel_poverty() ) %>%
    arrange(date_code)

  title = fuel_afford_LA_line_data$ca2019name %>% unique()
  fuel_afford_plot_line(fuel_afford_LA_line_data, title = title)
})



##############################################.
# MANAGING FINANCIALLY----
##############################################.


managing_financially_updated = managing_financially %>%
  mutate(Percent = round_half_up(Percent,1)) %>%
  mutate(Answer = replace(Answer, Answer == "Others","Get by or Does not manage well")) %>%
  rename("Category" = "Answer")

output$managing_financially_bar_plot = renderPlotly({


  managing_financially_plot_bar(managing_financially_updated)
  #zero_hours_contracts_plot_line(plot_data)

})


### table
output$managing_financially_data_table = DT::renderDataTable({

  datatable_style_download(managing_financially_updated,
                           datetype = "year",
                           data_name = "managing_financially",
                           geogtype = "none")
})




##############################################.
# Unmanageable debt----
##############################################.

output$unmanageable_debt_line = renderPlotly({

  unmanageable_debt_plot_line(unmanageable_debt)

})


output$unmanageable_debt_data = DT::renderDataTable({

  datatable_style_download(unmanageable_debt,
                           datetype = "year",
                           data_name = "unmanageable_debt",
                           geogtype = "none")
})



##############################################.
# Savings----
##############################################.

council_option = "Scotland"

plot_data_filtered_council = reactive({
  savings_low_income %>%
  filter(council == council_option)
  })

output$savings_net_income_ui = renderUI({



  selectizeInput("savings_net_income_si",
                 label = "Select Net income",
                 choices = unique(plot_data_filtered_council()$net_income),
                 selected = "All")
})



output$savings_stacked_bar_plot = renderPlotly({

  savings_plot_data_stacked_bar = plot_data_filtered_council() %>%
    filter(net_income == input$savings_net_income_si)

  savings_plot_stacked_bar(savings_plot_data_stacked_bar)

})





##map


net_income_option = "All"
savings_option = "No savings"

savings_low_income_cat = savings_low_income %>%
    filter(savings == savings_option,
           net_income == net_income_option
           )


output$savings_low_income_year_ui = renderUI({

  savings_low_income_choices = savings_low_income_cat$year %>%
    unique() %>%
    sort()
  savings_low_income_selected = savings_low_income_choices %>% tail(n=1)

  selectizeInput("savings_low_income_year_input",
                 label = "Select year to view on heatmap:",
                 choices = savings_low_income_choices,
                 selected = savings_low_income_selected)
})


savings_low_income_indicator_name = paste0("Househould with no savings (%)")

#add the values to the LA shapes
rv_savings_low_income = reactiveVal("S92000003")

observeEvent(input$savings_net_income_map_button, {
  rv_savings_low_income("S92000003")
})


# output$savings_low_income_map = renderLeaflet({
#   las_shape_map_data = pub_las_simplified
#
#   savings_cat_year = savings_low_income_cat %>%
#     filter(year == input$savings_low_income_year_input)
#
#
#
#   las_shape_map_data@data = las_shape_map_data@data %>%
#     left_join(savings_cat_year , by = c("code" = "ca2019"))
#
#   # value for storing the selected LA; initialized with Scotland geometry
#
#
#   # features of the map
#   bins = c(0, 10, 20, 30, 40, 50)
#   pal = colorBin("YlOrRd", domain = las_shape_map_data$percentage, bins = bins)
#
#   labels <- sprintf(
#     "<strong>%s</strong>
#     <br/> %s: %g%%",
#     las_shape_map_data@data[["council"]], savings_low_income_indicator_name, las_shape_map_data@data[["percentage"]]
#   ) %>%
#     lapply(htmltools::HTML)
#
#
#   leaflet(las_shape_map_data, options = leafletOptions(zoomSnap = 0.25, zoomDelta=0.25)) %>%
#     setView(lng = -2, lat = 56.8, zoom = 6.25) %>%
#     addTiles() %>%
#     addPolygons(weight = 1, smoothFactor = 0.5,
#                 fillColor = ~pal(percentage),
#                 opacity = 0.5, fillOpacity = 0.7,
#                 color = "white",
#                 dashArray = "3",
#                 popup = labels,
#                 highlightOptions =  highlightOptions(color = "white", weight = 2,
#                                                      bringToFront = TRUE),
#                 layerId = ~code) %>%
#     addLegend("bottomright", pal = pal, values = ~percentage,
#               title = paste0(savings_low_income_indicator_name, "<br> in ", input$savings_low_income_year_input),
#               labFormat = labelFormat(suffix  = "%"),
#               opacity = 1
#     )
# })

#update the varible
observeEvent(input$savings_low_income_map_shape_click,{
  rv_savings_low_income(input$savings_low_income_map_shape_click$id)
})


# plot trend
output$savings_low_income_line_LA = renderPlotly({


  savings_low_income_line_LA_data = savings_low_income_cat %>%
    filter(ca2019  == rv_savings_low_income())

  title = savings_low_income_line_LA_data$council %>% unique()


  savings_low_income_plot_line(savings_low_income_line_LA_data,
                                      title = title,
                                      indicator_name = savings_low_income_indicator_name)
})



### table
output$savings_low_income_data = DT::renderDataTable({

  datatable_style_download(savings_low_income,
                           datetype = "year",
                           data_name = "savings_low_income",
                           geogtype = "none")
})




##############################################.
# HOUSEHOLD EXPENDITURE----
##############################################.

# Mutating agg cost of living row

household_spending %<>%
  rbind(., cost_of_living = household_spending) %>%
          group_by(year, geography, geography_type, pretty_date) %>%
          summarise(scotland = sum(scotland),
                    united_kingdom = sum(united_kingdom)) %>%
          mutate(household_spending = "Cost of living")

output$household_spending_bar = renderPlotly({
  household_expenditure_barplot(household_spending)
})

output$household_spending_data = DT::renderDataTable({

  datatable_style_download(household_spending,
                           datetype="finyear",
                           data_name = "household_spending",
                           geogtype = "none")
})


##############################################.
# CHILDCARE UPTAKE----
##############################################.

output$childcare_uptake_graph_line <- renderPlotly({
  childcare_uptake_plot(childcare_elc_uptake)

})


output$childcare_uptake_data <- DT::renderDataTable({
  # Formatting datatable output
  childcare_elc_uptake %>%
    rename("Number of eligible children accessing 1140 hours of funded ELC" = "n",
           "Total number of eligible children receiving ELC" = "total",
           "Age group" = "breakdown") %>%
    datatable_style_download(., datetype = "month",
                             data_name = "childcare_uptake", geogtype = "")


})






