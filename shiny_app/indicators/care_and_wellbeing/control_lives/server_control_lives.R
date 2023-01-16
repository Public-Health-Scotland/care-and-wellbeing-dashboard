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
# CAMHS waiting times----
##############################################.


camhs_waiting_times_2_filtered_table = camhs_waiting_times2 %>%
  filter(wait_time == "0 to 18 weeks")

output$camhs_waiting_times_2_data = DT::renderDataTable({
  datatable_style_download(camhs_waiting_times2, data_name = "camhs")
})

# Proportion meeting target of 18 weeks line chart
output$camhs_waiting_times_2_graph_line = renderPlotly({

  if (input$vlines_camhs_waiting_times_2 == "On") {
    plot = camhs_waiting_times_2_plot_line(hb_filter_table(camhs_waiting_times_2_filtered_table, input$HB_camhs_waiting_times_2))
  } else {
    plot = camhs_waiting_times_2_plot_line(hb_filter_table(camhs_waiting_times_2_filtered_table, input$HB_camhs_waiting_times_2),
                           vline = FALSE)
  }



})

# Stacked bar chart with all wait times
output$camhs_waiting_times_2_graph_stack = renderPlotly({
  camhs_waiting_times_2_plot_stacked_bar(hb_filter_table(camhs_waiting_times2, input$HB_camhs_waiting_times_2))

})

