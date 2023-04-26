####################### Core functions #######################

# Add n linebreaks
linebreaks <- function(n){HTML(strrep(br(), n))}

# Remove warnings from icons
icon_no_warning_fn = function(icon_name) {
  icon(icon_name, verify_fa=FALSE)
}

# Generic data table
make_table <- function(input_data_table,
                       rows_to_display = 20
){

  # Take out underscores in column names for display purposes
  table_colnames  <-  gsub("_", " ", colnames(input_data_table))

  dt <- DT::datatable(input_data_table, style = 'bootstrap',
                      class = 'table-bordered table-condensed',
                      rownames = FALSE,
                      filter="top",
                      colnames = table_colnames,
                      options = list(pageLength = rows_to_display,
                                     scrollX = FALSE,
                                     scrollY = FALSE,
                                     dom = 'tip',
                                     autoWidth = TRUE,
                                     # style header
                                     initComplete = htmlwidgets::JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#C5C3DA', 'color': '#3F3685'});",
                                       "$(this.api().table().row().index()).css({'background-color': '#C5C3DA', 'color': '#3F3685'});",
                                       "}")))


  return(dt)
}

# Pretty numbers

pretty_big_numbers = function(data, columns) {
  if(is.null(columns))
  {
    return(data)
  }

  data %<>%
    mutate_at(columns, ~format(., big.mark = ","))
}

pretty_decimal_numbers = function(data, columns) {
  if(is.null(columns))
  {
    return(data)
  }

  data %<>%
    mutate_at(columns, ~format(round_half_up(., 2)), 2)
}


###### Select area for dropdown function

select_choice <- function(input) {

  choice <- ifelse(input == "Scotland", "area", input)

  return(choice)

}

####################### Filter functions #######################


# Filter a dataframe to health board function
hb_filter_table = function(data, health_board) {
  data_filtered = data %>%
    filter(hb2019name == health_board)
}

# Filter a dataframe to ROA region function
region_filter_table = function(data, region_of_interest) {
  data_filtered = data %>%
    filter(region == region_of_interest)
}

# Filter a dataframe to geography type and geography
geog_all_filter_table = function(data, geog_type, geog_name) {
  data %<>%
    filter(geography_type == geog_type,
           geography == geog_name)

}



####################### Data download function #######################

datatable_style_download = function(data,
                                    datetype = "month",
                                    data_name,
                                    geogtype = "health_board") {

  # Set NULL as standard in case none
  decimals = NULL
  commas = NULL

  if(datetype == "month") {
    data  %<>%
      mutate(date = format(date, "%B %Y"))
  }

  if(data_name == "camhs") {
    decimals = c(6)
    commas = c(3, 5)
  } else if (data_name == "infant") {
    decimals = c(5)
    commas = c(3, 4)
  } else if(data_name == "preschool") {
    decimals = c("Proportion")
    commas = c("Number Of Reviews", "Concern Any")
  } else if (data_name == "child_poverty") {
    decimals = c("Proportion Of People In Relative Poverty")
    commas = NULL
    data %<>%
      rename("Proportion Of People In Relative Poverty" = "proportion")
  } else if (data_name == "fuel_number") {
    decimals = NULL
    commas = c(5)
  } else if (data_name == "employees_living_wage") {
    decimals = NULL
    commas = c(5)
  } else if (data_name == "gender_pay_gap") {
    decimals =  NULL
    commas = c(5)
  } else if (data_name == "disability_employment_gap") {
    decimals =  NULL
    commas = c(4)
    data %<>%
      select(-c(ca2019))
  } else if (data_name == "ethnicity_employment_gap_chart") {
    decimals =  NULL
    commas = c(4)

  } else if (data_name == "unmanageable_debt") {
    decimals =  NULL
    commas = NULL

    data %<>%
      rename("household with unmanageable debt (%)" = "perc_with_problem_debt")

  } else if (data_name == "savings_low_income") {
    decimals =  NULL
    commas = c(5)
    data %<>%
      select(-c(ca2019))
  } else if(data_name == "childcare_uptake") {

    commas = c(2,3)
    data %<>%
      mutate(percent = round(percent*100, 1))

  } else if (data_name == "employability_FSS_referral") {
    decimals =  NULL
    commas = c(2,3)
    data %<>%
      mutate(start_rate = start_rate*100) %>%
      rename(start_rate_percentage = start_rate)
  } else if (data_name == "skills_shortage_vacancies") {


  } else if (data_name == "zero_hour_contracts") {


  } else if (data_name == "economic_inactivity") {

    commas = c(4)
    decimals = NULL

  } else if (data_name == "underemployment") {

    decimals = c(3)

  } else if (data_name == "school_leavers") {

    decimals = c(4)
  } else if (data_name == "all_cause_mortality") {
    decimals = c(7)
    commas = c(3)
  }

  names(data) = names(data) %>%
    gsub("_", " ", .) %>%
    str_to_title(.)

  if (geogtype == "health_board") {
    data %<>%
      rename("Health Board" = "Hb2019name")
  }

  data %>%
    pretty_big_numbers(., columns = commas) %>%
    pretty_decimal_numbers(., columns = decimals) %>%
    DT::datatable(rownames = FALSE,
                  extensions = 'Buttons',
                  options = list(
                    dom = "Btp",
                    buttons = c('csv', 'excel'),
                    initComplete = JS(
                      "function(settings, json) {",
                      "$(this.api().table().header()).css({'background-color': '#C5C3DA',
                      'color': '#3F3685'});",
                      "}"
                    )
                  ),
                  filter = "top",
                  style = 'bootstrap')

}
