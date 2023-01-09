##############################################.
# WELLBEING OF CHILDREN AND YOUNG PEOPLE TAB----
##############################################.
# This script sets up the content of the wellbeing tab

##############################################.
# CHILD POVERTY----
##############################################.

output$child_poverty_chart <- renderPlotly({
  child_poverty_plot(child_poverty)
})

output$child_poverty_data = DT::renderDataTable({

  datatable_style_download(child_poverty,
                           datetype = "financial_year",
                           data_name = "child_poverty",
                           geogtype = "none")
})

##############################################.
# Pre-school development----
##############################################.

# Show geography names dependent on geography type input

output$geog_preschool_ui = renderUI({

  areas_summary = geog_lookup %>%
    filter(geography_type == input$geog_type_preschool)

  selectizeInput("geog_name_preschool", label = "2. Select geography",
                 choices = unique(areas_summary$geography),
                 selected = "")
})

output$preschool_chart_line2 = renderPlotly({
  data = preschool %>%
    filter(geography %in% c("Scotland", input$HB_input, input$LA_input))

  preschool_plot_line2(data)

})


output$preschool_chart_line = renderPlotly({

  data = geog_all_filter_table(preschool,
                               input$geog_type_preschool,
                               input$geog_name_preschool)


  if(input$geog_type_preschool == "Health Board") {
    data_baseline = preschool %>%
      filter(geography_type=="Scotland")

    p = preschool_plot_line(data, data_baseline, TRUE,
                            input$geog_name_preschool,
                            "Scotland")

  } else if (input$geog_type_preschool == "Council Area") {
    hb = data %>%
      slice(1) %>%
      .$hb2019name

    data_baseline = preschool %>%
      filter(hb2019name == hb &
             geography_type == "Health Board")

    p = preschool_plot_line(data, data_baseline, TRUE,
                            input$geog_name_preschool,
                            hb)
  } else {
    p = preschool_plot_line(data)
  }

  return(p)

})

output$preschool_data = DT::renderDataTable({

  preschool_out = preschool %>%
    filter(geography_type == input$preschool_radiobuttons) %>%
    select(financial_year, geography, number_of_reviews,
           concern_any, proportion = prop_concern_any)
  datatable_style_download(preschool_out,
                           datetype = "financial_year",
                           data_name = "preschool",
                           geogtype = "council_area")
})

##############################################.
# CAMHS waiting times----
##############################################.


camhs_filtered_table = camhs_waiting_times2 %>%
  filter(wait_time == "0 to 18 weeks")

output$camhs_data = DT::renderDataTable({
  datatable_style_download(camhs_waiting_times2, data_name = "camhs")
})

# Proportion meeting target of 18 weeks line chart
output$camhs_waiting_times_graph_line = renderPlotly({

  if (input$vlines_camhs == "On") {
    plot = camhs_plot_line(hb_filter_table(camhs_filtered_table, input$HB_CAMHS))
  } else {
    plot = camhs_plot_line(hb_filter_table(camhs_filtered_table, input$HB_CAMHS),
                           vline = FALSE)
  }



})

# Stacked bar chart with all wait times
output$camhs_waiting_times_graph_stack = renderPlotly({
  camhs_plot_stacked_bar(hb_filter_table(camhs_waiting_times2, input$HB_CAMHS))

})


##############################################.
# Infant mortality----
##############################################.



yaxis_inf_deaths <- list(title = "Rate per 1,000 live births",
                         rangemode="tozero",
                         fixedrange=TRUE,
                         tickfont = list(size=14),
                         titlefont = list(size=18),
                         showline = TRUE)

output$infant_mortality_graph = renderPlotly({
  inf_deaths %>%
    plot_ly(x=~date,
            y=~rate,
            type = "scatter",
            mode = "lines+markers",
            line = list(color="#655E9D"),
            marker = list(color="#655E9D"),
            text = paste0(format(inf_deaths$date, "%B %Y"), "<br>",
                          "Rate per 1,000 live births: ",
                          round_half_up(inf_deaths$rate, 1),"<br>",
                          "Number of infant deaths: ", inf_deaths$count, "<br>"),
            hoverinfo = "text") %>%
    layout(yaxis = yaxis_inf_deaths,
           xaxis = xaxis_month) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
})

output$infant_data = DT::renderDataTable({

  inf_deaths_out = inf_deaths %>%
    select(date, geography_name, "number_of_infant_deaths" = count,
           number_of_live_births = denominator, "rate per 1,000 live births" = rate)

  datatable_style_download(inf_deaths_out, data_name = "infant", geogtype = "scotland")
})



##############################################.
# Positive desinations of school leavers----
##############################################.

output$school_leavers_category_ui = renderUI({
  choices = positive_destinations_school_leavers$category %>% unique()
  selected = "All Leavers"

  selectizeInput("school_leavers_category_input",
                 label = "Select pupil characteristic category:",
                 choices = choices,
                 selected = selected)
})

output$school_leavers_line_figure = renderPlotly({
  data = positive_destinations_school_leavers %>%
    filter(category == input$school_leavers_category_input)

  school_leavers_plot_line(data)
})


output$school_leavers_table = DT::renderDataTable({

  datatable_style_download(positive_destinations_school_leavers, datetype = "year", data_name = "school_leavers", geogtype = "scotland")
})


##############################################.
# PROTECTION FROM HARM----
##############################################.


output$protection_harm_line = renderPlotly({

  protection_from_harm_line_chart(protection_from_harm)

})

output$protection_harm_data = DT::renderDataTable({

  out_data = protection_from_harm %>%
    mutate(Date = paste0(format(date_start, "%d %B %Y"),
                         " to ",
                         format(date_end, "%d %B %Y"))) %>%
    select(Date,
           "Number of children subject to interagency referral discussions" = Value)

  datatable_style_download(out_data,
                           datetype = "fortnight",
                           data_name = "protection_from_harm",
                           geogtype = "scotland")
})





