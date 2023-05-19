##############################################.
# HEALTHY LIFE EXPECTANCY----
##############################################.


##############################################.
# MENTAL WELLBEING OF ADULTS (16+)----
##############################################.


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

  title <- glue("Trend in all-cause mortality for ages 15-44 in ",
                input$all_cause_mortality_geog_name)


  data = all_cause_mortality %>%
    filter(geography_type == input$all_cause_mortality_geog_type,
           geography == input$all_cause_mortality_geog_name,
           indicator_age == "15 to 44") %>%
    group_by(year) %>%
    summarise(pop = sum(pop), deaths = sum(deaths)) %>%
    mutate(rate = deaths/pop*100000,
           date = year)

  if (input$all_cause_mortality_rate_number == "Rate") {
    data %<>%
      mutate(indicator = rate)

    indicator_y = "Rate per 100,000"
  } else if (input$all_cause_mortality_rate_number == "Number") {
    data %<>%
      mutate(indicator = deaths)

    indicator_y = "Number of deaths"
  }


  line_chart_function(data, indicator_y,
                      title = title,
                      label = ifelse(input$all_cause_mortality_rate_number == "Rate", "Rate of deaths", "Number of deaths"))


})


observeEvent(input$all_cause_mortality_geog_name,{

  data_unfiltered <- all_cause_mortality %>%
    filter(indicator_age == "15 to 44") %>%
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

  output$all_cause_mortality_title <- renderText({glue("Data table: Total number and rate of all-cause deaths for ages 15-44 in ",
                                                       input$all_cause_mortality_geog_name)})
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
  title <- glue("Trend in age-sex standardised rates per 100,000 of CHD deaths (age 45-74) in ",
                input$chd_deaths_geog_name)
  data = chd_deaths %>%
    filter(geography_type == input$chd_deaths_geog_type,
           geography == input$chd_deaths_geog_name) %>%
    rename(date = year_range) %>%
    confidence_line_function(., y_title = "Rate per 100,000", title = title) %>%
    layout(xaxis = list(tickangle = 30),
           legend = list(y = -0.4))
})


observeEvent(input$chd_deaths_geog_type,{
  observeEvent(input$chd_deaths_geog_name,{

    data_unfiltered <- chd_deaths %>%
      select(year_range, area_type, area_name, measure,
             lower_confidence_interval, upper_confidence_interval) %>%
      arrange(year_range) %>%
      mutate(year_range = factor(year_range)) %>%
      rename("geography_type" = "area_type",
             "geography" = "area_name",
             "Rate of CHD deaths per 100,000 (age 45-74)" = "measure")

    data_filtered <- data_unfiltered %>%
      filter(geography_type == input$chd_deaths_geog_type) %>%
      filter(geography == input$chd_deaths_geog_name)

    dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                       id = "chd_deaths", filename = "chd_deaths",
                       add_separator_cols_2dp = c(4,5,6))
  })
})

observeEvent(input$chd_deaths_geog_name,{

  output$chd_deaths_title <- renderText({glue("Data table: Age-sex standardised rates per 100,000 of CHD deaths (age 45-74) in ",
                                              input$chd_deaths_geog_name)})
})

altTextServer("chd_deaths_alt",
              title = "Coronary heart disease deaths plot",
              content = tags$ul(tags$li("This is a plot for the trend in age-sex standardised rates per 100,000 of coronary heart disease deaths."),
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

  title <- "Total number of first ever hopsital admissions for heart attack (under 75) annually in Scotland"

  p <- heart_attack %>%
    line_chart_function(y_title = "Total number of hospital admissions", label = "Number of admissions", title = title)

})

heart_attack %>%
  select(date, total_admissions) %>%
  arrange(date) %>%
  mutate(date = factor(date)) %>%
  rename("Year" = "date",
         "Total number of hospital admissions" = "total_admissions") %>%
  dataDownloadServer(id = "heart_attack_admission",
                     filename = "first_ever_hospital_admission_heart_attack",
                     add_separator_cols = c(2))


altTextServer("hospital_admission_heart_attack_alt",
              title = "First ever hospital admissions for heart attack plot",
              content = tags$ul(tags$li("This is a plot for the trend in number of first ever hospital admissions for heart attacks for people aged under 75 in Scotland."),
                                tags$li("The x axis is year, starting in 1997"),
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

  title <- glue("Trend in age-sex standardised rates per 100,000 of drug-related hospital admissions (",
                age_title, ") in Scotland")

  data = drug_stays %>%
    filter(age_group %in% input$drug_admissions_age) %>%
    mutate(indicator = rate, date = financial_year) %>%

    make_line_chart_multi_lines(x = .$date, y = .$indicator,
                                colour = .$age_group,
                                title = title,
                                y_axis_title = "Rate per 100,000",
                                x_axis_title = "Financial year") %>%
    layout(xaxis = list(tickangle = 30),
           legend = list(y = -0.4))

})



observeEvent(input$drug_admissions_age,{

  data_unfiltered <- drug_stays %>%
    select(financial_year, age_group, rate) %>%
    arrange(financial_year) %>%
    mutate(financial_year = factor(financial_year)) %>%
    rename("Drug-related hospital admissions rate" = "rate")

  data_filtered <- data_unfiltered %>%
    filter(age_group %in% input$drug_admissions_age)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "drug_admissions", filename = "drug_admissions",
                     add_separator_cols_2dp = c(3))
})

observeEvent(input$drug_admissions_age,{

  if(length(input$drug_admissions_age) != 1){
    age_title <- "by age"
  } else if (input$drug_admissions_age == "All age groups") {
    age_title <- "all age groups"
  } else {
    age_title <- paste0("ages ", input$drug_admissions_age)
  }

  output$drug_admissions_title <- renderText({glue("Data table: Age-sex standardised rates per 100,000 of drug-related hospital admissions (",
                                                   age_title, ") in Scotland")})
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
                                tags$li("This is a plot for the age-standerdised drug-related deaths rate per 100,000 population."),
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

  title_rate <- glue("Trend in age standardised rates per 100,000 of drug-related deaths in ",
                     input$drug_deaths_geog_name)

  title_number <- glue("Trend in number of drug-related deaths in ",
                       input$drug_deaths_geog_name)


  if (input$drug_deaths_rate_number == "Rate") {
    drug_related_deaths %>%
      mutate(date = year) %>%
      filter(#geography_type == input$drug_deaths_geog_type,
        geography == input$drug_deaths_geog_name) %>%
      confidence_line_function(., "Rate per 100,000", title = title_rate) %>%
      layout(xaxis = list(tickangle = 30),
             legend = list(y = -0.4))
  } else if (input$drug_deaths_rate_number == "Number") {
    drug_related_deaths %>%
      mutate(date = year, indicator = number) %>%
      filter(#geography_type == input$drug_deaths_geog_type,
        geography == input$drug_deaths_geog_name) %>%
      line_chart_function(., "Total number of deaths", title = title_number) %>%
      layout(xaxis = list(tickangle = 30,
                          title = "Year range"))

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

  output$drug_deaths_title <- renderText({glue("Data table: Number and age standardised rates per 100,000 of drug-related deaths in ",
                                               input$drug_deaths_geog_name)})
})

##############################################.
# ALCOHOL: DEATHS AND FIRST HOSPITAL ADMISSIONS (UNDER 75) ----
##############################################.

##############################################.
# ALCOHOL RELATED HOSPITAL ADMISSIONS (<75)----
##############################################.
observeEvent(input$alcohol_admissions_geog_type,
             {

               alcohol_filtered = alcohol_admissions %>%
                 filter(geography_type == input$alcohol_admissions_geog_type)

               #select_choice <- ifelse(input$geog_type_summary_CW == "Scotland", "area", input$geog_type_summary)

               updateSelectizeInput(session, "alcohol_admissions_geog_name",
                                    #label = glue("4. Select {select_choice}"),
                                    choices = unique(alcohol_filtered$geography))#,
               #selected = "")
             })

output$alcohol_admissions_plot = renderPlotly({

  title <- glue("Trend in total number of alcohol related admissions in ",
                input$alcohol_admissions_geog_name)

  data_alc = alcohol_admissions %>%
    arrange(financial_year) %>%
    filter(geography == input$alcohol_admissions_geog_name,
           condition == "All alcohol conditions",
           smr_type == "Combined") %>%
    rename(date = "financial_year",
           indicator = "stays_easr")

  line_chart_function(data_alc, y_title = "European age-sex standardised rate<br>(per 100,000)") %>%
    layout(xaxis = list(tickangle = 45))

})

observeEvent(input$alcohol_admissions_geog_name,{

  data_unfiltered <- alcohol_admissions %>%
    arrange(financial_year) %>%
    filter(condition == "All alcohol conditions",
           smr_type == "Combined") %>%
    mutate(financial_year = factor(financial_year)) %>%
    select(financial_year, geography_type, geography, stays_easr) %>%
    rename("Number of alcohol related admissions" = "stays_easr")

  data_filtered <- data_unfiltered %>%
    filter(geography == input$alcohol_admissions_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "alcohol_related_admissions", filename = "alcohol_related_admissions",
                     add_separator_cols_1dp = c(4))

})

observeEvent(input$alcohol_admissions_geog_name,{

  output$alcohol_admissions_title <- renderText({glue("Data table: Total number of alcohol related admissions in ",
                                                      input$alcohol_admissions_geog_name)})
})



##############################################.
# ALCOHOL SPECIFIC DEATHS  (aged 45-74)----
##############################################.
output$alcohol_deaths_plot <- renderPlotly({

  plot <- alcohol_deaths %>%
    filter(sex == input$alcohol_deaths_sex) %>%
    rename("lower_confidence_interval" = lower_ci,
           "upper_confidence_interval" = upper_ci,
           "date" = year,
           "indicator" = rate) %>%
    confidence_line_function(y_title = "Age-standardised mortality rate<br>(per 100,000)")


})

output$alcohol_deaths_by_age_plot <- renderPlotly({

  plot <- alcohol_deaths_by_age %>%
    filter(sex == input$alcohol_deaths_sex) %>%
    mutate(indicator = round(as.integer(indicator), 1)) %>%
    make_line_chart_multi_lines(., x = .$year, y = .$indicator,
                                colour = .$age_group, y_axis_title = "Deaths per 100,000 people")

})



output$alcohol_deaths_table <- DT::renderDataTable({

  alcohol_deaths_by_age %>%
    select(c(year, age_group, indicator, sex)) %>%
    mutate(indicator = round(as.numeric(indicator)*100, 1)) %>%
    rename(Year = "year",
           Sex = "sex",
           `Age Group` = "age_group",
           Rate = "indicator") %>%
    datatable_style_download(.,
                             datetype = "year",
                             data_name = "alcohol_deaths",
                             geogtype = "none")
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
                                tags$li("The x axis is the financial year, starting from 1997/98."),
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
    layout(legend = list(y = -0.4))
})

observeEvent(input$healthy_birthweight_geog_name,{

  data_unfiltered <- birthweight %>%
    arrange(financial_year) %>%
    mutate(percentage = round_half_up(proportion*100,1)) %>%
    select(financial_year, geography_type, geography,
           birthweight_for_gestational_age, percentage) %>%
    mutate(financial_year = factor(financial_year),
           birthweight_for_gestational_age = factor(birthweight_for_gestational_age)) %>%
    rename("Percentage of babies (%)" = "percentage")

  data_filtered <- data_unfiltered %>%
    filter(geography == input$healthy_birthweight_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "healthy_birthweight", filename = "healthy_birthweight",
                     add_separator_cols_1dp = c(5))

})

observeEvent(input$healthy_birthweight_geog_name,{

  output$healthy_birthweight_title <- renderText({glue("Data table: Birthweight of babies based on gestational age in ",
                                                       input$healthy_birthweight_geog_name)})
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
    layout(yaxis = yaxis_proportion)

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

  title <- glue("Trend of total number of asthma admissions ",
                breakdown, "in \n ", geog)

  if(input$asthma_admissions_breakdowns == "Yearly total"){

    plot <- asthma_admissions %>%
      filter(sex == "All Sexes", age_group == "All Ages", geography == input$asthma_admissions_geog_name) %>%
      mutate(indicator = round(as.integer(indicator), 1)) %>%
      line_chart_function(., y_title = "Total number of admissions",
                          x_title = "Financial year", title = title,
                          label = "Number of admissions")


  } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

    plot <- asthma_admissions %>%
      filter(sex == "All Sexes", geography == input$asthma_admissions_geog_name) %>%
      filter(!(age_group %in% c("All Ages", "65+", "75+", "85+", "<18"))) %>%
      arrange(age_group) %>%
      mutate(indicator = round(as.integer(indicator), 1)) %>%
      make_line_chart_multi_lines(x= .$date, y = .$indicator, colour = .$age_group,
                                  x_axis_title = "Financial year", y_axis_title = "Total number of admissions",
                                  title = title)


  } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

    plot <- asthma_admissions %>%
      filter(age_group == "All Ages", geography == input$asthma_admissions_geog_name) %>%
      mutate(indicator = round(as.integer(indicator), 1)) %>%
      make_line_chart_multi_lines(x= .$date, y = .$indicator, colour = .$sex,
                                  x_axis_title = "Financial year", y_axis_title = "Total number of admissions",
                                  title = title)

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
             age_group = factor(age_group)) %>%
      select(c(date, geography_type, geography, sex, age_group, indicator, provisional)) %>%
      rename(`Total number of admissions` = "indicator",
             "Year" = "date",
             "Is data provisional (p)?" = "provisional")

    if(input$asthma_admissions_breakdowns == "Yearly total"){

      data_filtered <- data_unfiltered %>%
        filter(sex == "All Sexes", age_group == "All Ages",
               geography == input$asthma_admissions_geog_name)

    } else if(input$asthma_admissions_breakdowns == "Age breakdown"){

      data_filtered <- data_unfiltered %>%
        filter(sex == "All Sexes",
               geography == input$asthma_admissions_geog_name) %>%
        filter(!(age_group %in% c("All Ages", "65+", "75+", "85+", "90+", "<18")))


    } else if(input$asthma_admissions_breakdowns == "Sex breakdown"){

      data_filtered <- data_unfiltered %>%
        filter(age_group == "All Ages",
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

    output$asthma_admissions_title <- renderText({glue("Data table: Total number of asthma admissions ",
                                                       breakdown, "in ", geog)})
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
              content = tags$ul(tags$li("This is a bar plot for the breakdown of vaccination uptake by SIMD as at 29 January 2023."),
                                tags$li("The x axis is the SIMD breakdown from 1 to 10 where 1 is least depreived and 10 is most deprived."),
                                tags$li("he y axis is the percentage uptake of vaccinations."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland.")

              )
)



output$vaccinations_covid_plot <- renderPlotly({

  plot <- vaccinations_covid %>%
    filter(geography == input$vaccinations_covid_geog_name) %>%
    mode_bar_plot(x = .$SIMD,
                  y = .$uptake_percent,
                  xaxis_title = "SIMD",
                  yaxis_title = "Percentage (%)",
                  category_var = .$value,
                  hover_end = "%",
                  title = glue("Percentage (%) uptake of COVID-19 vaccinations in eligible population by SIMD in {input$vaccinations_covid_geog_name}, ",
                               "as at 29 January 2023")) %>%
    layout(yaxis = list(ticksuffix = "%"))

})


observeEvent(input$vaccinations_covid_geog_name,{

  output$vaccinations_covid_title <- renderText({glue("Data table: Percentage (%) uptake of COVID-19 vaccinations in",
                                                      "eligible population by SIMD in {input$vaccinations_covid_geog_name}")})
})


observeEvent(input$vaccinations_covid_geog_name,{

  data_unfiltered <- vaccinations_covid %>%
    select(geography_type, geography, SIMD, eligible_winter_2022_population,
           vaccinated, uptake_percent) %>%
    rename(`uptake_percentage_(%)` = uptake_percent,
           vaccinated_population = vaccinated)

  data_filtered <- data_unfiltered %>%
    filter(geography == input$vaccinations_covid_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "vaccinations_covid", filename = "vaccinations_covid",
                     add_separator_cols = c(4,5),
                     add_percentage_cols = c(6))
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
              title = "Flu vaccinations uptake plot",
              content = tags$ul(tags$li("This is a bar plot for the breakdown of vaccination uptake by SIMD as at 29 January 2023."),
                                tags$li("The x axis is the SIMD breakdown from 1 to 10 where 1 is least depreived and 10 is most deprived."),
                                tags$li("he y axis is the percentage uptake of vaccinations."),
                                tags$li("There are two drop downs above the chart which allow you to select a national or local",
                                        "geography level and area for plotting. The default is Scotland.")

              )
)


output$vaccinations_flu_plot <- renderPlotly({

  plot <- vaccinations_flu %>%
    filter(geography == input$vaccinations_flu_geog_name) %>%
    mode_bar_plot(x = .$SIMD,
                  y = .$uptake_percent,
                  xaxis_title = "SIMD",
                  yaxis_title = "Percentage (%)",
                  category_var = .$value,
                  hover_end = "%",
                  title = glue("Percentage (%) uptake of flu vaccinations in eligible population by SIMD in {input$vaccinations_flu_geog_name}, ",
                               "as at 29 January 2023")) %>%
    layout(yaxis = list(ticksuffix = "%"))

})


observeEvent(input$vaccinations_flu_geog_name,{

  output$vaccinations_flu_title <- renderText({glue("Data table: Percentage (%) uptake of flu vaccinations in",
                                                    "eligible population by SIMD in {input$vaccinations_flu_geog_name}")})
})


observeEvent(input$vaccinations_flu_geog_name,{

  data_unfiltered <- vaccinations_flu %>%
    select(geography_type, geography, SIMD, eligible_winter_2022_population,
           vaccinated, uptake_percent) %>%
    rename(`uptake_percentage_(%)` = uptake_percent,
           vaccinated_population = vaccinated)

  data_filtered <- data_unfiltered %>%
    filter(geography == input$vaccinations_flu_geog_name)

  dataDownloadServer(data = data_filtered, data_download = data_unfiltered,
                     id = "vaccinations_flu", filename = "vaccinations_flu",
                     add_separator_cols = c(4,5),
                     add_percentage_cols = c(6))
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
    stacked_bar_function(., category_var = .$breakdown, title = title)


})

experience_unpaid_carers %>%
  select(c(date, breakdown, indicator)) %>%
  mutate(indicator = round(as.numeric(indicator)*100, 1)) %>%
  arrange(desc(date)) %>%
  mutate(date = factor(date),
         breakdown = factor(breakdown)) %>%
  rename("Financial Year" = "date",
         Answer = "breakdown",
         Percentage = "indicator") %>%
  dataDownloadServer(id = "experience_unpaid_carers",
                     filename = "experience_unpaid_carers")


