##############################################.
# CHILD POVERTY FUNCTIONS----
##############################################.

child_poverty_plot = function(data) {
  data %<>%
    pivot_wider(names_from = Group, values_from = proportion) %>%
    clean_names()

  data %>%
    plot_ly(x=~financial_year,
            y=~children*100,
            type="scatter",
            mode="lines+markers",
            line = list(color=palette[1]),
            marker = list(color=palette[1]),
            name = "Children",
            text = paste0(data$financial_year, "<br>",
                          "Proportion of children: ",
                          scales::percent(data$children, accuracy = .1),
                          "<br>",
                          "Proportion of all ages: ",
                          scales::percent(data$all_people, accuracy = .1)),
            hoverinfo = 'text') %>%
    add_trace(x=~financial_year,
              y=~all_people*100,
              type="scatter",
              mode="lines+markers",
              line = list(color=palette[2]),
              marker = list(color=palette[2]),
              name = "All Ages",
              text = paste0(data$financial_year, "<br>",
                            "Proportion of children: ",
                            scales::percent(data$children, accuracy = .1),
                            "<br>",
                            "Proportion of all ages: ",
                            scales::percent(data$all_people, accuracy = .1)),
              hoverinfo = 'text') %>%
    layout(xaxis = xaxis_finyear,
           yaxis = yaxis_proportion,
           legend = list(bgcolor = "#E2E2E2",
                         title = list(
                           text = "Filter chart"),
                         xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}


##############################################.
# POSITIVE DESTINATION OF SCHOOL LEAVERS FUNCTIONS ----
##############################################.

school_leavers_plot_line = function(data) {
  data %>%
    plot_ly(x=~financial_year,
            y=~percent,
            type="scatter",
            mode="lines+markers",
            color = data$characteristic,
            colors = palette,
            text = paste0(data$characteristic, "<br>", data$financial_year, "<br>",
                          "School leavers (%)", data$percent,"% <br>"),
            hoverinfo = "text") %>%
    layout(xaxis = list(title = "Financial year"),
           yaxis = list(title = "School leavers (%)", range = c(0,100), ticksuffix = "%"),
           title = title,
           legend = list(bgcolor = 'rgba(0,0,0,0)', title = list(text = "<b>Double click on one legend <br>to isolate one trace</b>"),
                         xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}



##############################################.
# PRE-SCHOOL DEVELOPMENT FUNCTIONS----
##############################################.

preschool_plot_line = function(data, data_baseline, baseline = FALSE,
                               geog_name = NA, baseline_name) {
  plot = data %>%
    plot_ly(x=~financial_year,
            y=~prop_concern_any*100,
            type="scatter",
            mode="lines+markers",
            line = list(color=palette[1]),
            marker = list(color=palette[1]),
            text = paste0(data$financial_year, "<br>",
                          "Proportion of reviews with any concern: ",
                          scales::percent(data$prop_concern_any, accuracy = .1),"<br>",
                          "Number of reviews with any concern: ",
                          format(data$concern_any), big.mark = ","),
            hoverinfo = "text",
            name = geog_name) %>%
    layout(xaxis = xaxis_finyear,
           yaxis = yaxis_proportion,
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


  if (baseline) {
    plot = plot %>%
      add_trace(data = data_baseline,
                x=~financial_year,
                y=~prop_concern_any*100,
                type="scatter",
                mode="lines+markers",
                line = list(color=palette[2]),
                marker = list(color=palette[2]),
                text = paste0(data_baseline$financial_year, "<br>",
                              "Proportion of reviews with any concern: ",
                              scales::percent(data_baseline$prop_concern_any, accuracy = .1),"<br>",
                              "Number of reviews with any concern: ",
                              format(data_baseline$concern_any), big.mark = ","),
                hoverinfo = "text",
                name = baseline_name)
  }

  return(plot)
}


preschool_plot_line2 = function(data) {
  plot = data %>%
    plot_ly(x=~financial_year,
            y=~prop_concern_any*100,
            type="scatter",
            mode="lines+markers",
            color = data$geography,
            colors = palette,
            text = paste0(data$geography, "<br>", data$financial_year, "<br>",
                          "Proportion of reviews with any concern: ",
                          scales::percent(data$prop_concern_any, accuracy = .1),"<br>",
                          "Number of reviews with any concern: ",
                          format(data$concern_any, big.mark = ",")),
            hoverinfo = "text") %>%
    layout(xaxis = xaxis_finyear,
           yaxis = yaxis_proportion,
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}



##############################################.
# CAMHS WAITING TIMES FUNCTIONS----
##############################################.

camhs_plot_line = function(data, vline=TRUE) {
  p = data %>%
    plot_ly(x=~date,
            y=~proportion*100,
            type = "scatter",
            mode = "lines+markers",
            line = list(color=palette[1]),
            marker = list(color=palette[1]),
            text = paste0(format(data$date, "%B %Y"), "<br>",
                          "Proportion of patients seen within 18 weeks: ",
                          scales::percent(data$proportion, accuracy = .1),
                          "<br>",
                          "Number of patients seen within 18 weeks: ",
                          format(data$number, big.mark = ",")),
            hoverinfo = "text",
            name = "Proportion of patients seen in 18 weeks") %>%
    layout(xaxis = xaxis_month,
           yaxis = yaxis_proportion,
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


camhs_plot_stacked_bar = function(data) {
  data %>%
    mutate(wait_time = factor(wait_time, levels = c("0 to 18 weeks",
                                                    "19 to 35 weeks",
                                                    "36 to 52 weeks",
                                                    "Over 52 weeks"))) %>%
    plot_ly(x=~date,
            y=~proportion*100,
            color = ~wait_time,
            type = 'bar',
            colors = palette_camhs,
            marker = list(line = list(width=1,
                                      color = 'rgb(0,0,0)')),
            text = paste0(format(data$date, "%B %Y"), "<br>",
                          data$wait_time, "<br>",
                          "Proportion of patients seen: ",
                          scales::percent(data$proportion, accuracy = .1),"<br>",
                          "Number of patients seen: ",
                          format(data$number, big.mark = ",")),
            hoverinfo = "text") %>%
    layout(barmode = "stack",
           bargap = 0,
           xaxis = xaxis_month,
           yaxis = list(title = "Proportion",
                        rangemode="tozero",
                        fixedrange=TRUE,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        ticksuffix = "%"),
           legend = list(bgcolor = "#E2E2E2",
                         title = list(
                           text = "Filter wait time"),
                         xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')
           ) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


}



##############################################.
# PROTECTION FROM HARM FUNCTIONS----
##############################################.


protection_from_harm_line_chart = function(data) {

  protect_median = data %>%
    summarise(Median = median(Value)) %>%
    .$Median

  p = data %>%
    plot_ly() %>%
    add_trace(x=~date_end,
              y=~Value,
              type="scatter",
              mode="lines+markers",
              line = list(color = palette[1]),
              marker = list(color = palette[1]),
              showlegend = F,
              text = paste0("Date range: ", format(data$date_start, "%d %B %Y"),
                            " to ",
                            format(data$date_end, "%d %B %Y"), br(),
                            "Number of children: ", data$Value),
              hoverinfo = 'text') %>%
    add_segments(x=min(data$date_end),
                 xend=max(data$date_end),
                 type = "scatter",
                 mode = "lines",
                 inherit = F,
                 y=protect_median,
                 yend = protect_median,
                 name = "Median",
                 line = list(color = palette[3], type = "dash"),
                 showlegend = T) %>%
    layout(xaxis = list(title = "Fortnight Ending (Wednesdays)",
                        type = 'date',
                        tickformat = "%b<br>%Y",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = TRUE,
                        fixedrange=TRUE),
           yaxis = list(title = "Number of children subject to\ninteragency referral discussions",
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = TRUE,
                        fixedrange=TRUE,
                        range = c(0,max(data$Value)),
                        showlegend = T),
           legend = list(xanchor = "center", x = 0.5, y = -0.3, orientation = 'h')) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


  p %<>%
    add_vline_seg(., "2020-03-20", data$Value, "Schools to close (COVID-19 measures)", phs_colours("phs-rust"), group = "Schools close (COVID-19 measures)") %>%
    add_vline_seg(., "2020-08-11", data$Value, "Pupils return to school (COVID-19 measures)", phs_colours("phs-teal"), group = "Schools reopen (COVID-19 measures)") %>%
    add_vline_seg(., "2021-01-05", data$Value, "Schools to close (COVID-19 measures)", phs_colours("phs-rust"), group = "Schools close (COVID-19 measures)") %>%
    add_vline_seg(., "2021-03-15", data$Value, "Pupils return to school (COVID-19 measures)", phs_colours("phs-teal"), group = "Schools reopen (COVID-19 measures)")




  return(p)

}


