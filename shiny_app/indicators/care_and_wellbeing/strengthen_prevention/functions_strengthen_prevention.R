confidence_line_function_hle = function(data, y_title, x_title = "Year range", title = "") {

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
              name = "Healthy life expectancy",
              line = list(color = phsstyles::phs_colours("phs-purple")),
              showlegend = TRUE,
              hovertemplate = ~glue("{indicator %>% round_half_up(2)}"),
              hoverinfo = "text",
              textposition = "none",
              legendgroup = "rate") %>%
    layout(xaxis = xaxis_year, yaxis = yaxis_number,
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified") %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}

confidence_scatter_function_hle = function(data, y_title, x_title = "Year range", title = "") {

  yaxis_number[["title"]] = y_title
  xaxis_year[["title"]] = x_title

  filtered_data <- data %>%
    filter(geography_type == "Council Area")

  plot_ly(data = filtered_data) %>%

    add_lines(x = ~geography, y = ~indicator,
              line = list(color = "white"),
              name = 'Healthy life expectancy',
              error_y = ~list(array = ErrorBarHeight/2,
                              arrayminus = ErrorBarLowerHeight,
                              symmetric = FALSE,
                              width = 0.5,
                              color = phsstyles::phs_colours("phs-purple")),
              marker = list(color = phsstyles::phs_colours("phs-purple"),
                            size = 5),
              hovertemplate = ~glue("{indicator %>% round_half_up(2)}")) %>%
    add_segments(data=data, inherit = FALSE, text = NULL, hoverinfo = "text",
                 x = min(data$geography), xend = max(data$geography), y = (data %>% filter(geography == "Scotland",
                                                                                           date == "2019-21") %>%
                                                                             .$indicator),
                 yend=(data %>% filter(geography == "Scotland",
                                       date == "2019-21") %>%
                         .$indicator),
                 type = "line",
                 name = "Scotland",
                 line = list(color = "#C73918",width=1,dash = "dash"),
                 hovertemplate = ~glue("{data %>% filter(geography == 'Scotland',
                                       date == '2019-21') %>%
                                       .$indicator %>% round_half_up(2)}")) %>%

    layout(xaxis = xaxis_council_area, yaxis = yaxis_number,
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified") %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}


make_mental_wellbeing_plot <- function(data, y_title, x_title = "Year", title = "") {

  yaxis_number_normal[["title"]] = y_title
  xaxis_year[["title"]] = x_title

  fig = data %>%
    plot_ly(x = ~year,
            y = ~indicator,
            color = ~sex,
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
    layout(yaxis = yaxis_number_normal,
           xaxis = xaxis_year) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


}

confidence_scatter_function_le = function(data, y_title, x_title = "Year range", title = "") {

  yaxis_number[["title"]] = y_title
  xaxis_year[["title"]] = x_title

  filtered_data <- data %>%
    filter(geography_type == "Council Area")

  plot_ly(data = filtered_data) %>%

    add_lines(x = ~geography, y = ~indicator,
              line = list(color = "white"),
              name = 'Life expectancy',
              error_y = ~list(array = ErrorBarHeight/2,
                              arrayminus = ErrorBarLowerHeight,
                              symmetric = FALSE,
                              width = 0.5,
                              color = phsstyles::phs_colours("phs-purple")),
              marker = list(color = phsstyles::phs_colours("phs-purple"),
                            size = 5),
              hovertemplate = ~glue("{indicator %>% round_half_up(2)}")) %>%
    add_segments(data=data, inherit = FALSE, text = NULL, hoverinfo = "text",
                 x = min(data$geography), xend = max(data$geography), y = (data %>% filter(geography == "Scotland",
                                                                                           date == "2019-21") %>%
                                                                             .$indicator),
                 yend=(data %>% filter(geography == "Scotland",
                                       date == "2019-21") %>%
                         .$indicator),
                 type = "line",
                 name = "Scotland",
                 line = list(color = "#C73918",width=1,dash = "dash"),
                 hovertemplate = ~glue("{data %>% filter(geography == 'Scotland',
                                       date == '2019-21') %>%
                                       .$indicator %>% round_half_up(2)}")) %>%

    layout(xaxis = xaxis_council_area, yaxis = yaxis_number,
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified") %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)

}


make_mental_wellbeing_plot <- function(data, y_title, x_title = "Year", title = "") {

  yaxis_number_normal[["title"]] = y_title
  xaxis_year[["title"]] = x_title

  fig = data %>%
    plot_ly(x = ~year,
            y = ~indicator,
            color = ~sex,
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
    layout(yaxis = yaxis_number_normal,
           xaxis = xaxis_year) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


}
