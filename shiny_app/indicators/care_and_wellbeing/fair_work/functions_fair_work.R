##############################################.
# EMPLOYEES ON THE LIVING WAGE----
##############################################.

make_employees_living_wage_cw_line_plot = function(data, title = NULL, color_column = NULL) {


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
           title = list(text = str_wrap(title, width = 60), font = subtitle_style),
           margin = list(t = 90, b = 40),
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}


##############################################.
# GENDER PAY GAP----
##############################################.


make_gender_pay_gap_cw_plot = function(data, title = "", second_axis = FALSE) {

  fig = data %>%
    plot_ly(x=~year,
            y=~`Pay Gap`,
            type="scatter",
            mode="lines+markers",
            name = "Pay Gap \n(Women/Men) (%)",
            #color = color_column_option,
            #colors = palette,
            text = paste0("Year: ", data$year, "<br>",
                          "Pay Gap (Women/Men) (%): ", data$`Pay Gap`,"% <br>"),
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
           yaxis = list(title = "Pay Gap (Women/Men) (%)", range = c(-100,100), ticksuffix = "%"),
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           showlegend = TRUE,
           legend = list(x = 1.2, y = 1, bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig

}


##############################################.
# ECONOMIC INACTIVITY ----
##############################################.

make_economic_inactivity_cw_plot <- function(data, title = "") {

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
           xaxis = xaxis_year,
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


}




