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

altTextServer("camhs_waiting_times_cw_seen_since_alt",
              title = "Percentage of CAMHS patients seen by wait time since referral plot",
              content = tags$ul(tags$li("This is a plot for the trend in percentage of CAMHS patients seen by wait time since referral."),
                                tags$li("It is a stacked bar plot where each bar refers to the month treatment started and each bar is seperated into",
                                        "sections which represent the percentage of patients seen by wait time since referral."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local geography level and area",
                                        "for plotting. The default is Scotland. Please note that for some healthboards there are no data in some months",
                                        "and will appear as a gap on the graph."),
                                tags$li("The legend shows 4 categories: `Over 52 weeks`, `36 to 52 weeks`, `19 to 35 weeks`, ",
                                        "and `0 to 18 weeks`. These are represented on the bar plot in the same order from top to bottom."),
                                tags$li("The x axis is the month treatment started."),
                                tags$li("The y axis is the percentage of patients seen by wait time since referral.")
              ))

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

observeEvent(input$camhs_waiting_times_cw_geog_name,{

  data_unfiltered <- camhs_waiting_times2 %>%
    arrange(desc(date), hb2019name, wait_time) %>%
    select(date, hb2019name, wait_time, number, proportion) %>%
    mutate(date = format(date, "%B %Y")) %>%
    mutate(wait_time = factor(wait_time),
           hb2019name = factor(hb2019name)) %>%
    rename("Month" = "date",
           "health_board" = "hb2019name",
           "Number of patients seen" = "number",
           "Proportion of patients seen" = "proportion")

  data_filtered <- data_unfiltered %>%
    filter(health_board == input$camhs_waiting_times_cw_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "camhs_cw", filename = "CAMHS_waiting_times",
                     add_separator_cols = c(4),
                     add_separator_cols_2dp = c(5))

})

observeEvent(input$camhs_waiting_times_cw_geog_name, {

  output$camhs_cw_table_title <- renderText({
    glue("Data table: Proportion of CAMHS patients seen by wait time since referral in ",
         input$camhs_waiting_times_cw_geog_name)})

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

  title <- glue("Percentage of CAMHS patients seen by wait time since referral in ", input$camhs_waiting_times_cw_geog_name)

  camhs_waiting_times2 %>%
    filter(geography == input$camhs_waiting_times_cw_geog_name) %>%
    make_camhs_waiting_times_cw_bar_plot(title = title)

})


