##############################################.
# LIFE EXPECTANCY----
##############################################.

altTextServer("life_expectancy_trend_alt",
              title = "Life expectancy by year range plot",
              content = tags$ul(tags$li("This is a plot for the trend in life expectancy in Scotland."),
                                tags$li("The x axis is the 3 year range, starting from 2009-2011."),
                                tags$li("The y axis is the life expectancy in years."),
                                tags$li("There is a drop down above the chart which allows you to select sex"),
                                tags$li("The solid purple line is the specified sex"),
                                tags$li("Since the 2017-2019 there has been a downwards trend in male healthy life expectancy at birth for both males and females")

              )
)

output$life_expectancy_trend_plot = renderPlotly({
  title <- glue(input$life_expectancy_sex,
                " life expectancy at birth in Scotland"
  )
  data = life_expectancy %>%
    filter(geography == "Scotland",
           sex == input$life_expectancy_sex) %>%
    rename(date = time_period) %>%
    line_chart_function(., y_title = "Life expectancy (years)", title = title, label = "Life expectancy") %>%
    layout(xaxis = list(tickangle = -30),
           yaxis = yaxis_number_normal,
           legend = list(y = -0.4))
})

altTextServer("life_expectancy_council_area_alt",
              title = "Life expectancy by council area plot",
              content = tags$ul(tags$li("This is a plot for life expectancy for the time period of 2019-2021 by council area."),
                                tags$li("The x axis is the council area."),
                                tags$li("The y axis is the life expectancy in years."),
                                tags$li("There is a drop down above the chart which allows you to select sex"),
                                tags$li("The purple dots represent the life expectancy for each council area for the selected sex",
                                        "and the vertical lines from each dot indicate the confidence interval."),
                                tags$li("The red dashed line across the centre of the chart indicates the live expectancy in Scotland
                                        for the selected sex"),
                                tags$li("Orkney Islands had the highest life expectancy at birth for both males and females."),
                                tags$li("Glasgow City had the lowest life expectancy at birth for both males and females.")

              )
)

output$life_expectancy_council_area_plot = renderPlotly({
  title <- glue(input$life_expectancy_sex,
                " life expectancy at birth in council areas 2019-2021"
  )
  data = life_expectancy %>%
    filter(sex == input$life_expectancy_sex) %>%
    mutate(ErrorBarHeight = upper_confidence_interval - lower_confidence_interval,
           ErrorBarLowerHeight = indicator - lower_confidence_interval) %>%
    rename(date = time_period) %>%
    confidence_scatter_function_le(., y_title = "Life expectancy (years)", title = title) %>%
    layout(xaxis = list(tickangle = -90),
           yaxis = yaxis_number_normal,
           legend = list(y = -1.5))
})




altTextServer("life_expectancy_simd_alt",
              title = "Life expectancy by council area plot",
              content = tags$ul(tags$li("This is a plot for life expectancy for the time period of 2019-2021 by SIMD decile."),
                                tags$li("The x axis is the SIMD deciles."),
                                tags$li("The y axis is the life expectancy in years."),
                                tags$li("There is a drop down above the charts which allows you to select sex"),
                                tags$li("The purple dots represent the life expectancy for each SIMD decile for the selected sex",
                                        "and the vertical lines from each dot indicate the confidence interval."),
                                tags$li("The red dashed line across the centre of the chart indicates the live expectancy in Scotland
                                        for the selected sex.")

              )
)

output$life_expectancy_simd_plot = renderPlotly({
  title <- glue(input$life_expectancy_sex,
                " life expectancy at birth by SIMD deciles 2019-2021"
  )

  data = life_expectancy_simd %>%
    filter(sex == input$life_expectancy_sex) %>%
    mutate(ErrorBarHeight = upper_confidence_interval - lower_confidence_interval,
           ErrorBarLowerHeight = life_expectancy_at_birth - lower_confidence_interval) %>%
    confidence_scatter_function_le_simd(title = title) %>%
    layout(xaxis = list(tickangle = -30),
           legend = list(y = -0.4))


  # data = life_expectancy_simd %>%
  #   filter(sex == input$life_expectancy_sex) %>%
  #   mode_bar_plot(x = .$simd_2020_decile, y = .$life_expectancy_at_birth, category_var = .$sex,
  #                 xaxis_title = "SIMD decile", yaxis_title = "Life expectancy (years)",
  #                 title = title) %>%
  #   layout(xaxis = list(tickangle = -30),
  #          yaxis = yaxis_number_normal
  #   )
})

observeEvent(input$life_expectancy_tabBox, {
  observeEvent(input$life_expectancy_sex,{

    if(input$life_expectancy_tabBox == "SIMD") {

      title <- glue("Data table:",
                    input$life_expectancy_sex,
                    " life expectancy at birth by SIMD decile, 2019-2021")

    } else {

      title <- glue("Data table:",
                    input$life_expectancy_sex,
                    " life expectancy at birth")

    }


    output$life_expectancy_title <- renderUI({h3(title)})
  })

})

observeEvent(input$life_expectancy_sex,{

  data_unfiltered <- life_expectancy %>%
    select(time_period, geography_type, geography, sex, stage_of_life, indicator,
           lower_confidence_interval, upper_confidence_interval) %>%
    arrange(time_period) %>%
    mutate(time_period = factor(time_period)) %>%
    rename("year_range" = "time_period",
           "life_expectancy (years)" = "indicator")

  data_filtered <- data_unfiltered %>%
    filter(sex == input$life_expectancy_sex)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "life_expectancy", filename = "life_expectancy",
                     add_separator_cols_2dp = c(6,7,8))
})

observeEvent(input$life_expectancy_sex,{

  data_unfiltered <- life_expectancy_simd %>%
    select(sex, simd_2020_decile, life_expectancy_at_birth)

  data_filtered <- data_unfiltered %>%
    filter(sex == input$life_expectancy_sex)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "life_expectancy_simd", filename = "life_expectancy",
                     add_separator_cols_2dp = c(3))
})



##############################################.
# HEALTHY LIFE EXPECTANCY----
##############################################.

altTextServer("healthy_life_expectancy_trend_alt",
              title = "Healthy life expectancy by year range plot",
              content = tags$ul(tags$li("This is a plot for the trend in healthy life expectancy in Scotland."),
                                tags$li("The x axis is the 3 year range, starting from 2009-2011."),
                                tags$li("The y axis is the healthy life expectancy in years."),
                                tags$li("There are two drop downs above the chart which allow you to select sex",
                                        "and whether the healthy life expectancy is at birth or at age 65."),
                                tags$li("The solid purple line is the specified sex and stage of life and the lighter purple area around",
                                        "the line indicates the confidence interval."),
                                tags$li("The bottom of the light purple shaded area represents the lower confidence interval and the top of the",
                                        "area represents the upper confidence interval."),
                                tags$li("Since the data began there has been a general downwards trend in male healthy life expectancy for both",
                                        "at birth and at age 65"),
                                tags$li("Since the data began there has been a general downwards trend in female healthy life expectancy at birth,",
                                        "but a general upwards trend in female healthy life expectancy at age 65.")


              )
)

output$healthy_life_expectancy_trend_plot = renderPlotly({
  title <- glue(input$healthy_life_expectancy_sex,
                " healthy life expectancy ",
                str_to_lower(input$healthy_life_expectancy_life_stage),
                " in Scotland"
  )
  data = healthy_life_expectancy %>%
    filter(geography == "Scotland",
           sex == input$healthy_life_expectancy_sex,
           stage_of_life == input$healthy_life_expectancy_life_stage) %>%
    rename(date = time_period) %>%
    confidence_line_function_hle(., y_title = "Healthy life expectancy (years)", title = title) %>%
    layout(xaxis = list(tickangle = -30),
           yaxis = yaxis_number_normal,
           legend = list(y = -0.4))
})

altTextServer("healthy_life_expectancy_council_area_alt",
              title = "Healthy life expectancy by council area plot",
              content = tags$ul(tags$li("This is a plot for healthy life expectancy for the time period of 2019-2021 by council area."),
                                tags$li("The x axis is the council area."),
                                tags$li("The y axis is the healthy life expectancy in years."),
                                tags$li("There are two drop downs above the chart which allow you to select sex",
                                        "and whether the healthy life expectancy is at birth or at age 65."),
                                tags$li("The purple dots is the healthy life expectancy for each council area for specified sex and stage of life",
                                        "and the vertical lines from each dot indicates the confidence interval."),
                                tags$li("Orkney Islands had the highest healthy life expectancy at birth for both males and females."),
                                tags$li("North Lanarkshire had the lowest healthy life expectancy at birth for males and",
                                        "North Ayrshire had the lowest healthy life expectancy at birth for females.")

              )
)

output$healthy_life_expectancy_council_area_plot = renderPlotly({
  title <- glue(input$healthy_life_expectancy_sex,
                " healthy life expectancy ",
                str_to_lower(input$healthy_life_expectancy_life_stage),
                " in council areas 2019-2021"
  )
  data = healthy_life_expectancy %>%
    filter(sex == input$healthy_life_expectancy_sex,
           stage_of_life == input$healthy_life_expectancy_life_stage) %>%
    mutate(ErrorBarHeight = upper_confidence_interval - lower_confidence_interval,
           ErrorBarLowerHeight = indicator - lower_confidence_interval) %>%
    rename(date = time_period) %>%
    confidence_scatter_function_hle(., y_title = "Healthy life expectancy (years)", title = title) %>%
    layout(xaxis = list(tickangle = -30),
           yaxis = yaxis_number_normal,
           legend = list(y = -1.3))
})

observeEvent(input$healthy_life_expectancy_sex,{
  observeEvent(input$healthy_life_expectancy_life_stage,{

    data_unfiltered <- healthy_life_expectancy %>%
      select(time_period, geography_type, geography, sex, stage_of_life, indicator,
             lower_confidence_interval, upper_confidence_interval) %>%
      arrange(time_period) %>%
      mutate(time_period = factor(time_period)) %>%
      rename("year_range" = "time_period",
             "healthy_life_expectancy (years)" = "indicator")

    data_filtered <- data_unfiltered %>%
      filter(sex == input$healthy_life_expectancy_sex) %>%
      filter(stage_of_life == input$healthy_life_expectancy_life_stage)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "healthy_life_expectancy", filename = "healthy_life_expectancy",
                       add_separator_cols_2dp = c(6,7,8))
  })
})

observeEvent(input$healthy_life_expectancy_sex,{
  observeEvent(input$healthy_life_expectancy_life_stage,{

    output$healthy_life_expectancy_title <- renderUI({h3(glue("Data table:",
                                                              input$healthy_life_expectancy_sex,
                                                              " healthy life expectancy ",
                                                              str_to_lower(input$healthy_life_expectancy_life_stage)))})
  })
})

##############################################.
# MENTAL WELLBEING OF ADULTS (16+)----
##############################################.
altTextServer("mental_wellbeing_alt",
              title = "Adult mental wellbeing by sex plot",
              content = tags$ul(tags$li("This is a plot for the trend in mean Warwick-Edinburgh Mental Wellbeing Scales (WEMWBS) score for people aged 16+ in Scotland by sex."),
                                tags$li("The x axis is the year, starting from 2008."),
                                tags$li("The y axis is the mean WEMWBS score."),
                                tags$li("The solid purple line is all sexes, the blue line is females and the grey line is males"),
                                tags$li("In 2021, the WEMWBS mean score for adults was 48.6, the lowest figure in the time series"),
                                tags$li("Before 2021 the mean scores had ranged between 49.4 and 50.0")


              )
)

output$mental_wellbeing_trend_plot = renderPlotly({
  title <- glue("Mental wellbeing (WEMWBS score) by sex in Scotland"
  )
  data = adult_mental_welbeing %>%
    make_line_chart_multi_lines(.,x = .$year, y = .$indicator, colour = .$sex,
                                y_axis_title = "Mean WEMWBS score", title = title) %>%
    layout(legend = list(y = -0.4))

})

altTextServer("mental_wellbeing_simd_alt",
              title = "Adult mental wellbeing by SIMD plot",
              content = tags$ul(tags$li("This is a plot for the trend in mean Warwick-Edinburgh Mental Wellbeing Scales (WEMWBS) score",
                                        "for people aged 16+ in Scotland by SIMD deprivation category."),
                                tags$li("The x axis is the year, starting from 2008."),
                                tags$li("The y axis is the mean WEMWBS score."),
                                tags$li("SIMD is a relative measure of deprivation across small areas in Scotland.",
                                        "There are equal numbers of data zones in each of the five categories.",
                                        "SIMD 1 contains the 20% most deprived zones and SIMD 5 contains the 20% least deprived zones."),
                                tags$li("The plot contains a trace for each of the SIMD categories."),
                                tags$li("In 2021 those living in the most deprived areas had lower average mental wellbeing scores (46.8)",
                                        "compared to those living in the least deprived areas (50.5).")

              )
)

output$mental_wellbeing_simd_plot = renderPlotly({
  title <- glue("Mental wellbeing (WEMWBS score) by SIMD in Scotland"
  )
  data = adult_mental_welbeing_simd %>%
    make_line_chart_multi_lines(.,x = .$year, y = .$indicator, colour = .$simd,
                                y_axis_title = "Mean WEMWBS score", title = title) %>%
    layout(legend = list(y = -0.4))

})

adult_mental_welbeing %>%
  select(c(year, sex, indicator)) %>%
  rename("Mean WEMWBS score" = "indicator",
         Year = "year") %>%
  arrange(desc(Year)) %>%
  dataDownloadServer(id = "mental_wellbeing",
                     filename = "mental_wellbeing",
                     keep_colnames = c(3))

adult_mental_welbeing_simd %>%
  select(c(year, simd, indicator)) %>%
  rename("Mean WEMWBS score" = "indicator",
         Year = "year",
         SIMD = "simd") %>%
  arrange(desc(Year)) %>%
  dataDownloadServer(id = "mental_wellbeing_simd",
                     filename = "mental_wellbeing_simd",
                     keep_colnames = c(2,3))

##############################################.
# HEALTHY WEIGHT ADULTS----
##############################################.


##############################################.
# HEALTH RISK BEHAVIOURS----
##############################################.


##############################################.
# PHYSICAL ACTIVITY----
##############################################.


##############################################.
# QUALITY OF CARE EXPERIENCE----
##############################################.


##############################################.
# JOURNEYS BY ACTIVE TRAVEL----
##############################################.


##############################################.
# WORK-RELATED ILL HEALTH----
##############################################.


##############################################.
# PREMATURE MORTALITY----
##############################################.

observeEvent(input$premature_mortality_geog_type,
             {

               premature_mortality_filtered = premature_mortality_all_cause %>%
                 filter(geography_type == input$premature_mortality_geog_type)


               updateSelectizeInput(session, "premature_mortality_geog_name",
                                    choices = unique(premature_mortality_filtered$geography))#,
               #selected = "")
             })

altTextServer("premature_mortality_hb_alt",
              title = "Premature mortality plot",
              content = tags$ul(tags$li("This is a plot for the trend in age-standardised all-cause mortality rates for people under 75."),
                                tags$li("The x axis is the year, starting from 2008."),
                                tags$li("The y axis is the age-standardised rate per 100,000 population."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland."),
                                tags$li("If Scotland is chosen then there will be one trend line representing Scotland.",
                                        "If a NHS Health Board is chosen then there will be two lines, a light green colour representing the trend in",
                                        "Scotland, and a purple line representing the trend in the chosen NHS Health Board.",
                                        "If a Council Area is chosen then there will be three lines, a purple line representing the Council Area, a teal line
                                        representing the NHS Health Board and a light green line representing Scotland."),
                                tags$li("Please be aware, for instances where a NHS Health Board contains only one Council Area
                                        then the values for both geographies will match and only two lines will be visible
                                        when that Council Area has been chosen. All lines are present and can be seen by clicking on the
                                        legend as described under the 'Using the plot' button.")


              )
)

altTextServer("premature_mortality_simd_alt",
              title = "Premature mortality by SIMD quintile plot",
              content = tags$ul(tags$li("This is a plot for the trend in age-standardised all-cause mortality rates for people under 75 by SIMD quintile in Scotland."),
                                tags$li("The x axis is the year, starting from 2008."),
                                tags$li("The y axis is the age-standardised rate per 100,000 population."),
                                tags$li("The lines refer to the trend in age-standardised all-cause mortality rates for each SIMD quintile.")
              )
)

output$premature_mortality_hb_plot <- renderPlotly({

  geog <- input$premature_mortality_geog_name

  title <- glue("European age-standardised rate (EASR) for all-cause premature mortality per 100,000 population \n ",
                "in ", geog)

  plot <- premature_mortality_all_cause %>%
    filter(geography == input$premature_mortality_geog_name) %>%
    confidence_line_function_pm(., y_title = "EASR of deaths per 100,000<br>population",
                                x_title = "Year", title = title) %>%
    layout(legend = list(y = -0.4),
           xaxis = list(dtick = 1))

})


output$premature_mortality_hb_comp_plot <- renderPlotly({

  title <- glue("European age-standardised rate (EASR) for all-cause premature mortality per 100,000 population \n ",
                "in ", input$premature_mortality_geog_name)

  plot <- premature_mortality_all_cause %>%
    comparison_data(geog_name = input$premature_mortality_geog_name) %>%
    make_line_chart_multi_lines(x = .$date, y = .$indicator, colour = .$geography,
                                y_axis_title = "EASR of deaths per 100,000<br>population", title = title)


})

output$premature_mortality_simd_plot <- renderPlotly({

  title <- glue("European age-standardised rate (EASR) for all-cause premature mortality per 100,000 population \n ",
                "by SIMD quintile in Scotland")

  plot <- premature_mortality_all_cause_simd %>%
    mutate(simd = substr(simd, 14, nchar(simd))) %>%
    mutate(simd = sub('\\(', '\\- ', simd)) %>%
    mutate(simd = sub('\\)', '', simd)) %>%
    make_line_chart_multi_lines(x = .$date, y = .$indicator,
                                colour = .$simd,
                                title = title,
                                y_axis_title = "EASR of deaths per 100,000<br>population",
                                x_axis_title = "Year") %>%
    layout(legend = list(y = -0.4))

})

observeEvent(input$spremature_mortality_tabBox, {



  title <- ifelse(input$spremature_mortality_tabBox == "Geography",
                  glue("Data table: European age-standardised all-cause premature mortality rates per 100,000 population "),
                  glue("Data table: European age-standardised all-cause premature mortality
                           rates per 100,000 population by SIMD quintile in Scotland"))

  output$premature_mortality_title <- renderUI(h3(title))



  # output$premature_mortality_hb_title <- renderUI({h3(glue("Data table: European age-standardised all-cause premature mortality rates per 100,000 population ",
  #                                                          "in ", input$premature_mortality_geog_name))})

  observeEvent(input$premature_mortality_geog_name,{

    data_unfiltered <- premature_mortality_all_cause %>%
      arrange(desc(date)) %>%
      mutate(date = factor(date)) %>%
      select(c(date, geography_type, geography, indicator,
               lower_confidence_interval, upper_confidence_interval)) %>%
      rename(`European age-standardised all-cause premature mortality rate per 100,000 population` = "indicator",
             "Year" = "date")

    data_filtered <- data_unfiltered %>%
      comparison_data(geog_name = input$premature_mortality_geog_name)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "premature_mortality_hb", filename = "all_cause_premature_mortality_by_health_board",
                       add_separator_cols_1dp = c(4,5,6))

  })

})

premature_mortality_all_cause_simd %>%
  mutate(simd = substr(simd, 14, nchar(simd))) %>%
  mutate(simd = sub('\\(', '\\- ', simd)) %>%
  mutate(simd = sub('\\)', '', simd)) %>%
  arrange(desc(date)) %>%
  mutate(date = factor(date),
         simd = factor(simd)) %>%
  select(c(date, simd, indicator,
           lower_confidence_interval, upper_confidence_interval)) %>%
  rename(`European age-standardised all-cause premature mortality rate per 100,000 population` = "indicator",
         "Year" = "date",
         `SIMD Quintile` = simd) %>%
  dataDownloadServer(id = "premature_mortality_simd", filename = "all_cause_premature_mortality_by_SIMD",
                     add_separator_cols_1dp = c(3,4,5))


##############################################.
# ALL-CAUSE MORTALITY (15-44)----
##############################################.

observeEvent(input$all_cause_mortality_geog_type,
             {
               areas <- all_cause_mortality %>%
                 filter(geography_type == input$all_cause_mortality_geog_type)

               updateSelectizeInput(session,
                                    "all_cause_mortality_geog_name",
                                    "Step 2. Select national or local geography area",
                                    choices = unique(areas$geography))
             })


altTextServer("all_cause_mortality_alt",
              title = "All-cause mortality plot",
              content = tags$ul(tags$li("This is a plot for the trend in all-cause mortality for people between the ages of 15-44."),
                                tags$li("The x axis is the year, starting from 1997."),
                                tags$li("If in the choice above the plot labelled `Step 3`, `Rate` is chosen, then the y axis is the rate per 100,000 population.",
                                        "The purple line indicates the trend in rate of all-cause mortality."),
                                tags$li("If in the choice above the plot labelled `Step 3`, `Number` is chosen, then the y axis is the total number of deaths.",
                                        "The purple line indicates the trend in number of all-cause mortality."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland.")

              )
)


output$all_cause_mortality_plot = renderPlotly({


  title <- glue("All-cause mortality for ages 15-44 in ",
                input$all_cause_mortality_geog_name)


  data = all_cause_mortality %>%
    filter(geography_type == input$all_cause_mortality_geog_type,
           geography == input$all_cause_mortality_geog_name,
           indicator_age == "15 to 44",
           year %in%  c("2008", "2009", "2010", "2011","2012","2013","2014","2015","2016","2017","2018","2019","2020", "2021")) %>%
    group_by(year) %>%
    summarise(pop = sum(pop), deaths = sum(deaths)) %>%
    mutate(rate = deaths/pop*100000,
           date = year)

  if (input$all_cause_mortality_rate_number == "Rate") {
    data %<>%
      mutate(indicator = rate)

    indicator_y = "Rate of deaths <br>per 100,000 population"
  } else if (input$all_cause_mortality_rate_number == "Number") {
    data %<>%
      mutate(indicator = deaths)

    indicator_y = "Total number of deaths"
  }


  line_chart_function(data, indicator_y,
                      title = title,
                      label = ifelse(input$all_cause_mortality_rate_number == "Rate", "Rate of death", "Number of deaths")) %>%
    layout(yaxis=list(tickformat=","),
           xaxis = list(tickangle = -30))

})


observeEvent(input$all_cause_mortality_geog_name,{

  data_unfiltered <- all_cause_mortality %>%
    filter(indicator_age == "15 to 44",
           year %in%  c("2008", "2009", "2010", "2011","2012","2013","2014","2015","2016","2017","2018","2019","2020", "2021"))  %>%
    group_by(year, geography_type, geography) %>%
    summarise(pop = sum(pop), deaths = sum(deaths)) %>%
    ungroup() %>%
    mutate(rate = deaths/pop*100000) %>%
    select(year, geography_type, geography, deaths, rate) %>%
    arrange(year) %>%
    mutate(year = factor(year)) %>%
    rename("Number of deaths" = "deaths",
           "Rate of deaths per 100,000 population" = "rate")

  data_filtered <- data_unfiltered %>%
    filter(geography == input$all_cause_mortality_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "all_cause_mortality", filename = "all_cause_mortality",
                     add_separator_cols = c(4),
                     add_separator_cols_2dp = c(5))
})

observeEvent(input$all_cause_mortality_geog_name,{

  output$all_cause_mortality_title <- renderUI({h3(glue("Data table: Total number and rate of all-cause deaths for ages 15-44 in ",
                                                        input$all_cause_mortality_geog_name))})
})



##############################################.
# CORONARY HEART DISEASE (CHD) DEATHS (45-74)----
##############################################.

observeEvent(input$chd_deaths_geog_type,
             {

               areas <- chd_deaths %>%
                 filter(geography_type == input$chd_deaths_geog_type)

               updateSelectizeInput(session,
                                    "chd_deaths_geog_name",
                                    "Step 2. Select national or local geography area",
                                    choices = unique(areas$geography))
             })


output$chd_deaths_plot = renderPlotly({
  title <- glue("Age-sex standardised rates of CHD deaths (under 75) per 100,000 population in ",
                input$chd_deaths_geog_name)
  data = chd_deaths %>%
    filter(geography_type == input$chd_deaths_geog_type,
           geography == input$chd_deaths_geog_name,
           year_range %in%  c("2008-2010", "2009-2011","2010-2012", "2011-2013",
                              "2012-2014", "2013-2015","2014-2016","2015-2017",
                              "2016-2018", "2017-2019", "2018-2020")) %>%
    rename(date = year_range) %>%
    confidence_line_function(., y_title = "Age-sex standardised<br>rate of deaths per<br>100,000 population", title = title) %>%
    layout(xaxis = list(tickangle = -30),
           legend = list(y = -0.5))
})


observeEvent(input$chd_deaths_geog_type,{
  observeEvent(input$chd_deaths_geog_name,{

    data_unfiltered <- chd_deaths %>%
      select(year_range, area_type, area_name, measure,
             lower_confidence_interval, upper_confidence_interval) %>%
      filter(year_range %in%  c("2008-2010", "2009-2011","2010-2012", "2011-2013",
                                "2012-2014", "2013-2015","2014-2016","2015-2017",
                                "2016-2017", "2017-2019", "2018-2020")) %>%
      arrange(year_range) %>%
      mutate(year_range = factor(year_range)) %>%
      rename("geography_type" = "area_type",
             "geography" = "area_name",
             "Rate of death per 100,000 population" = "measure") #Rate of CHD deaths per 100,000 (age 45-74)

    data_filtered <- data_unfiltered %>%
      filter(geography_type == input$chd_deaths_geog_type) %>%
      filter(geography == input$chd_deaths_geog_name)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "chd_deaths", filename = "chd_deaths",
                       add_separator_cols_2dp = c(4,5,6))
  })
})

observeEvent(input$chd_deaths_geog_name,{

  output$chd_deaths_title <- renderUI({h3(glue("Data table:Age-sex standardised rates of CHD deaths (under 75) per 100,000 population in",
                                               input$chd_deaths_geog_name))})
})

altTextServer("chd_deaths_alt",
              title = "Coronary heart disease deaths plot",
              content = tags$ul(tags$li("This is a plot for the trend in age-sex standardised rates per 100,000 of coronary heart disease deaths in under 75 year olds."),
                                tags$li("The x axis is the 3 year range, starting from 2002-2004."),
                                tags$li("The y axis is the age-sex standardised rate per 100,000 population."),
                                tags$li("The solid purple line is the specified rate and the lighter purple area around",
                                        "the line indicates the confidence interval."),
                                tags$li("The bottom of the light purple shaded area represents the lower confidence interval and the top of the",
                                        "area represents the upper confidence interval."),
                                tags$li("Since the data began there has been a general downwards trend."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland.")

              )
)

##############################################.
# FIRST EVER HOSPITAL ADMISSION FOR HEART ATTACK (<75)----
##############################################.

output$hospital_admission_heart_attack_plot <- renderPlotly({

  title <- "First ever hospital admission for heart attack (under 75) annually in Scotland"
  label <- ifelse(input$hospital_admission_heart_attack_rate_number == "Rate", "Rate", "Number")
  y_title <- ifelse(input$hospital_admission_heart_attack_rate_number == "Rate", "EASR per 100,000 population",
                    "Total number of hospital <br> admissions")

  if(input$hospital_admission_heart_attack_rate_number == "Rate") {

    data <- heart_attack %>%
      mutate(indicator = rate_per_100_000_easr)
  } else {

    data <- heart_attack %>%
      mutate(indicator = total_admissions)
  }

  p <- data %>%
    line_chart_function(y_title = y_title, label = label, title = title) %>%
    layout(yaxis=list(tickformat=","),
           xaxis = list(dtick = 1, tickangle = -30))

})

heart_attack %>%
  select(date, total_admissions, rate_per_100_000_easr) %>%

  arrange(date) %>%
  mutate(date = factor(date)) %>%
  rename("Year" = "date",
         "Total number of hospital admissions" = "total_admissions",
         "EASR per 100,000 population" = "rate_per_100_000_easr") %>%
  dataDownloadServer(id = "heart_attack_admission",
                     filename = "first_ever_hospital_admission_heart_attack",
                     add_separator_cols = c(2),
                     add_separator_cols_1dp = c(3))


altTextServer("hospital_admission_heart_attack_alt",
              title = "First ever hospital admissions for heart attack plot",
              content = tags$ul(tags$li("This is a plot for the trend in first ever hospital admissions for heart attacks for people aged under 75 in Scotland."),
                                tags$li("The x axis is year, starting in 2008"),
                                tags$li("If in the choice above the plot `Rate` is chosen, then the y axis is the European Age-Standerdised Rate (EASR) per 100,000 population.",
                                        "The purple line indicates the trend in EASR per 100,000 population of first ever hopsital admissions for heart attack."),
                                tags$li("If in the choice above the plot `Number` is chosen, then the y axis is the total number of first ever hospital admissions",
                                        "The purple line indicates the trend in the number of first ever hospital admissions."),
                                tags$li("The y axis total number."),
                                tags$li("The solid purple line shows the trend in number of hospital admissions.")
              )
)


##############################################.
# DRUGS: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
##############################################.

##############################################.
# DRUG RELATED HOSPITAL ADMISSIONS ----
##############################################.


altTextServer("drug_admissions_alt",
              title = "Drug admissions plot",
              content = tags$ul(tags$li("This is a plot for the age-sex standardised rate of drug-related",
                                        "hospital admissions per 100,000 population."),
                                tags$li("The x axis is the financial year starting from 1996/97."),
                                tags$li("The y axis is the rate per 100,000 population."),
                                tags$li("The drop down above the chart allows you to choose which age groups you wish",
                                        "to visualise on the plot. The default is `All age groups`."),
                                tags$li("The line(s) refer to the rate per 100,000 for each selected age group.")
              )
)

output$drug_admissions_plot = renderPlotly({

  if(length(input$drug_admissions_age) != 1){
    age_title <- "by age"
  } else if (input$drug_admissions_age == "All age groups") {
    age_title <- "all age groups"
  } else {
    age_title <- paste0("ages ", input$drug_admissions_age)
  }

  title <- glue("Age-sex standardised rates per 100,000 of drug-related hospital admissions (",
                age_title, ") in Scotland")

  data = drug_stays %>%
    filter(age_group %in% input$drug_admissions_age) %>%
    mutate(indicator = round_half_up(rate,1),
           date = financial_year) %>%

    make_line_chart_multi_lines(x = .$date, y = .$indicator,
                                colour = .$age_group,
                                title = title,
                                y_axis_title = "Age-sex standardised<br> rate per 100,000 population",
                                x_axis_title = "Financial year") %>%
    layout(xaxis = list(tickangle = -30),
           legend = list(y = -0.4))

})



observeEvent(input$drug_admissions_age,{

  data_unfiltered <- drug_stays %>%
    mutate(rate = round_half_up(rate,1)) %>%
    select(financial_year, age_group, rate) %>%
    arrange(financial_year) %>%
    mutate(financial_year = factor(financial_year)) %>%
    rename("Drug-related hospital admissions rate" = "rate")

  data_filtered <- data_unfiltered %>%
    filter(age_group %in% input$drug_admissions_age)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "drug_admissions", filename = "drug_admissions")
})

observeEvent(input$drug_admissions_age,{

  if(length(input$drug_admissions_age) != 1){
    age_title <- "by age"
  } else if (input$drug_admissions_age == "All age groups") {
    age_title <- "all age groups"
  } else {
    age_title <- paste0("ages ", input$drug_admissions_age)
  }

  output$drug_admissions_title <- renderUI({h3(glue("Data table: Age-sex standardised rates per 100,000 of drug-related hospital admissions (",
                                                    age_title, ") in Scotland"))})
})




##############################################.
# DRUG RELATED DEATHS----
##############################################.

observeEvent(input$drug_deaths_geog_type,
             {

               data <- drug_related_deaths %>%
                 filter(geography_type == input$drug_deaths_geog_type)

               updateSelectizeInput(session,
                                    "drug_deaths_geog_name",
                                    "Step 2. Select a national or local geography area",
                                    choices = unique(data$geography))
             })

altTextServer("drug_deaths_alt",
              title = "Drug-related deaths plot",
              content = tags$ul(tags$b("If in the above choice labelled `Step 3`, `Rate` has been chosen, then the plot description is as follows: "),
                                tags$li("This is a plot for the age-standardised drug-related deaths rate per 100,000 population."),
                                tags$li("Rates based on fewer than 10 deaths not shown."),
                                tags$li("The x axis are the 5 year ranges."),
                                tags$li("The y axis is the age standardised rate per 100,000."),
                                tags$li("The solid purple line is the specified rate and the lighter purple area around",
                                        "the line indicates the confidence interval."),
                                tags$li("The bottom of the light purple shaded area represents the lower confidence interval and the top of the",
                                        "area represents the upper confidence interval."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland."),
                                br(),
                                tags$b("If in the above choice labelled `Step 3`, `Number` has been chosen, then the plot description is as follows: "),
                                tags$li("This is a plot for the number of drug-related deaths."),
                                tags$li("The x axis are the 5 year ranges."),
                                tags$li("The y axis is the total number of deaths."),
                                tags$li("The solid purple line indicates the trend in number of deaths."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland.")))


output$drug_deaths_plot = renderPlotly({

  title_rate <- glue("Age-standardised rates per 100,000 of drug-related deaths in ",
                     input$drug_deaths_geog_name)

  title_number <- glue("Number of drug-related deaths in ",
                       input$drug_deaths_geog_name)


  if (input$drug_deaths_rate_number == "Rate") {
    drug_related_deaths %>%
      mutate(date = year) %>%
      filter(#geography_type == input$drug_deaths_geog_type,
        geography == input$drug_deaths_geog_name) %>%
      confidence_line_function(., "Age-standardised rate of deaths <br> per 100,000 population", title = title_rate) %>%
      layout(xaxis = list(tickangle = -60),
             legend = list(y = -0.7))
  } else if (input$drug_deaths_rate_number == "Number") {
    drug_related_deaths %>%
      mutate(date = year, indicator = number) %>%
      filter(#geography_type == input$drug_deaths_geog_type,
        geography == input$drug_deaths_geog_name) %>%
      line_chart_function(., "Total number of deaths", title = title_number) %>%
      layout(xaxis = list(tickangle = -30,
                          title = "Year"),
             yaxis = list(tickformat=","))

  }
})

#observeEvent(input$drug_deaths_geog_type,{
observeEvent(input$drug_deaths_geog_name,{

  data_unfiltered <- drug_related_deaths %>%
    select(year, geography_type, geography, number, rate,
           lower_confidence_interval, upper_confidence_interval) %>%
    arrange(year) %>%
    mutate(year = factor(year)) %>%
    rename("Year range" = "year",
           "Number of drug-related deaths" = "number",
           "Drug-related deaths rate" = "rate")

  data_filtered <- data_unfiltered %>%
    filter(#geography_type == input$drug_deaths_geog_type,
      geography == input$drug_deaths_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "drug_deaths", filename = "drug_deaths",
                     add_separator_cols = c(4),
                     add_separator_cols_1dp = c(5,6,7))
})
#})

observeEvent(input$drug_deaths_geog_name,{

  output$drug_deaths_title <- renderUI({h3(glue("Data table: Number and age standardised rates per 100,000 of drug-related deaths in ",
                                                input$drug_deaths_geog_name))})
})

##############################################.
# ALCOHOL: DEATHS AND FIRST HOSPITAL ADMISSIONS ----
##############################################.

##############################################.
# ALCOHOL-RELATED HOSPITAL ADMISSIONS ----
##############################################.
observeEvent(input$alcohol_admissions_geog_type,
             {

               alcohol_filtered = alcohol_admissions %>%
                 filter(geography_type == input$alcohol_admissions_geog_type)

               updateSelectizeInput(session, "alcohol_admissions_geog_name",
                                    choices = unique(alcohol_filtered$geography))
             })

altTextServer("alcohol_admissions_alt",
              title = "Drug-related deaths plot",
              content = tags$ul(tags$li("This is a plot for the european age-sex standardised alocohol-related hospital admissions rate per 100,000 population."),
                                tags$li("The x axis is financial year."),
                                tags$li("The y axis is the european age-sex standardised rate per 100,000 population."),
                                tags$li("The solid purple line is the rate."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland.")))

output$alcohol_admissions_plot = renderPlotly({

  title <- glue("European age-sex standardised rate (EASR) per 100,000 population of alcohol-related admissions in ",
                input$alcohol_admissions_geog_name)

  data_alc = alcohol_admissions %>%
    arrange(financial_year) %>%
    filter(geography == input$alcohol_admissions_geog_name,
           condition == "All alcohol conditions",
           smr_type == "Combined") %>%
    rename(date = "financial_year",
           indicator = "stays_easr")

  line_chart_function(data_alc, y_title = "EASR per 100,000 population", x_title = "Financial year",
                      title = title, label = "Rate") %>%
    layout(xaxis = list(tickangle = -30))

})

observeEvent(input$alcohol_admissions_geog_name,{

  data_unfiltered <- alcohol_admissions %>%
    arrange(financial_year) %>%
    filter(condition == "All alcohol conditions",
           smr_type == "Combined") %>%
    mutate(financial_year = factor(financial_year)) %>%
    select(financial_year, geography_type, geography, stays_easr) %>%
    rename("Alcohol-related hospital admissions rate" = "stays_easr")

  data_filtered <- data_unfiltered %>%
    filter(geography == input$alcohol_admissions_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "alcohol_related_admissions", filename = "alcohol_related_admissions",
                     add_separator_cols_1dp = c(4))

})

observeEvent(input$alcohol_admissions_geog_name,{

  output$alcohol_admissions_title <- renderUI({h3(glue("Data table: European age-sex standardised rate per 100,000 population of alcohol-related admissions in ",
                                                       input$alcohol_admissions_geog_name))})
})



##############################################.
# ALCOHOL-SPECIFIC DEATHS ----
##############################################.

altTextServer("alcohol_deaths_sex_alt",
              title = "Alcohol-specific rate of deaths plot",
              content = tags$ul(tags$li("This is a plot for the age-standerdised drug-related deaths rate per 100,000 population."),
                                tags$li("The x axis is year."),
                                tags$li("The y axis is the age-sex standardised rate per 100,000 population."),
                                tags$li("The solid purple line is the specified rate and the lighter purple area around",
                                        "the line indicates the confidence interval."),
                                tags$li("The bottom of the light purple shaded area represents the lower confidence interval and the top of the",
                                        "area represents the upper confidence interval."),
                                tags$li("The dropdown above the plot indicates which sex the plot is showing, the choices are",
                                        "'All sexes', 'Female' and 'Male'. The default is 'All sexes'.")))

# death sex plot
output$alcohol_deaths_sex_plot = renderPlotly({


  title <- glue("Age-sex standardised death rates of ",
                str_to_lower(input$alcohol_deaths_sex),
                ifelse(input$alcohol_deaths_sex == "All sexes", "", "s"),
                "  per 100,000 population",
  )


  data = alcohol_deaths %>%
    filter(sex == input$alcohol_deaths_sex) %>%
    rename("lower_confidence_interval" = lower_ci,
           "upper_confidence_interval" = upper_ci,
           "date" = year,
           "indicator" = rate) %>%
    confidence_line_function(y_title = "Age-sex standardised rate of deaths <br> per 100,000 population",
                             x_title = "Year",
                             title=title) %>%
    layout(xaxis = list(dtick = 1, tickangle = -30))

})

altTextServer("alcohol_deaths_age_alt",
              title = "Alcohol-specific rate of deaths by age plot",
              content = tags$ul(tags$li("This is a plot for the age-standerdised drug-related deaths rate per 100,000 population."),
                                tags$li("The x axis is year."),
                                tags$li("The y axis is the age-sex standardised rate per 100,000 population."),
                                tags$li("There are five lines showing the five age breakdowns: '10-24', '25-44', '45'64', '65-75' and '75+'."),
                                tags$li("The dropdown above the previous plot indicates which sex the plot is showing, the choices are",
                                        "'All sexes', 'Female' and 'Male'. The default is 'All sexes' .")
              ))

# age background plot
output$alcohol_deaths_age_plot = renderPlotly({

  title <- glue("Age-sex standardised death rates of ",
                str_to_lower(input$alcohol_deaths_sex),
                ifelse(input$alcohol_deaths_sex == "All sexes", "", "s"),
                "  per 100,000 population by age group")

  data = alcohol_deaths_by_age %>%
    filter(sex == input$alcohol_deaths_sex) %>%

    make_line_chart_multi_lines(., x = .$year, y = .$indicator,
                                colour = .$age_group,
                                y_axis_title = "Age-sex standardised rate of deaths <br> per 100,000 population",
                                title=title) %>%
    layout(xaxis = list(dtick = 1, tickangle = -30))

})

observeEvent(input$alcohol_deaths_tabBox, {
  observeEvent(input$alcohol_deaths_sex,{

    title_start <- glue("Age-sex standardised death rates of ",
                        str_to_lower(input$alcohol_deaths_sex),
                        ifelse(input$alcohol_deaths_sex == "All sexes", "", "s"),
                        "per 100,000 population")

    title_end <- ifelse(input$alcohol_deaths_tabBox == "Rate for all ages",
                        "", " by age group")

    output$alcohol_deaths_title <- renderUI({

      title <- h3(glue(title_start, title_end))

    })

  })

})

observeEvent(input$alcohol_deaths_sex,{

  data_unfiltered_sex <- alcohol_deaths %>%
    select("Year"=year,
           "Sex"=sex,
           "Alcohol-specific death rate"=rate,
           "Lower confidence interval"=lower_ci,
           "Upper confidence interval"=upper_ci
    ) %>%
    arrange(Year) %>%
    mutate(Year = factor(Year))


  data_filtered_sex <- data_unfiltered_sex %>%
    filter(Sex == input$alcohol_deaths_sex)

  data_unfiltered_age <- alcohol_deaths_by_age %>%
    select("Year"=year,
           "Sex"=sex,
           "Age group" = age_group,
           "Alcohol-specific death rate"=indicator
    ) %>%
    arrange(Year) %>%
    mutate(Year = factor(Year))

  data_filtered_age <- data_unfiltered_age %>%
    filter(Sex == input$alcohol_deaths_sex)

  dataDownloadServer(data = data_filtered_sex, data_download = data_unfiltered_sex,
                     id = "alcohol_deaths_sex", filename = "alcohol_deaths",
                     add_separator_cols_1dp = c(3,4,5))

  dataDownloadServer(data = data_filtered_age, data_download = data_unfiltered_age,
                     id = "alcohol_deaths_age", filename = "alcohol_deaths_by_age",
                     add_separator_cols_2dp = c(4))
})


##############################################.
# HEALTHY BIRTHWEIGHT----
##############################################.
observeEvent(input$healthy_birthweight_geog_type,
             {

               birthweight_data <- birthweight %>%
                 filter(geography_type == input$healthy_birthweight_geog_type)

               updateSelectizeInput(session,
                                    "healthy_birthweight_geog_name",
                                    "Step 2. Select a national or local geography area",
                                    choices = unique(birthweight_data$geography))
             })


altTextServer("healthy_birthweight_alt",
              title = "Healthy birthweight plot",
              content = tags$ul(tags$li("This is a stacked bar plot showing the babies in each birthweight category based on gestational age"),
                                tags$li("The x axis is the financial year, starting from 2008/09."),
                                tags$li("The y axis is the percentage."),
                                tags$li("The legend shows 4 categories: `Not applicable`, `Large`, `Appropriate` ",
                                        " and `Small`. These are represented on the bar plot in the same order from top to bottom."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland.")
              )
)

output$healthy_birthweight_plot = renderPlotly({

  title <- glue("Birthweight of babies based on gestational age in ",
                input$healthy_birthweight_geog_name)

  birthweight %>%
    mutate(date = financial_year,
           birthweight_for_gestational_age = factor(birthweight_for_gestational_age, levels = c("Small", "Appropriate", "Large", "Not Applicable"))) %>%
    filter(geography == input$healthy_birthweight_geog_name, geography_type == input$healthy_birthweight_geog_type) %>%
    stacked_bar_function(., .$birthweight_for_gestational_age, title = title) %>%
    layout(xaxis = list(tickangle = -30),
           legend = list(y = -0.4))
})

observeEvent(input$healthy_birthweight_geog_name,{

  data_unfiltered <- birthweight %>%
    arrange(financial_year) %>%
    mutate(percentage = round_half_up(proportion*100,1)) %>%
    select(financial_year, geography_type, geography,
           birthweight_for_gestational_age, percentage) %>%
    filter(financial_year %in%  c("2008/09", "2009/10","2010/11","2011/12", "2012/13", "2013/14","2014/15",
                                  "2015/16","2016/17","2017/18","2018/19","2019/20")) %>%
    mutate(financial_year = factor(financial_year),
           birthweight_for_gestational_age = factor(birthweight_for_gestational_age)) %>%
    rename("Percentage of babies (%)" = "percentage")

  data_filtered <- data_unfiltered %>%
    filter(geography == input$healthy_birthweight_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "healthy_birthweight", filename = "healthy_birthweight",
                     add_percentage_cols = c(5))

})

observeEvent(input$healthy_birthweight_geog_name,{

  output$healthy_birthweight_title <- renderUI({h3(glue("Data table: Birthweight of babies based on gestational age in ",
                                                        input$healthy_birthweight_geog_name))})
})


##############################################.
#  SELF-ASSESSED HEALTH OF ADULTS (16+)----
##############################################.

altTextServer("adult_self_assessed_health_alt",
              title = "Self-assessed health of adults plot",
              content = tags$ul(tags$li("This is a plot for the trend in percentage of adults who describe their health in general as 'good' or 'very good'."),
                                tags$li("The x axis is the year, starting from 2008."),
                                tags$li("The y axis is the percentage of adults."),
                                tags$li("The solid purple line is the percentage of adults for each year.")

              )
)

output$adult_self_assessed_health_plot <- renderPlotly({

  title<- "Percentage of adults in Scotland who describe their general health as 'good' or 'very good'"

  plot <- adult_self_assessed_health %>%
    mutate(indicator = round(as.integer(indicator), 1),
           date = Year) %>%
    line_chart_function(., y_title = "Percentage (%)", label = "Percentage", title = title)%>%
    layout(yaxis = yaxis_proportion)

})



adult_self_assessed_health %>%
  select(c(Year, indicator)) %>%
  mutate(indicator = round(as.integer(indicator), 1)) %>%
  mutate(Year = factor(Year)) %>%
  rename("Percentage of adults who describe their general health as 'good' or 'very good' (%)" = "indicator") %>%
  arrange(desc(Year)) %>%
  dataDownloadServer(id = "adult_self_assessed_health",
                     filename = "adult_self_assessed_health")


##############################################.
#  LIMITING LONG-TERM CONDITIONS (16+)----
##############################################.

altTextServer("adult_long_term_condition_alt",
              title = "Adults living with limiting long-term conditions plot",
              content = tags$ul(tags$li("This is a plot for the trend in percentage of adults living with a limiting long-term condition in Scotland."),
                                tags$li("The x axis is the year, starting from 2008."),
                                tags$li("The y axis is the percentage of adults."),
                                tags$li("The solid purple line is the percentage of adults for each year.")

              )
)

output$adult_long_term_condition_plot <- renderPlotly({

  title <- "Percentage of adults with a limiting long-term condition in Scotland"

  plot <- adult_living_limiting_long_term_condition %>%
    mutate(indicator = round(as.integer(indicator), 1),
           date = Year) %>%
    line_chart_function(., y_title = "Percentage (%)", label = "Percentage", title = title)%>%
    layout(yaxis = yaxis_proportion,
           xaxis = list(dtick = 1))

})



adult_living_limiting_long_term_condition %>%
  select(c(Year, indicator)) %>%
  mutate(indicator = round(as.integer(indicator), 1)) %>%
  mutate(Year = factor(Year)) %>%
  rename("Percentage of adults with a limiting long-term condition (%)" = "indicator") %>%
  arrange(desc(Year)) %>%
  dataDownloadServer(id = "limiting_ltcs",
                     filename = "limiting_long_term_conditions")

##############################################.
# ADMISSIONS FOR ASTHMA----
##############################################.
# observeEvent(input$asthma_admissions_breakdowns,
#
#         if(input$asthma_admissions_breakdowns == "Age and sex breakdown"){
#
#           output$asthma_admissions_years_ui <- renderUI(
#
#             pickerInput("asthma_admissions_years",
#                         "Year breakdown",
#                         choices = unique(asthma_admissions$Date))
#             )
#         }
# )


observeEvent(input$asthma_admissions_geog_type,
             {

               asthma_filtered = asthma_admissions %>%
                 filter(geography_type == input$asthma_admissions_geog_type)


               updateSelectizeInput(session, "asthma_admissions_geog_name",
                                    choices = unique(asthma_filtered$geography))#,
               #selected = "")
             })



output$asthma_admissions_plot <- renderPlotly({

  geog <- input$asthma_admissions_geog_name

  if(input$asthma_admissions_breakdowns == "Yearly total"){

    breakdown <- ""

  } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

    breakdown <- "by age "


  } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

    breakdown <- "by sex "
  }

  title <- glue("Total number of asthma-related hospital admissions ",
                breakdown, "in \n ", geog)

  if(input$asthma_admissions_breakdowns == "Yearly total"){

    plot <- asthma_admissions %>%
      filter(sex == "All Sexes", age_bands == "All Ages", geography == input$asthma_admissions_geog_name) %>%
      mutate(indicator = round(as.integer(indicator), 1)) %>%
      line_chart_function(., y_title = "Total number of admissions",
                          x_title = "Financial year", title = title,
                          label = "Number of admissions")%>%
      layout(yaxis=list(tickformat=","))



  } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

    plot <- asthma_admissions %>%
      filter(sex == "All Sexes", geography == input$asthma_admissions_geog_name) %>%
      filter(!(age_bands %in% c("All Ages", "65+", "75+", "85+", "<18"))) %>%
      arrange(age_bands) %>%
      mutate(indicator = round(as.integer(indicator), 1)) %>%
      # make_line_chart_multi_lines(x= .$date, y = .$indicator, colour = .$age_group,
      #                             x_axis_title = "Financial year", y_axis_title = "Total number of admissions",
      #                             title = title)%>%
      mode_bar_plot(x = .$date, y = .$indicator, category_var = .$age_bands,
                    xaxis_title = "Year range", yaxis_title = "Total number of admissions",
                    title = title, mode = "stack") %>%
      layout(yaxis=list(tickformat=","))



  } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

    plot <- asthma_admissions %>%
      filter(age_bands == "All Ages", geography == input$asthma_admissions_geog_name, sex != "All Sexes") %>%
      mutate(indicator = round(as.integer(indicator), 1)) %>%
      # make_line_chart_multi_lines(x= .$date, y = .$indicator, colour = .$sex,
      #                             x_axis_title = "Financial year", y_axis_title = "Total number of admissions",
      #                             title = title)%>%
      mode_bar_plot(x = .$date, y = .$indicator, category_var = .$sex,
                    xaxis_title = "Year range", yaxis_title = "Total number of admissions",
                    title = title, mode = "stack") %>%
      layout(yaxis=list(tickformat=","))


    # } else if(input$asthma_admissions_breakdowns == "Age and sex breakdown"){
    #
    #   plot <- asthma_admissions %>%
    #     filter(Sex != "All Sexes", geography_type == "All", Date == input$asthma_year_choices) %>%
    #     filter(!(Ages %in% c("All Ages", "65+", "75+", "85+", "90+", "<18"))) %>%
    #     mutate(indicator = round(as.integer(indicator), 1),
    #            date = Date) %>%
    #     mode_bar_plot(x = .$Ages, y=.$indicator, category_var = .$Sex)
  }

})



observeEvent(input$asthma_admissions_breakdowns,{
  observeEvent(input$asthma_admissions_geog_name,{

    data_unfiltered <- asthma_admissions %>%
      arrange(desc(date)) %>%
      mutate(provisional = ifelse(provisional == "1", "p", ""),
             date = factor(date),
             sex = factor(sex),
             age_bands = factor(age_bands)) %>%
      select(c(date, geography_type, geography, sex, age_bands, indicator, provisional)) %>%
      rename(`Total number of admissions` = "indicator",
             "Year" = "date",
             "Is data provisional (p)?" = "provisional")

    if(input$asthma_admissions_breakdowns == "Yearly total"){

      data_filtered <- data_unfiltered %>%
        filter(sex == "All Sexes", age_bands == "All Ages",
               geography == input$asthma_admissions_geog_name)

    } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

      data_filtered <- data_unfiltered %>%
        filter(sex == "All Sexes",
               geography == input$asthma_admissions_geog_name) %>%
        filter(!(age_bands %in% c("All Ages", "65+", "75+", "85+", "90+", "<18")))


    } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

      data_filtered <- data_unfiltered %>%
        filter(age_bands == "All Ages",
               geography == input$asthma_admissions_geog_name)
    }

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "asthma_admissions", filename = "asthma_admissions",
                       add_separator_cols = c(6))

  })
})

observeEvent(input$asthma_admissions_breakdowns,{
  observeEvent(input$asthma_admissions_geog_name,{

    geog <- input$asthma_admissions_geog_name

    if(input$asthma_admissions_breakdowns == "Yearly total"){

      breakdown <- ""

    } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

      breakdown <- "by age "


    } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

      breakdown <- "by sex "
    }

    output$asthma_admissions_title <- renderUI({h3(glue("Data table: Total number of asthma-related hospital admissions ",
                                                        breakdown, "in ", geog))})
  })
})


altTextServer("asthma_admissions_alt",
              title = "Asthma admissions plot",
              content = tags$ul(tags$li("This is a plot for the number of admissions for asthma."),
                                tags$li("The x axis shows the financial year."),
                                tags$li("The y axis shows the total number of admissions."),
                                tags$li("Data is based on date of discharge."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland."),
                                tags$li("For the plot visualising the yearly total, the purple line shows the total number of admissions for each financial year."),
                                tags$li("For the plot visualising the age breakdown, the lines correspond to each age group consisting of 5 year age bands up to 90 years,",
                                        "after which data is grouped for 90+."),
                                tags$li("For the plot visualising sex breakdown, the purple line corresponds to `All sexes`, the blue line corresponds to `Females`",
                                        "and the grey line corresponds to `Males`. Each line shows the total number of admissions for each financial year for each sex.")


              )
)


##############################################.
# SCREENING UPTAKE FOR BREAST AND BOWEL CANCER----
##############################################.

######### BREAST ############

screening_breast_years <- unique(screening_breast_board %>% arrange(year_range) %>% .$year_range)

altTextServer("screening_breast_board_alt",
              title = "Breast screening by health board plot",
              content = tags$ul(tags$li("This is a plot for the three year rolling average percentage uptake of breast screening by health board."),
                                tags$li("The x axis shows the health board, including Scotland."),
                                tags$li("The y axis shows the percentage uptake."),
                                tags$li("Percentage uptake is a three year rolling average where the years begin on the 1st April and end on the 31st March."),
                                tags$li("Each health board has three corresponding bars which refer to the most recent three year periods",
                                        "From left to right, the colours go from dark blue to light blue and correspond to the periods:",
                                        screening_breast_years[1],",", screening_breast_years[2], ",", screening_breast_years[3],".")
              )
)

output$screening_breast_board_plot <- renderPlotly({

  screening_breast_board %>%
    mode_bar_plot(x = .$geography, y = .$percentage_uptake, category_var = .$year_range,
                  xaxis_title = "Health Board",
                  title = "Percentage uptake of breast screening by health board and three year rolling average",
                  hover_end = "%") %>%
    layout(xaxis = list(tickangle = -90,
                        tickmode = "array",
                        ticktext = str_wrap(screening_breast_board$geography, 15),
                        tickvals = screening_breast_board$geography),
           legend = list(x=0.5, y = -0.95))


})

observeEvent(input$screening_breast_geog_type,
             {

               screening_breast_filtered = screening_breast_simd %>%
                 filter(geography_type == input$screening_breast_geog_type)


               updateSelectizeInput(session, "screening_breast_geog_name",
                                    choices = unique(screening_breast_filtered$geography))
             })


altTextServer("screening_breast_simd_alt",
              title = "Breast screening by SIMD plot",
              content = tags$ul(tags$li("This is a plot for the three year rolling average percentage uptake of breast screening by SIMD forthe year range 1st April 2019 to 31st March 2022."),
                                tags$li("The x axis shows the SIMD breakdown for quintiles where 1 is the most deprived and 5 is the least deprived."),
                                tags$li("The y axis shows the percentage uptake."),
                                tags$li("The blue bar represents the percentage uptake for that SIMD quintile."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland.")

              )
)

output$screening_breast_simd_plot <- renderPlotly({

  screening_breast_simd %>%
    filter(geography == input$screening_breast_geog_name) %>%
    mode_bar_plot(x = .$SIMD, y = .$percentage_uptake, category_var = .$geography,
                  xaxis_title = "SIMD",
                  title = glue("Percentage uptake of breast screening by SIMD category in the year range ",
                               "{max(screening_breast_board$year_range)} in {input$screening_breast_geog_name}"),
                  hover_end = "%")

})

# output$screening_breast_table_title <- renderUI({glue("Data table: Percentage uptake of breast screening by SIMD")})

observeEvent(input$screening_breast_tabBox, {
  observeEvent(input$screening_breast_geog_name, {
    # observeEvent(input$gender_pay_gap_cw_work, {

    title <- ifelse(input$screening_breast_tabBox == "Health Board",
                    "Data table: Percentage uptake of breast screening by heath board and three year rolling average",
                    glue("Data table: Percentage uptake of breast screening by SIMD category in the year range ",
                         "{max(screening_breast_board$year_range)} in {input$screening_breast_geog_name}"))
    # string_sector <- ifelse(input$gender_pay_gap_cw_sector == "All",
    #                         "all sectors, ",
    #                         tolower(paste0(input$gender_pay_gap_cw_sector, " sector, ")))
    # string_work <- tolower(paste0(input$gender_pay_gap_cw_work, " work patterns"))

    output$screening_breast_table_title <- renderUI(h3(title))
    # })
  })
})

# })

observeEvent(input$screening_breast_geog_name,{

  data_unfiltered <- screening_breast_board

  dataDownloadServer(data = data_unfiltered, data_download = data_unfiltered,
                     id = "screening_breast_board", filename = "breast_screening_uptake_by_board",
                     add_percentage_cols = c(4))

  data_filtered <- screening_breast_simd %>%
    filter(geography == input$screening_breast_geog_name)

  dataDownloadServer(data = data_filtered, data_download = screening_breast_simd,
                     id = "screening_breast_simd", filename = "breast_screening_uptake_by_simd",
                     add_percentage_cols = c(4),
                     keep_colnames = c(3))

})

######### BOWEL ##########

altTextServer("screening_bowel_board_alt",
              title = "Bowel screening by health board and sex plot",
              content = tags$ul(tags$li("This is a plot for the percentage uptake of bowel screening by health board and sex between 1st May 2020 and 30th April 2022."),
                                tags$li("The x axis shows the health board, including Scotland."),
                                tags$li("The y axis shows the percentage uptake."),
                                tags$li("Each health board has two corresponding bars representing percentage uptake. The dark blue bar on the left hand side for each health board represents females",
                                        "and the light blue bar on the right hand side for each health board represents males."),
                                tags$li("The drop down above the chart allows you to choose which year range for plotting. The default is 2020-22.")
              )
)

output$screening_bowel_board_plot <- renderPlotly({

  screening_bowel_board %>%
    filter(Sex != "All persons", year_range == input$screening_bowel_board_year) %>%
    mode_bar_plot(x = .$geography, y = .$percentage_uptake, category_var = .$Sex,
                  xaxis_title = "Health Board",
                  title = glue("Percentage uptake of bowel screening by health board and sex in the year range {input$screening_bowel_board_year}"),
                  hover_end = "%") %>%
    layout(xaxis = list(tickangle = -90,
                        tickmode = "array",
                        ticktext = str_wrap(screening_bowel_board$geography, 15),
                        tickvals = screening_bowel_board$geography),
           legend = list(x=0.5, y = -0.95))


})


observeEvent(input$screening_bowel_geog_type,
             {

               screening_bowel_filtered = screening_bowel_simd %>%
                 filter(geography_type == input$screening_bowel_geog_type)


               updateSelectizeInput(session, "screening_bowel_geog_name",
                                    choices = unique(screening_bowel_filtered$geography))
             })

altTextServer("screening_bowel_simd_alt",
              title = "Bowel screening by SIMD plot",
              content = tags$ul(tags$li("This is a plot for the percentage uptake of bowel screening by SIMD and sex between 1st May 2020 and 30th April 2022."),
                                tags$li("The x axis shows the SIMD breakdown for quintiles where 1 is the most deprived and 5 is the least deprived."),
                                tags$li("The y axis shows the percentage uptake."),
                                tags$li("Each SIMD quintile has two corresponding bars representing percentage uptake. The dark blue bar on the left hand side for each health board represents females",
                                        "and the light blue bar on the right hand side for each health board represents males."),
                                tags$li("The drop down above the chart allows you to choose which year range for plotting. The default is 2020-22."),
                                tags$li("There are three drop downs above the chart which allow you to choose which year range, national or local",
                                        "geography level and area for plotting. The default year range is 2020-22 and the default geography level and area is Scotland.")

              )
)

output$screening_bowel_simd_plot <- renderPlotly({

  screening_bowel_simd %>%
    filter(geography == input$screening_bowel_geog_name,
           Sex != "All persons", year_range == input$screening_bowel_simd_year) %>%
    mode_bar_plot(x = .$SIMD, y = .$percentage_uptake, category_var = .$Sex,
                  xaxis_title = "SIMD",
                  title = glue("Percentage uptake of bowel screening by SIMD category and sex in the year range {input$screening_bowel_simd_year} in {input$screening_bowel_geog_name}"),
                  hover_end = "%")

})

observeEvent(input$screening_bowel_tabBox, {
  observeEvent(input$screening_bowel_geog_name, {

    title <- ifelse(input$screening_bowel_tabBox == "Health Board",
                    "Data table: Percentage uptake of bowel screening by heath board and sex",
                    glue("Data table: Percentage uptake of bowel screening by SIMD category and sex",
                         "in {input$screening_bowel_geog_name}"))

    output$screening_bowel_table_title <- renderUI(h3(title))
  })
})


observeEvent(input$screening_bowel_geog_name,{
  observeEvent(input$screening_bowel_board_year,{
    observeEvent(input$screening_bowel_simd_year,{

      data_unfiltered_board <- screening_bowel_board %>%
        filter(Sex != "All persons") %>%
        arrange(geography, desc(year_range), Sex)

      data_filtered_board <- data_unfiltered_board %>%
        filter(year_range == input$screening_bowel_board_year)


      dataDownloadServer(data = data_filtered_board, data_download = data_unfiltered_board,
                         id = "screening_bowel_board", filename = "bowel_screening_uptake_by_board",
                         add_percentage_cols = c(5))

      data_unfiltered_simd <- screening_bowel_simd %>%
        filter(Sex != "All persons") %>% arrange(geography, desc(year_range), SIMD)

      data_filtered_simd <- data_unfiltered_simd %>%
        filter(geography == input$screening_bowel_geog_name,
               year_range == input$screening_bowel_simd_year)

      dataDownloadServer(data = data_filtered_simd, data_download = data_unfiltered_simd,
                         id = "screening_bowel_simd", filename = "bowel_screening_uptake_by_simd",
                         add_percentage_cols = c(6),
                         keep_colnames  = c(5))

    })
  })
})

##############################################.
# VACCINATIONS UPTAKE----
##############################################.

################# COVID #####################

observeEvent(input$vaccinations_covid_geog_type,
             {

               vacc_filtered = vaccinations_covid %>%
                 filter(geography_type == input$vaccinations_covid_geog_type)


               updateSelectizeInput(session, "vaccinations_covid_geog_name",
                                    choices = unique(vacc_filtered$geography))
             })

altTextServer("vaccinations_covid_alt",
              title = "Covid vaccinations uptake plot",
              content = tags$ul(tags$li("This is a bar plot for the breakdown of COVID-19 vaccinations uptake by SIMD."),
                                tags$li("The two bars represent the dates of collected data, positioned from left to right, the light blue bar represents",
                                        glue("{vaccinations_covid %>% slice(which.min(.$date)) %>% .$date}"), "and the dark blue bar represents",
                                        glue("{vaccinations_covid %>% slice(which.max(.$date)) %>% .$date}")),
                                tags$li("The x axis is the SIMD breakdown from 1 to 10 where 1 is least deprived and 10 is most deprived,",
                                        "Scotland level data also showns the percentage uptake of people whose SIMD decile is Not known."),
                                tags$li("The y axis is the percentage uptake of vaccinations."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland.")

              )
)



output$vaccinations_covid_plot <- renderPlotly({

  plot <- vaccinations_covid %>%
    filter(geography == input$vaccinations_covid_geog_name) %>%
    mode_bar_plot(x = .$SIMD,
                  y = .$percentage_uptake,
                  xaxis_title = "SIMD",
                  category_var = .$date,
                  hover_end = "%",
                  title = glue("Percentage (%) uptake of COVID-19 vaccinations in eligible population by SIMD in {input$vaccinations_covid_geog_name}"
                  )) %>%
    layout(yaxis = list(ticksuffix = "%"),
           xaxis = list(tickangle = -30))

})


observeEvent(input$vaccinations_covid_geog_name,{

  output$vaccinations_covid_title <- renderUI({h3(glue("Data table: Percentage (%) uptake of COVID-19 vaccinations in ",
                                                       "eligible population by SIMD in {input$vaccinations_covid_geog_name}"))})
})


observeEvent(input$vaccinations_covid_geog_name,{

  data_unfiltered <- vaccinations_covid %>%
    filter(!(percentage_uptake == 0)) %>%
    select(date, geography_type, geography, SIMD,
           percentage_uptake) %>%
    rename(`uptake_percentage_(%)` = percentage_uptake) %>%
    arrange(date, SIMD)

  data_filtered <- data_unfiltered %>%
    filter(geography == input$vaccinations_covid_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "vaccinations_covid", filename = "vaccinations_covid",
                     add_percentage_cols = c(5),
                     keep_colnames = c(4))
})


############## FLU ##################

observeEvent(input$vaccinations_flu_geog_type,
             {

               vacc_filtered = vaccinations_flu %>%
                 filter(geography_type == input$vaccinations_flu_geog_type)


               updateSelectizeInput(session, "vaccinations_flu_geog_name",
                                    choices = unique(vacc_filtered$geography))
             })

altTextServer("vaccinations_flu_alt",
              title = "Influenza vaccinations uptake plot",
              content = tags$ul(tags$li("This is a bar plot for the breakdown of influenza vaccinations uptake by SIMD."),
                                tags$li("The two bars represent the dates of collected data, positioned from left to right, the light blue bar represents",
                                        glue("{vaccinations_flu %>% slice(which.min(.$date)) %>% .$date}"), "and the dark blue bar represents",
                                        glue("{vaccinations_flu %>% slice(which.max(.$date)) %>% .$date}")),
                                tags$li("The x axis is the SIMD breakdown from 1 to 10 where 1 is least deprived and 10 is most deprived,",
                                        "Scotland level data also showns the percentage uptake of people whose SIMD decile is Not known."),
                                tags$li("The y axis is the percentage uptake of vaccinations."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland.")

              )
)


output$vaccinations_flu_plot <- renderPlotly({

  plot <- vaccinations_flu %>%
    filter(geography == input$vaccinations_flu_geog_name) %>%
    mode_bar_plot(x = .$SIMD,
                  y = .$percentage_uptake,
                  xaxis_title = "SIMD",
                  yaxis_title = "Percentage (%)",
                  category_var = .$date,
                  hover_end = "%",
                  title = glue("Percentage (%) uptake of influenza vaccinations in eligible population by SIMD in {input$vaccinations_flu_geog_name}"
                  )) %>%
    layout(yaxis = list(ticksuffix = "%"))

})


observeEvent(input$vaccinations_flu_geog_name,{

  output$vaccinations_flu_title <- renderUI({h3(glue("Data table: Percentage (%) uptake of influenza vaccinations in ",
                                                     "eligible population by SIMD in {input$vaccinations_flu_geog_name}"))})
})


observeEvent(input$vaccinations_flu_geog_name,{

  data_unfiltered <- vaccinations_flu %>%
    filter(!(percentage_uptake == 0)) %>%
    select(date, geography_type, geography, SIMD,
           percentage_uptake) %>%
    rename(`uptake_percentage_(%)` = percentage_uptake) %>%
    arrange(date, SIMD)

  data_filtered <- data_unfiltered %>%
    filter(geography == input$vaccinations_flu_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "vaccinations_flu", filename = "vaccinations_flu",
                     add_percentage_cols = c(5),
                     keep_colnames = c(4))

})

##############################################.
# EXPERIENCE OF SOCIAL CARE RECIPIENTS----
##############################################.


##############################################.
# EXPERIENCE OF UNPAID CARERS----
##############################################.

altTextServer("experience_of_unpaid_carers_alt",
              title = "Experience of unpaid carers plot",
              content = tags$ul(tags$li("This is a plot for the trend in percentage of unpaid carers who agree with the sentence",
                                        "`I feel supported to continue caring`."),
                                tags$li("It is a stacked bar plot where each bar refers to the financial year and each bar is seperated into",
                                        "sections which represent the percentage of responses for each particcular answer."),
                                tags$li("The legend shows 5 categories: `Strongly agree`, `Agree`, `Neither agree nor disagree`, ",
                                        "`Disagree` and `Strongly disagree`. These are represented on the bar plot in the same order from top to bottom."),
                                tags$li("The x axis is the financial year the survey was conducted in."),
                                tags$li("The y axis is the percentage of responses for each answer.")
              ))



output$experience_unpaid_carers_plot <- renderPlotly({

  title <- "Percentage of unpaid carers who agree with the sentence “I feel supported to continue caring“"

  experience_unpaid_carers %>%
    mutate(proportion = as.numeric(indicator)) %>%
    stacked_bar_function(., category_var = .$breakdown, title = title) %>%
    layout(legend = list(y = -0.4))
})

experience_unpaid_carers %>%
  select(c(date, breakdown, indicator)) %>%
  mutate(indicator = round(as.numeric(indicator)*100, 1)) %>%
  arrange(desc(date)) %>%
  mutate(date = factor(date),
         breakdown = factor(breakdown)) %>%
  rename("Financial Year" = "date",
         Answer = "breakdown",
         "Percentage (%)"= "indicator") %>%
  dataDownloadServer(id = "experience_unpaid_carers",
                     filename = "experience_unpaid_carers")
