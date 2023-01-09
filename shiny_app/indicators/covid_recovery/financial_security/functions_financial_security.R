
##############################################.
# FUEL AFFORDABILITY FUNCTIONS----
##############################################.

fuel_afford_plot_line = function(data, title = NULL) {
  plot = data %>%
    plot_ly(x=~date_code,
            y=~value,
            type="scatter",
            mode="lines+markers",
            color = data$fuel_poverty,
            colors = palette,
            text = paste0(data$fuel_poverty, "<br>", data$date_code, "<br>",
                          "Percentage of household: ", data$value,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Percentage of household", range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}
#yaxis = yaxis_proportion



##############################################.
# MANAGING FINANCIALLY----
##############################################.

managing_financially_plot_bar = function(data) {

  fig = data %>%
    plot_ly()

  fig %<>% add_trace(x=~Category,
                     y=~Percent,
                     type="bar",
                     name = "Managing financially",
                     textposition = "outside",
                     texttemplate = '%{y:s}%',
                     #textfont = list(size = 10),
                     text = ~Percent,
                     hovertemplate = paste0("Category: ", data$Answer, "<br>",
                                            "Percentage of household (%): ", "%{text}%"))

  fig %<>%
    layout(xaxis = list(title = "Category"),
           yaxis = list(title = "Percentage of household (%)", range = c(0,100), ticksuffix = "%"),
           showlegend = FALSE,
           uniformtext=list(minsize=8, mode='show'),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig
}


##############################################.
# SAVINGS----
##############################################.

savings_plot_stacked_bar = function(data) {

  data %>%
    plot_ly(x=~year,
            y=~percentage,
            color = ~savings,
            type = 'bar',
            colors = palette_camhs,
            marker = list(line = list(width=1,
                                      color = 'rgb(0,0,0)')),
            text = paste0("Year: ",data$year, "<br>",
                          "Savings: ", data$savings, "<br>",
                          "Percentage of household: ",
                          scales::percent(data$percentage*0.01, accuracy = .1)),
            hoverinfo = "text",
            textposition = "none") %>%
    layout(barmode = "stack",
           bargap = 0,
           xaxis = list(title = "Year",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        dtick = 1),
           yaxis = list(title = "Proportion",
                        rangemode="tozero",
                        fixedrange=TRUE,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        ticksuffix = "%"),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))
    ) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}



savings_low_income_plot_line = function(data, title = NULL, color_column = NULL, indicator_name = "Value") {


  if (is.null(color_column))
  {
    color_column_option = NULL
  } else{
    color_column_option = data[[color_column]]
  }

  #indicator_name = "Proportion (%): "

  data %>%
    plot_ly(x=~year,
            y=~percentage,
            type="scatter",
            mode="lines+markers",
            color = color_column_option,
            colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          indicator_name, data$percentage,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = indicator_name, range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}


##############################################.
# UNMANAGEABLE DEBT----
##############################################.

unmanageable_debt_plot_line = function(data, title = NULL) {
  max_y_value = max(data$perc_with_problem_debt)
  data %>%
    plot_ly(x=~year,
            y=~perc_with_problem_debt,
            type="scatter",
            mode="lines+markers",
            color = NULL,
            colors = palette,
            text = paste0("Percentage of household with unmanageable debt", "<br>", data$year, "<br>",
                          "Percentage of household: ", data$perc_with_problem_debt,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Percentage of household", range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}
