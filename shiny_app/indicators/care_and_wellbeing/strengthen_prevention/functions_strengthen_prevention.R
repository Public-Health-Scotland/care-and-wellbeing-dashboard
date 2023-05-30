confidence_line_function_pm = function(data, y_title, x_title = "Year range", title = "") {

  yaxis_number[["title"]] = y_title
  xaxis_year[["title"]] = x_title

  plot_ly(data = data) %>%

    add_trace(x=~date, y=~lower_confidence_interval,
              type = "scatter",
              mode = "lines",
              line = list(color = 'transparent'),
              name = "Lower confidence interval",
              showlegend = TRUE,
              hovertemplate = ~glue("{lower_confidence_interval %>% round_half_up(2)}"),
              hoverinfo = "none",
              textposition = "none",
              legendgroup = "z_confidence_interval") %>%
    add_trace(x=~date,
              y=~upper_confidence_interval,
              type = "scatter",
              mode = "lines",
              fill = 'tonexty',
              fillcolor = phsstyles::phs_colours("phs-liberty-30"),
              line = list(color = 'transparent'),
              name = "Upper confidence interval",
              showlegend = TRUE,
              hovertemplate = ~glue("{upper_confidence_interval %>% round_half_up(2)}"),
              hoverinfo = "none",
              textposition = "none",
              legendgroup = "z_confidence_interval") %>%
    add_trace(x=~date,
              y=~indicator,
              type = "scatter",
              mode = "lines",
              name = "Rate",
              line = list(color = phsstyles::phs_colours("phs-purple")),
              showlegend = TRUE,
              hovertemplate = ~glue("{indicator %>% round_half_up(2)}"),
              hoverinfo = "text",
              textposition = "none",
              legendgroup = "rate") %>%
    layout(xaxis = xaxis_year,
           yaxis = list(title = y_title,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        fixedrange=FALSE,
                        showlegend = T),
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified") %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}
