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
           yaxis = list(title = "Percentage (%)", range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(xanchor = "center", x = 0.5, y = -0.2, orientation = "h")) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}


##############################################.
# GENDER PAY GAP----
##############################################.


make_gender_pay_gap_cw_plot = function(data, title = NULL, second_axis = FALSE) {

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
                            y=~Women,
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
           title = title,
           showlegend = TRUE,
           legend = list(x = 1.2, y = 1, bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"))) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig

}


##############################################.
# ECONOMIC INACTIVITY ----
##############################################.

# make_economic_inactivity_cw_plot <- function(data) {
#
#   fig = data %>%
#     plot_ly(x = ~year,
#             y = ~percent,
#             color = ~breakdown,
#             type="scatter",
#             mode="lines+markers",
#             colors = palette,
#             text = paste0("Year: ", data$year, "<br>",
#                           "Proportion (%): ",
#                           data$percent, "%",
#                           "<br>",
#                           "Number of Vacancies: ",
#                           format(data$n, big.mark = ",")),
#             hoverinfo = "text",
#             textposition="none") %>%
#     layout(yaxis = yaxis_proportion,
#            xaxis = xaxis_year) %>%
#     config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
#
#
# }
#

make_economic_inactivity_cw_plot <- function(data) {
  fig = data %>%
      plot_ly(x = ~year,
              y = ~percent,
              color = ~breakdown,
              type="bar",
              colors = phs_colours(c("phs-blue", "phs-blue-50")),
              hovertemplate = ~paste0(percent, "%",
                                      "<br>Number of people : ", format(data$n, big.mark = ","))) %>%
      layout(barmode = "stack",
             yaxis = list(title = "Percentage (%)",
                          rangemode="tozero",
                          tickfont = list(size=14),
                          titlefont = list(size=18),
                          showline = FALSE,
                          ticksuffix = "%"),
             xaxis = list(title = "Year",
                          tickfont = list(size = 14),
                          titlefont = list(size = 18),
                          showline = TRUE,
                          dtick = 1),
             legend = list(xanchor = "center", valign = "bottom", x = 0.5, y = -0.4, orientation = 'h',
                           tracegroupgap = 20),
             margin = list(t = 90, b = 40),
             hovermode = "x unified") %>%
      config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}



line_chart_function_lw_la = function(data, y_title, x_title = "Year", title = "", label = "Number") {

  yaxis_number[["title"]] = y_title
  xaxis_year[["title"]] = x_title

  ylim <- round(data$measure_value/10)*10

  plot_ly(data = data) %>%
    add_trace(x=~date,
              y=~indicator,
              type = "scatter",
              mode = "lines",
              line = list(color = phs_colours("phs-purple")),
              name = glue("{label}"),
              hovertemplate = ~glue("{format(round_half_up(indicator, 2), big.mark=',')}{ifelse(label == 'Percentage','%','')}")) %>%
    layout(xaxis = xaxis_year,
           yaxis = list(title = "Percentage", range = c(0,ylim), ticksuffix = "%"),
           title = list(text = str_wrap(title, width = 60), font = list(size =16, color = "#4B006E", family = "Arial")),
           margin = list(t = 90, b = 40),
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           hovermode = "x unified") %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}
