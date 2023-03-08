##############################################.
# CHILDREN'S VOICES----
##############################################.


##############################################.
# CHILDREN HAVE POSITIVE RELATIONSHIPS----
##############################################.


##############################################.
# CONFIDENCE AND RESILIENCE OF CHILDREN AND YOUNG PEOPLE----
##############################################.


##############################################.
# MENTAL HEALTH / MENTAL WELLBEING----
##############################################.


##############################################.
# CAMHS WAITING TIMES----
##############################################.


camhs_waiting_times_cw_filtered_table = camhs_waiting_times2 %>%
  filter(wait_time == "0 to 18 weeks")

output$camhs_waiting_times_cw_table = DT::renderDataTable({
  datatable_style_download(camhs_waiting_times2, data_name = "camhs")
})

# Proportion meeting target of 18 weeks line chart
output$camhs_waiting_times_cw_seen_within_plot = renderPlotly({

  if (input$camhs_waiting_times_cw_vlines == "On") {
    plot = make_camhs_waiting_times_cw_line_plot(hb_filter_table(camhs_waiting_times_cw_filtered_table, input$camhs_waiting_times_cw_geog_name))
  } else {
    plot = make_camhs_waiting_times_cw_line_plot(hb_filter_table(camhs_waiting_times_cw_filtered_table, input$camhs_waiting_times_cw_geog_name),
                           vline = FALSE)
  }



})

# Stacked bar chart with all wait times
output$camhs_waiting_times_cw_seen_since_plot = renderPlotly({
  make_camhs_waiting_times_cw_bar_plot(hb_filter_table(camhs_waiting_times2, input$camhs_waiting_times_cw_geog_name))

})

