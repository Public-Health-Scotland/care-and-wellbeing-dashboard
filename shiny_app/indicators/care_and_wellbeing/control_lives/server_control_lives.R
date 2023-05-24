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
                                        "for plotting. The default is Scotland. Please note that for some Health Boards there are no data in some months",
                                        "and will appear as a gap on the graph."),
                                tags$li("The legend shows 4 categories: `0 to 18 weeks`, `19 to 35 weeks`, `36 to 52 weeks`",
                                        "and `Over 52 weeks`. These are represented on the bar plot in the same order from bottom to top."),
                                tags$li("The x axis is the month treatment started."),
                                tags$li("The y axis is the percentage of patients seen by wait time since referral.")
              ))

altTextServer("camhs_waiting_times_cw_seen_within_alt",
              title = "Percentage of CAMHS patients seen within 18 weeks of referral plot",
              content = tags$ul(tags$li("This is a plot for the trend in percentage of CAMHS patients seen seen within 18 weeks of referral."),
                                tags$li("The x axis is the month treatment started."),
                                tags$li("The y axis is the percentage of CAMHS patients seen within 18 weeks of referral."),
                                tags$li("The solid purple line is the percentage of CAMHS patients seen within 18 weeks of referral",
                                        "and the dashed red line is the Scottish Government target."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local geography level and area",
                                        "for plotting. The default is Scotland. Please note that for some Health Boards there are no data in some months",
                                        "and will appear as a gap on the graph."),
                                tags$li("There is a toggle above the chart which allows you to select whether to view the timeline of lockdowns on the chart.",
                                        "If 'On' is selected, three dotted vertical lines will display when the 1st, 2nd and 3rd lockdowns occured.")

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
           proportion = proportion*100,
           hb2019name = factor(hb2019name)) %>%
    rename("Month" = "date",
           "health_board" = "hb2019name",
           "Number of patients seen" = "number",
           "Percentage of patients seen (%)" = "proportion")

  data_filtered <- data_unfiltered %>%
    filter(health_board == input$camhs_waiting_times_cw_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "camhs_cw", filename = "CAMHS_waiting_times",
                     add_separator_cols = c(4),
                     add_separator_cols_1dp = c(5))

})

observeEvent(input$camhs_waiting_times_cw_geog_name, {

  output$camhs_cw_table_title <- renderText({
    glue("Data table: Percentage of CAMHS patients seen by wait time since referral in ",
         input$camhs_waiting_times_cw_geog_name)})

})


# Proportion meeting target of 18 weeks line chart
output$camhs_waiting_times_cw_seen_within_plot = renderPlotly({

  title <- glue("Percentage of CAMHS patients seen within 18 weeks of referral in ", input$camhs_waiting_times_cw_geog_name)

  if (input$camhs_waiting_times_cw_vlines == "On") {
    plot = make_camhs_waiting_times_cw_line_plot(hb_filter_table(camhs_waiting_times_cw_filtered_table, input$camhs_waiting_times_cw_geog_name),
                                                 title = title)
  } else {
    plot = make_camhs_waiting_times_cw_line_plot(hb_filter_table(camhs_waiting_times_cw_filtered_table, input$camhs_waiting_times_cw_geog_name),
                                                 title = title, vline = FALSE)
  }



})

# Stacked bar chart with all wait times
output$camhs_waiting_times_cw_seen_since_plot = renderPlotly({

  title <- glue("Percentage of CAMHS patients seen by wait time since referral in ", input$camhs_waiting_times_cw_geog_name)

  camhs_waiting_times2 %>%
    filter(geography == input$camhs_waiting_times_cw_geog_name) %>%
    make_camhs_waiting_times_cw_bar_plot(title = title)

})


