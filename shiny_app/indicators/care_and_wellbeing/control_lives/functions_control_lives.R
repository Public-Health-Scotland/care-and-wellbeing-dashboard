
##############################################.
# CAMHS waiting times----
##############################################.
make_camhs_waiting_times_cw_line_plot = function(data, vline=TRUE, title) {

  yaxis_proportion[["title"]] = "Percentage"

  p = data %>%
    plot_ly(x=~date,
            y=~proportion*100,
            type = "scatter",
            mode = "lines+markers",
            line = list(color=palette[1]),
            marker = list(color=palette[1]),
            text = paste0(format(data$date, "%B %Y"), "<br>",
                          "Percentage of patients seen within 18 weeks: ",
                          scales::percent(data$proportion, accuracy = .1),
                          "<br>",
                          "Number of patients seen within 18 weeks: ",
                          format(data$number, big.mark = ",")),
            hoverinfo = "text",
            name = "Percentage of patients seen in 18 weeks") %>%
    layout(xaxis = list(title = "Month",
                        type = 'date',
                        tickformat = "%b<br>%Y",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        range =
                          c(as.numeric(as.POSIXct("2012-07-01", format="%Y-%m-%d"))*1000,
                            as.numeric(as.POSIXct("2021-12-31", format="%Y-%m-%d"))*1000),
                        showline = TRUE),
           yaxis = yaxis_proportion,
           title = list(text = str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified",
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


  p %<>%
    add_segments(data=NULL, inherit = FALSE, text = NULL, hoverinfo = "text",
                 x = min(data$date), xend = max(data$date), y = 90, yend=90,
                 type = "line",
                 name = "Scottish Government Target",
                 line = list(color = "#C73918",width=1,dash = "dash"))

  if (vline) {

    xs = c("2020-03-24", "2021-01-05", "2021-12-05")


    fracs <- unlist(purrr::map(.x=xs,
                               .f= ~ as.numeric(as.Date(.x) - min(data$date))/as.numeric(max(data$date - min(data$date)))))

    p %<>%
      add_lines_and_notes(xs=xs,
                          ys=c(0.1, 0.2, 0.3),
                          fracs = fracs,
                          notes = c("1st<br>Lockdown", "2nd<br>Lockdown", "3rd<br>Lockdown"),
                          colors = (c(phs_colours("phs-teal"), phs_colours("phs-purple"),
                                      phs_colours("phs-blue"))))

  }
  return(p)

}


make_camhs_waiting_times_cw_bar_plot = function(data, title) {
  data %>%
    mutate(wait_time = factor(wait_time, levels = c("0 to 18 weeks",
                                                    "19 to 35 weeks",
                                                    "36 to 52 weeks",
                                                    "Over 52 weeks"))) %>%
    plot_ly(x=~date,
            y=~proportion*100,
            color = ~wait_time,
            type = 'bar',
            colors = c("#0060a9", phs_colours(c('phs-blue', 'phs-blue-80', 'phs-blue-50'))),
            marker = list(line = list(width=1,
                                      color = 'rgb(0,0,0)')),
            text = paste0(format(data$date, "%B %Y"), "<br>",
                          data$wait_time, "<br>",
                          "Proportion of patients seen: ",
                          scales::percent(data$proportion, accuracy = .1),"<br>",
                          "Number of patients seen: ",
                          format(data$number, big.mark = ",")),
            hovertemplate = ~glue("{round_half_up(proportion*100, 1)}%"),
            hoverinfo = "text",
            textposition = "none") %>%
    layout(barmode = "stack",
           bargap = 0,
           xaxis = xaxis_month,
           yaxis = list(title = "Percentage",
                        rangemode="tozero",
                        fixedrange=TRUE,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        ticksuffix = "%"),
           legend = list(xanchor = "center", x = 0.5,
                         y = -0.3, orientation = 'h',
                         traceorder = "normal"),
           title = list(text =str_wrap(title, width = 60), font = title_style),
           margin = list(t = 90, b = 40),
           hovermode = "x unified"
           ) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


}

