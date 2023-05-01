##############################################.
# WELLBEING OF CHILDREN AND YOUNG PEOPLE TAB----
##############################################.
# This script sets up the content of the wellbeing tab

# observeEvent(input$wellbeing_to_info,
#              {updateTabsetPanel(session,
#                                 "intabset",
#                                 selected = "info_notes")
#                updateRadioButtons(session,
#                                   "pillar_type_info",
#                                   selected = "Covid recovery")
#                updateRadioButtons(session,
#                                   "indicator_type_info",
#                                   selected = "Wellbeing of children and young people")
#              })

##############################################.
# CHILD POVERTY----
##############################################.

output$child_poverty_chart <- renderPlotly({
  child_poverty_plot(child_poverty)
})

# output$child_poverty_data <- DT::renderDataTable({
#
#   datatable_style_download(child_poverty,
#                            datetype = "financial_year",
#                            data_name = "child_poverty",
#                            geogtype = "none")
# })

child_poverty %>%
  mutate(Group = factor(Group),
         financial_year = factor(financial_year)) %>%
  rename("Proportion Of people in relative poverty" = "proportion") %>%
  select(-c("pretty_date", "value", "geography", "geography_type", "indicator")) %>%
  dataDownloadServer(id = "child_poverty", filename = "child_poverty",
                     add_separator_cols_2dp = c(3))


##############################################.
# Pre-school development----
##############################################.

# Show geography names dependent on geography type input

observeEvent(input$preschool_geog_type, {

  areas = preschool %>%
    filter(geography_type == input$preschool_geog_type) %>%
    arrange(geography)

  # select_choice <- ifelse(input$preschool_geog_type == "Scotland", "area", input$preschool_geog_type)

  updateSelectizeInput(session,
                       "preschool_geog_name",
                       label = glue("Step 2: Select national or local geography area"),
                       choices = unique(areas$geography))
})

output$preschool_chart_line2 = renderPlotly({
  data = preschool %>%
    filter(geography %in% c("Scotland", input$HB_input, input$LA_input))

  preschool_plot_line2(data)

})


output$preschool_chart_line = renderPlotly({

  data = geog_all_filter_table(preschool,
                               input$preschool_geog_type,
                               input$preschool_geog_name)


  if(input$preschool_geog_type == "Health Board") {
    data_baseline = preschool %>%
      filter(geography_type=="Scotland")

    p = preschool_plot_line(data, data_baseline, TRUE,
                            input$preschool_geog_name,
                            "Scotland")

  } else if (input$preschool_geog_type == "Council Area") {
    hb = data %>%
      slice(1) %>%
      .$hb2019name

    data_baseline = preschool %>%
      filter(hb2019name %in% hb,
             geography_type == "Health Board")

    p = preschool_plot_line(data, data_baseline, TRUE,
                            input$preschool_geog_name,
                            hb)
  } else {
    p = preschool_plot_line(data)
  }

  return(p)

})

observeEvent(input$preschool_radiobuttons, {

  data_unfiltered <- preschool %>%
    select(financial_year, geography_type, geography, number_of_reviews,
           concern_any, proportion = prop_concern_any) %>%
    rename("Total number of reviews" = "number_of_reviews",
           "Number of reviews with any concern" = "concern_any",
           "Proportion of total reviews with any concern" = "proportion")

  data_filtered <- data_unfiltered %>%
    filter(geography_type == input$preschool_radiobuttons) %>%
    mutate(financial_year = factor(financial_year),
           geography = factor(geography))

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "preschool_development", filename = "preschool_development",
                     add_separator_cols = c(4,5),
                     add_separator_cols_2dp = c(6))
})

observeEvent(input$preschool_radiobuttons, {

  geog_type <- ifelse(input$preschool_radiobuttons == "Scotland",
                      "in Scotland",
                      paste0("by ", input$preschool_radiobuttons))

  output$preschool_table_title <- renderText({
    glue("Data table: Proportion of health visitor reviews where any ",
         "form of developmental concern was raised ", geog_type)})
})

##############################################.
# CAMHS waiting times----
##############################################.

observeEvent(input$CAMHS_geog_type,
             {

               CAMHS_filtered = camhs_waiting_times2 %>%
                 filter(geography_type == input$CAMHS_geog_type)

               #select_choice <- ifelse(input$geog_type_summary_CW == "Scotland", "area", input$geog_type_summary)

               updateSelectizeInput(session, "CAMHS_geog_name",
                                    #label = glue("4. Select {select_choice}"),
                                    choices = unique(CAMHS_filtered$geography))#,
               #selected = "")
             })

camhs_filtered_table = camhs_waiting_times2 %>%
  filter(wait_time == "0 to 18 weeks")

# Proportion meeting target of 18 weeks line chart
output$camhs_waiting_times_graph_line = renderPlotly({

  if (input$vlines_camhs == "On") {
    plot = camhs_plot_line(hb_filter_table(camhs_filtered_table, input$CAMHS_geog_name))
  } else {
    plot = camhs_plot_line(hb_filter_table(camhs_filtered_table, input$CAMHS_geog_name),
                           vline = FALSE)
  }



})

# Stacked bar chart with all wait times
output$camhs_waiting_times_graph_stack = renderPlotly({
  camhs_plot_stacked_bar(hb_filter_table(camhs_waiting_times2, input$CAMHS_geog_name))

})

observeEvent(input$CAMHS_geog_name,{

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
    filter(health_board == input$CAMHS_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "camhs", filename = "CAMHS_waiting_times",
                     add_separator_cols = c(4),
                     add_separator_cols_2dp = c(5))

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

inf_deaths %>%
  arrange(desc(date)) %>%
  select(date, count, denominator, rate) %>%
  mutate(date = format(date, "%B %Y")) %>%
  rename("Month" = "date",
         "Number of infant deaths" = "count",
         "Number of live births" = "denominator",
         "Rate of infant deaths per 1,000 live births" = "rate") %>%
  dataDownloadServer(id = "infant_mortality", filename = "infant_mortality",
                     add_separator_cols = c(2,3),
                     add_separator_cols_2dp = c(4))




##############################################.
# Positive desinations of school leavers----
##############################################.

output$school_leavers_line_figure = renderPlotly({
  data = positive_destinations_school_leavers %>%
    filter(category == input$school_leavers_category_input)

  school_leavers_plot_line(data)
})


observeEvent(input$school_leavers_category_input,{

  data_unfiltered <- positive_destinations_school_leavers %>%
    arrange(desc(financial_year), category, characteristic) %>%
    select(financial_year, category, characteristic, percent) %>%
    rename("Percentage of school leavers in positive destinations (%)" = "percent")

  data_filtered <- data_unfiltered %>%
    filter(category == input$school_leavers_category_input) %>%
    mutate(category = factor(category),
           characteristic = factor(characteristic),
           financial_year = factor(financial_year))

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "school_leavers", filename = "positive_destination_of_school_leavers",
                     add_separator_cols_2dp = c(4))

  output$school_leavers_table_title <- renderText({
    ifelse(input$school_leavers_category_input == "All Leavers",
           glue("Data table: Percentage of all school leavers in positive destinations"),
           ifelse(input$school_leavers_category_input == "Sex",
                  glue("Data table: Percentage of school leavers in positive destinations by sex"),
                  ifelse(input$school_leavers_category_input == "Ethnicity",
                         glue("Data table: Percentage of school leavers in positive destinations by ethnicity"),
                         ifelse(input$school_leavers_category_input == "Urban/Rural",
                                glue("Data table: Percentage of school leavers in positive destinations by urban/rural category"),
                                ifelse(input$school_leavers_category_input == "Additional Support Needs",
                                       glue("Data table: Percentage of school leavers in positive destinations by additional support needs category"),
                                       NA)))))
  })

})



##############################################.
# PROTECTION FROM HARM----
##############################################.


output$protection_harm_line = renderPlotly({

  protection_from_harm_line_chart(protection_from_harm)

})


protection_from_harm %>%
  arrange(desc(date_end)) %>%
  select(Date, Value) %>%
  mutate(Date = gsub("-", "to", Date)) %>%
  rename("Number of children subject to interagency referral discussions" = "Value",
         "Date Range" = "Date") %>%
  dataDownloadServer(id = "protection_harm", filename = "protection_from_harm",
                     add_separator_cols = c(2))




