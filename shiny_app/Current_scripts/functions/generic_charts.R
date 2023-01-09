## Generic Chart Functions

# These functions should be able to apply to multiple datasets to easily produce a similar style chart


# Confidence interval line chart
# This creates a line chart with one geographic area, showing a line chart over time
# The CIs show as a shaded area
# Must be named x = "date", y = "indicator", "upper_confidence_interval" and
# "lower_confidence_interval"
confidence_line_function = function(data, y_title) {

  yaxis_number[["title"]] = y_title

  plot_ly(data = data) %>%
    add_trace(x=~date,
              y=~upper_confidence_interval,
              type = "scatter",
              mode = "lines",
              line = list(color = 'transparent'),
              name = "upper bound",
              showlegend = FALSE) %>%
    add_trace(x=~date, y=~lower_confidence_interval,
              type = "scatter",
              mode = "lines",
              fill = 'tonexty',
              fillcolor = phsstyles::phs_colours("phs-purple-10"),
              line = list(color = 'transparent'),
              name = "lower bound",
              showlegend = FALSE) %>%
    add_trace(x=~date,
              y=~indicator,
              type = "scatter",
              mode = "lines",
              name = "Age-sex standardised rates per 100,000",
              line = list(color = phsstyles::phs_colours("phs-purple")),
              showlegend = TRUE) %>%
    layout(xaxis = xaxis_year, yaxis = yaxis_number) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}





line_chart_function = function(data, y_title) {

  yaxis_number[["title"]] = y_title

  plot_ly(data = data) %>%
    add_trace(x=~date,
              y=~indicator,
              type = "scatter",
              mode = "lines",
              line = list(color = phs_colours("phs-purple"))) %>%
    layout(xaxis = xaxis_year, yaxis = yaxis_number) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}


stacked_bar_function = function(data, category_var) {

  data %>%
  plot_ly(x=~date,
          y=~proportion*100,
          color = ~category_var,
          colors = phs_colours(c('phs-purple', 'phs-magenta', 'phs-blue', 'phs-green')),
          type = 'bar') %>%
    layout(barmode = "stack",
           xaxis = xaxis_finyear,
           yaxis = list(title = "Proportion",
                        rangemode="tozero",
                        fixedrange=TRUE,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        ticksuffix = "%")) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}
