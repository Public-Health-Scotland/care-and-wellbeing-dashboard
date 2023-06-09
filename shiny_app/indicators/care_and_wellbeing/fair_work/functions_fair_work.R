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
            colors = palette) %>%
            # text = paste0("Sector: ", color_column_option, "<br>",
            #               "Year: ", data$year, "<br>",
            #               "Proportion (%): ", data$measure_value,"% <br>"),
            #hoverinfo = "text") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Proportion (%)", range = c(0,100), ticksuffix = "%"),
           title = list(text = str_wrap(title, width = 60), font = subtitle_style),
           margin = list(t = 90, b = 40),
           #hovermode = "x unified",
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
            name = "Pay Gap (%)")
            #color = color_column_option,
            #colors = palette,
            #text = paste0(data$year, "<br>",
            #              "Pay Gap (Women/Men) (%): ", data$`Pay Gap`,"% <br>"),
            #hoverinfo = "text")

  if(second_axis)
  {
    fig = fig %>% add_trace(x=~year,
                            y=~Men,
                            yaxis = "y2",
                            type="scatter",
                            mode="lines+markers",
                            name = "Men (£)",
                            line = list(dash = 'dash'))
                            # text = paste0("Year: ", data$year, "<br>",
                            #               "Men Median Hourly Earnings (£): ", data$Men," <br>"),
                            #hoverinfo = "text")
    fig = fig %>% add_trace(x=~year,
                            y=~Women,
                            yaxis = "y2",
                            type="scatter",
                            mode="lines+markers",
                            name = "Women (£)",
                            line = list(dash = 'dash')) %>%
                            # text = paste0("Year: ", data$year, "<br>",
                            #               "Women Median Hourly Earnings (£): ", data$Woman," <br>"),
                            #hoverinfo = "text")  %>%
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
           legend = list(x = 1.2, y = 1, bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>")),
           hovermode = "x unified") %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

  fig

}

line_chart_function_pg = function(data, y_title, x_title = "Year", title = "",
                                  label = "Gender Pay Gap", ylim = 100) {

  yaxis_number[["title"]] = y_title
  xaxis_year[["title"]] = x_title

  plot_ly(data = data) %>%
    add_trace(x=~date,
              y=~indicator,
              type = "scatter",
              mode = "lines",
              line = list(color = phs_colours("phs-purple")),
              name = glue("{label}"),
              hovertemplate = ~glue("{format(round_half_up(indicator, 2), big.mark=',')}", "%")) %>%
    layout(xaxis = xaxis_year,
           yaxis = list(title = y_title, range = c(-ylim, ylim), ticksuffix = "%",
                        tickfont = list(size=14), titlefont = list(size=18)),
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           hovermode = "x unified") %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}

make_line_chart_multi_lines_pg <- function(data, x, y, colour, y_axis_title, x_axis_title = "Year",
                                           label = "", title = "", hover_end="",
                                           ylim = 30) {

  plot_ly(data = data,
          x = ~x,
          y = ~y,
          color = ~colour,
          type="scatter",
          mode="lines",
          colors = palette,
          # text = "rate",
          # name = glue("{colour}{label}"), ## unordering factors - levels didn't match legend
          hovertemplate = ~glue("£", "{format(round_half_up(y, 2), big.mark=',')}{hover_end}")

  ) %>%
    layout(yaxis = list(title = y_axis_title,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        fixedrange=FALSE,
                        range = c(0, ylim),
                        showlegend = T),
           xaxis = list(title = x_axis_title,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = TRUE),
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified") %>%
    config(displaylogo = FALSE, displayModeBar = TRUE,
           modeBarButtonsToRemove = bttn_remove)


}


##############################################.
# ECONOMIC INACTIVITY ----
##############################################.

make_economic_inactivity_cw_plot <- function(data, title) {
  fig = data %>%
      plot_ly(x = ~year,
              y = ~percent,
              color = ~breakdown,
              type="bar",
              colors = phs_colours(c("phs-blue", "phs-blue-50")),
              hovertemplate = ~paste0(percent, "%",
                                      "<br>Number of people : ", format(data$n, big.mark = ","))) %>%
      layout(barmode = "stack",
             title = list(text = str_wrap(title, width = 60), font = title_style),
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
