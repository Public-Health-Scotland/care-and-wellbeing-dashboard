
make_child_development_cw_plot = function(data, data_baseline, baseline = FALSE,
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
           yaxis = yaxis_proportion) %>%
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


make_child_development_cw_plot_2 = function(data) {
  yaxis_proportion[["range"]]= c(0,40)
  plot = data %>%
    plot_ly(x=~financial_year,
            y=~prop_concern_any*100,
            type="scatter",
            mode="lines+markers",
            color = data$geography,
            colors = palette,
            # text = paste0(data$geography, "<br>", data$financial_year, "<br>",
            #               "Proportion of reviews with any concern: ",
            #               scales::percent(data$prop_concern_any, accuracy = .1),"<br>",
            #               "Number of reviews with any concern: ",
            #               format(data$concern_any, big.mark = ",")),
            # hoverinfo = "text",
            hovertemplate = ~glue("{round_half_up(prop_concern_any*100,2)}")) %>%
    layout(xaxis = xaxis_finyear,
           yaxis = yaxis_proportion,
           margin = list(t = 90, b = 40),
           hovermode = "x unified",
           title = list(text = str_wrap("Proportion of health visitor reviews where any form of developmental concern was raised", width = 60), font = title_style)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}

