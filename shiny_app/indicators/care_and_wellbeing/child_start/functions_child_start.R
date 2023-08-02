
make_child_development_cw_plot = function(data, data_baseline, baseline = FALSE,
                               geog_name = "Scotland", baseline_name = "Scotland",
                               title = "") {

  yaxis_number[["title"]] <- "Percentage (%)"
  xaxis_finyear[["title"]] <- "Year range"

  plot = data %>%
    plot_ly(x=~financial_year,
            y=~prop_concern_any,
            type="scatter",
            mode="lines",
            line = list(color=palette[1]),
            #marker = list(color=palette[1]),
            hovertemplate = paste0(round_half_up(data$prop_concern_any,2 ),"%"),
            # hoverinfo = "text",
            name = geog_name
            ) %>%
    layout(xaxis = c(xaxis_finyear, tickangle = -30),
           yaxis = c(yaxis_number, ticksuffix = "%"),
           margin = list(t = 90, b = 40),
           hovermode = "x unified",
           legend = list(xanchor = "center", x = 0.5, y = -0.4, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)


  if (baseline) {
    plot = plot %>%
      add_trace(data = data_baseline,
                x=~financial_year,
                y=~prop_concern_any,
                type="scatter",
                mode="lines",
                line = list(color=palette[2]),
                #marker = list(color=palette[2]),
                hovertemplate = paste0(round_half_up(data_baseline$prop_concern_any,2),"%"),
                # hoverinfo = "text",
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
            mode="lines",
            color = data$geography,
            colors = palette,
            # text = paste0(data$geography, "<br>", data$financial_year, "<br>",
            #               "Proportion of reviews with any concern: ",
            #               scales::percent(data$prop_concern_any, accuracy = .1),"<br>",
            #               "Number of reviews with any concern: ",
            #               format(data$concern_any, big.mark = ",")),
            # hoverinfo = "text",
            hovertemplate = ~glue("{round_half_up(prop_concern_any*100,2)}")) %>%
    layout(xaxis = c(xaxis_finyear),
           yaxis = yaxis_proportion,
           margin = list(t = 90, b = 40),
           hovermode = "x unified",
           title = list(text = str_wrap("Proportion of health visitor reviews where any form of developmental concern was raised", width = 60), font = title_style)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
}




make_child_development_cw_plot_simd = function(data, data_baseline, baseline = FALSE,
                                               geog_name = "Scotland", baseline_name = "Scotland", 
                                               title = title){
  
  yaxis_number[["title"]] <- "Percentage (%)"
  xaxis_finyear[["title"]] <- "Year range"
  
  
  plot = data %>%
    plot_ly(x= ~financial_year,
            y= ~prop_concern_any,
            name = ~simd_quintile,
            type="scatter",
            mode="lines",
            color = ~simd_quintile,
            colors = palette,
            hovertemplate = paste0(round_half_up(data$prop_concern_any,2 ),"%")
    ) %>%
    
    layout(xaxis = c(xaxis_finyear, tickangle = -30),
           yaxis = c(yaxis_number, ticksuffix = "%"),
           margin = list(t = 90, b = 40),
           hovermode = "x unified",
           legend = list(xanchor = "center", x = 0.5, y = -0.4, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
  
  return(plot)
}




make_child_development_cw_plot_sex <- function(data, data_baseline, baseline = FALSE,
                                                       geog_name = "Scotland", baseline_name = "Scotland", 
                                                       title = title){
  
  yaxis_number[["title"]] <- "Percentage (%)"
  xaxis_finyear[["title"]] <- "Year range"
  
  
  plot = data %>%
    plot_ly(x= ~financial_year,
            y= ~prop_concern_any,
            name = ~sex,
            type="scatter",
            mode="lines",
            color = ~sex,
            colors = palette,
            hovertemplate = paste0(round_half_up(data$prop_concern_any,2 ),"%")
    ) %>%
    
    layout(xaxis = c(xaxis_finyear, tickangle = -30),
           yaxis = c(yaxis_number, ticksuffix = "%"),
           margin = list(t = 90, b = 40),
           hovermode = "x unified",
           legend = list(xanchor = "center", x = 0.5, y = -0.4, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
  
  return(plot)
}


make_child_development_cw_plot_ethnicity <- function(data, data_baseline, baseline = FALSE,
                                               geog_name = "Scotland", baseline_name = "Scotland", 
                                               title = title){
  
  yaxis_number[["title"]] <- "Percentage (%)"
  xaxis_finyear[["title"]] <- "Year range"
  
  
  plot = data %>%
    plot_ly(x= ~financial_year,
            y= ~prop_concern_any,
            name = ~ethnicity,
            type="scatter",
            mode="lines",
            color = ~ethnicity,
            colors = palette,
            hovertemplate = paste0(round_half_up(data$prop_concern_any,2 ),"%")
    ) %>%
    
    layout(xaxis = c(xaxis_finyear, tickangle = -30),
           yaxis = c(yaxis_number, ticksuffix = "%"),
           margin = list(t = 90, b = 40),
           hovermode = "x unified",
           legend = list(xanchor = "center", x = 0.5, y = -0.4, orientation = 'h'),
           title = list(text = str_wrap(title, width = 60), font = title_style)) %>%
    config(displaylogo = F, displayModeBar = TRUE, modeBarButtonsToRemove = bttn_remove)
  
  return(plot)
}




