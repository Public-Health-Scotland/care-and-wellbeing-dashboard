##############################################.
# EMPLOYEES ON THE LIVING WAGE----
##############################################.

employees_living_wage_plot_line = function(data, title = NULL, color_column = NULL) {


  if (is.null(color_column))
  {
    color_column_option = NULL
  } else{
    color_column_option = data[[color_column]]
  }



  data %>%
    plot_ly(x=~year,
            y=~measure_value,
            type="scatter",
            mode="lines+markers",
            color = color_column_option,
            colors = palette,
            text = paste0("Sector: ", color_column_option, "<br>",
                          "Year: ", data$year, "<br>",
                          "Proportion (%): ", data$measure_value,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Proportion (%)", range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"),
                         xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}



##############################################.
# GENDER PAY GAP----
##############################################.


gender_pay_gap_plot_line = function(data, title = NULL, second_axis = FALSE) {

  fig = data %>%
    plot_ly(x=~year,
            y=~`Pay Gap`,
            type="scatter",
            mode="lines+markers",
            name = "Pay Gap \n(Woman/Men) (%)",
            #color = color_column_option,
            #colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          "Pay Gap (Woman/Men) (%): ", data$`Pay Gap`,"% <br>"),
            hoverinfo = "text")

  if(second_axis)
  {
    fig = fig %>% add_trace(x=~year,
                            y=~Men,
                            yaxis = "y2",
                            type="scatter",
                            mode="lines+markers",
                            name = "Men (£)",
                            line = list(dash = 'dash'),
                            text = paste0("Year: ", data$year, "<br>",
                                          "Men Median Hourly Earnings (£): ", data$Men," <br>"),
                            hoverinfo = "text")
    fig = fig %>% add_trace(x=~year,
                            y=~Woman,
                            yaxis = "y2",
                            type="scatter",
                            mode="lines+markers",
                            name = "Women (£)",
                            line = list(dash = 'dash'),
                            text = paste0("Year: ", data$year, "<br>",
                                          "Women Median Hourly Earnings (£): ", data$Men," <br>"),
                            hoverinfo = "text")  %>%
      layout(yaxis2 =  list(title = "Median Hourly Earnings (£)",
                            overlaying = "y",
                            side = "right",
                            rangemode="tozero",
                            #gridcolor = "blue",
                            showgrid = FALSE))


  }

  fig = fig %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Pay Gap (Woman/Men) (%)", range = c(-100,100), ticksuffix = "%"),
           title = title,
           showlegend = TRUE,
           legend = list(x = 1.2, y = 1, bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>")
                         )) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig

}


##############################################.
# DISABILITY EMPLOYMENT GAP----
##############################################.

disability_employment_gap_line_bar = function(data, title = NULL) {

  fig = data %>%
    plot_ly()

  fig = fig %>% add_trace(x=~year,
                          y=~`Not Equality Act Disabled`,
                          type="scatter",
                          mode="lines+markers",
                          name = "Not Equality Act Disabled",
                          text = paste0("Year: ", data$year, "<br>",
                                        "Not Equality Act Disabled",  "<br>",
                                        "Employment Rate (%): ", data$`Not Equality Act Disabled`,"% <br>"),
                          hoverinfo = "text")
  fig = fig %>% add_trace(x=~year,
                          y=~`Equality Act Disabled`,
                          type="scatter",
                          mode="lines+markers",
                          name = "Equality Act Disabled",
                          text = paste0("Year: ", data$year, "<br>",
                                        "Equality Act Disabled",  "<br>",
                                        "Employment Rate (%): ", data$`Equality Act Disabled`,"% <br>"),
                          hoverinfo = "text")

  fig = fig %>% add_trace(x=~year,
                          y=~`Disability Employment Gap`,
                          type="bar",
                          name = "Disability Employment Gap",
                          base = ~`Equality Act Disabled`,
                          textposition = "inside",
                          texttemplate = '%{y:s}%',
                          insidetextanchor = "middle",
                          text = ~`Disability Employment Gap`,
                          hovertemplate = paste0("Year: ", data$year, "<br>",
                                                 "Disability Employment Gap (%): ", "%{text}%"))

  fig %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Employment Rate (%)", range = c(0,100), ticksuffix = "%"),
           showlegend = TRUE,
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"),
                         xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}



disability_employment_gap_plot_line = function(data, title = NULL, color_column = NULL, indicator_name = "Value") {


  if (is.null(color_column))
  {
    color_column_option = NULL
  } else{
    color_column_option = data[[color_column]]
  }

  #indicator_name = "Proportion (%): "

  data %>%
    plot_ly(x=~year,
            y=~measure_value,
            type="scatter",
            mode="lines+markers",
            color = color_column_option,
            colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          indicator_name, data$measure_value,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = indicator_name, range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"),
                        xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}



##############################################.
# ETHNICITY EMPLOYMENT GAP----
##############################################.


ethnicity_employment_gap_line_bar = function(data) {

  fig = data %>%
    plot_ly()

  fig = fig %>% add_trace(x=~year,
                          y=~White,
                          type="scatter",
                          mode="lines+markers",
                          name = "White",
                          text = paste0("Year: ", data$year, "<br>",
                                        "Ethnicity: White",  "<br>",
                                        "Employment Rate (%): ", data$White,"% <br>"),
                          hoverinfo = "text")
  fig = fig %>% add_trace(x=~year,
                          y=~`Minority Ethnic`,
                          type="scatter",
                          mode="lines+markers",
                          name = "Minority Ethnic",
                          text = paste0("Year: ", data$year, "<br>",
                                        "Ethnicity: Minority Ethnic",  "<br>",
                                        "Employment Rate (%): ", data$`Minority Ethnic`,"% <br>"),
                          hoverinfo = "text")

  fig = fig %>% add_trace(x=~year,
                          y=~`Ethnicity Employment Gap`,
                          type="bar",
                          name = "Ethnicity Employment Gap",
                          base = ~`Minority Ethnic`,
                          textposition = "inside",
                          texttemplate = '%{y:s}%',
                          insidetextanchor = "middle",
                          text = ~`Ethnicity Employment Gap`,
                          hovertemplate = paste0("Year: ", data$year, "<br>",
                                                 "Ethnicity Employment Gap (%): ", "%{text}%"))

  fig %>%
    layout(xaxis = list(title = "Financial year"),
           yaxis = list(title = "Employment Rate (%)", range = c(0,100), ticksuffix = "%"),
           showlegend = TRUE,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"),
                         xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}


##############################################.
# ZERO-HOURS CONTRACTS----
##############################################.

zero_hours_contracts_plot_line = function(data) {


  data %>%
    plot_ly(x=~date,
            y=~percent_of_people,
            type="scatter",
            mode="lines+markers",
            text = paste0(data$date, "<br>",
                          "Percentage (%)", data$percent_of_people,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Quarter"),
           yaxis = list(title = "Percentage (%)", range = c(0,100), ticksuffix = "%"),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"),
                         xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}


zero_hours_contracts_plot_bar = function(data) {

  fig = data %>%
    plot_ly()

  fig %<>% add_trace(x=~date,
                     y=~percent_of_people,
                     type="bar",
                     name = "Zero-hours contracts",
                     textposition = "outside",
                     texttemplate = '%{y:s}%',
                     #textfont = list(size = 10),
                     text = ~percent_of_people,
                     hovertemplate = paste0("Quarter: ", data$date, "<br>",
                                            "Zero-hour Contracts (%): ", "%{text}%"))

  fig %<>%
    layout(xaxis = list(title = "Quarter"),
           yaxis = list(title = "Zero-hour Contracts (%)", range = c(0,100), ticksuffix = "%"),
           showlegend = FALSE,
           uniformtext=list(minsize=8, mode='show'),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"),
                         xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig
}

##############################################.
# SKILLS SHORTAGE VACANCIES----
##############################################.

plot_skills_shortage <- function(data) {

  fig = data %>%
    plot_ly(x = ~year,
            y = ~percent*100,
            color = ~vacancy_type,
            type = "bar",
            colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          "Proportion (%): ",
                          scales::percent(data$percent, accuracy = .1),
                          "<br>",
                          "Number of Vacancies: ",
                          format(data$n_vacancies, big.mark = ",")),
            hoverinfo = "text",
            textposition="none") %>%
    layout(yaxis = yaxis_proportion,
           xaxis = xaxis_year,
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


}




##############################################.
# UNDEREMPLOYMENT----
##############################################.


line_plot_with_marker = function(data, x_col, y_col,  x_axis_title = "X", y_axis_title = "Y") {

  data %>%
    plot_ly(x=data[[x_col]],
            y=data[[y_col]],
            type="scatter",
            mode="lines+markers",
            text = paste0(x_axis_title, ": ", data[[x_col]], "<br>",
                          y_axis_title, ": ", data[[y_col]],"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = x_axis_title),
           yaxis = list(title = y_axis_title, range = c(0,100), ticksuffix = "%"),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}


##############################################.
# ECONOMIC INACTIVITY----
##############################################.

plot_economic_inactivity <- function(data) {

  fig = data %>%
    plot_ly(x = ~year,
            y = ~percent,
            color = ~breakdown,
            type="scatter",
            mode="lines+markers",
            colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          "Proportion (%): ",
                          data$percent, "%",
                          "<br>",
                          "Number of Vacancies: ",
                          format(data$n, big.mark = ",")),
            hoverinfo = "text",
            textposition="none") %>%
    layout(yaxis = yaxis_proportion,
           xaxis = xaxis_year) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


}


##############################################.
# EMPLOYABILITY----
##############################################.


quarterStart <- function(x) {
  x <- as.POSIXlt(x)
  x <- quarter(x, type = "date_first", fiscal_start = 1)
  as.Date(x)
}





plot_funnel_layers = function(data_raw, v_y_col, v_name, v_color = NULL, V_funnel_width = NULL) {
  data = data_raw %>%
    summarise_at(v_y_col, ~sum(., na.rm = TRUE)) %>%
    pivot_longer(everything())


  fig <- plot_ly()
  fig %<>%
    add_trace(type = "funnel",
              y = v_name,
              x = data$value,
              textposition = "inside",
              textinfo = "value+percent initial",
              opacity = 0.65,
              marker = list(color = v_color),
              connector = list(line = list(color = "rgb(127, 127, 127)",  width = 1)))
  fig %<>%
    layout(yaxis = list(categoryarray = v_name),
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'))

  fig
}



plot_line_with_bar = function(data, x_col, v_y_col,
                              v_color = NULL,
                              v_name = NULL,
                              v_bar_width = NULL,
                              xaxisTitle = NULL,
                              with_bar = TRUE)
{

  fig = data %>%
    plot_ly()

  for (i in 1:length(v_y_col))
  {
    name = v_name[i]
    y_col = v_y_col[i]
    color = v_color[i]
    bar_width = v_bar_width[i]
    fig %<>%
      add_trace(x=data[[x_col]],
                y=data[[y_col]],
                type="scatter",
                name = name,
                mode="lines+marker",
                line = list(color= color),
                #marker = list(color= color),
                opacity = 1,
                text = paste0( data[[x_col]], "<br>",
                               name, ": ", data[[y_col]]),
                #stackgroup = 'one',
                #fillcolor = '#1F77B4',
                hoverinfo = "text")

    if (with_bar)
    {
      fig %<>%
        add_trace(x=data[[x_col]],
                  y=data[[y_col]],
                  type="bar",
                  name = "--",
                  opacity = 0.5,
                  text = paste0( data[[x_col]], "<br>",
                                 name, ": ", data[[y_col]]),
                  marker = list(color=  color),
                  width = bar_width,
                  hoverinfo = "text")
    }

  }

  fig %<>%
    layout(xaxis = list(title = xaxisTitle),
           yaxis = list(title = "Number of people", rangemode="tozero"),
           showlegend = TRUE,
           #bargap  = 0.1,
           barmode='overlay',
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))
    ) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig
}

