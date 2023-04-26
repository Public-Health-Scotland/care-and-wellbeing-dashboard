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
observeEvent(input$camhs_waiting_times_cw_geog_type,
             {

               camhs_waiting_filtered = camhs_waiting_times2 %>%
                 filter(geography_type == input$camhs_waiting_times_cw_geog_type)

               #select_choice <- ifelse(input$geog_type_summary_CW == "Scotland", "area", input$geog_type_summary)

               updateSelectizeInput(session, "camhs_waiting_times_cw_geog_name",
                                    #label = glue("4. Select {select_choice}"),
                                    choices = unique(camhs_waiting_filtered$geography))#,
               #selected = "")
             })

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

