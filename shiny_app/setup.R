####################### Setup #######################

##############################################.
# LOAD PACKAGES ----
##############################################.
library(dplyr) #data manipulation
library(plotly) #charts
library(shiny)
library(shinyWidgets)
library(tidyr)
library(magrittr)
library(shinyjs)
library(phsstyles)
library(shinyBS)
library(shinycssloaders)
library(stringr)
library(janitor)
library(shinydashboard)
library(shiny)
library(flextable)
library(readxl)
library(DT)
library(htmltools)
library(leaflet)
library(lubridate)

##############################################
# LOAD FUNCTIONS ----
##############################################.

source("functions/Functions.R")




## Plotting ----
# Style of x and y axis
xaxis_plots <- list(title = FALSE, tickfont = list(size=14), titlefont = list(size=14),
                    showline = TRUE, fixedrange=TRUE)

yaxis_plots <- list(title = FALSE, rangemode="tozero", fixedrange=TRUE, size = 4,
                    tickfont = list(size=14), titlefont = list(size=14))

# Buttons to remove from plotly plots
bttn_remove <-  list('select2d', 'lasso2d', 'zoomIn2d', 'zoomOut2d',
                     'autoScale2d',   'toggleSpikelines',  'hoverCompareCartesian',
                     'hoverClosestCartesian')

##############################################.
# LOAD DATA ----
##############################################.

# Reads in all RDS files from the data folder
data_files = list.files("data") %>%
  as_tibble() %>%
  filter(str_detect(value, ".rds"))

for (file in data_files$value) {
  data = readRDS(paste0("data/", file))
  name = gsub(".rds", "", file)
  assign(name, data)
}

##############################################.
# Set-Up ----
##############################################.

section_lookup = read_excel("data/tab values.xlsx") %>%
  mutate(Indicator = title)

summary_final <- summary_table %>%
  mutate(geography_type = ifelse(is.na(geography_type), "Scotland", geography_type),
         geography = ifelse(is.na(geography), "Scotland", geography))



##############################################.
# CREATE OBJECTS USED IN OUTPUTS ----
##############################################.

master_lookup = master_lookup %>%
  arrange(hb2019name)
lookup_HB = c("Scotland", master_lookup$hb2019name) %>%
  unique()

lookup_LA = master_lookup %>%
  arrange(ca2019name) %>%
  .$ca2019name %>%
  unique()

lookup_HSCP = master_lookup$hb2019name %>%
  unique()

# Getting just 0-18 weeks prop
camhs_filtered_table = camhs_waiting_times2 %>%
  filter(wait_time == "0 to 18 weeks")


##############################################.
# PLOTLY PARAMETERS ----
##############################################.

# Buttons to remove
bttn_remove <-  list('select2d',
                     'lasso2d',
                     'zoomIn2d',
                     'zoomOut2d',
                     'autoScale2d',
                     'toggleSpikelines',
                     'hoverCompareCartesian',
                     'hoverClosestCartesian')

palette = phs_colours(c('phs-purple', 'phs-magenta', 'phs-teal', 'phs-blue', 'phs-green', 'phs-graphite'))
palette_camhs = phs_colours(c('phs-purple', 'phs-magenta', 'phs-teal', 'phs-blue'))

# X axis style when data are by month
xaxis_month <- list(title = "Month",
                    type = 'date',
                    tickformat = "%b<br>%Y",
                    tickfont = list(size=14),
                    titlefont = list(size=18),
                    showline = TRUE,
                    fixedrange=TRUE)

# X axis for financial year
xaxis_finyear = list(title = "Financial year",
                     tickfont = list(size=14),
                     titlefont = list(size=18),
                     showline = TRUE,
                     fixedrange=TRUE)


# X axis for year
xaxis_year = list(title = "Year",
                  tickfont = list(size=14),
                  titlefont = list(size=18),
                  showline = TRUE,
                  fixedrange=TRUE)

# Y axis style for % format
yaxis_proportion = list(title = "Proportion",
                        rangemode="tozero",
                        fixedrange=TRUE,
                        tickfont = list(size=14),
                        titlefont = list(size=18),
                        showline = FALSE,
                        ticksuffix = "%",
                        range=c(0,100))

yaxis_number = list(title = FALSE,
                    rangemode="tozero",
                    fixedrange=TRUE,
                    tickfont = list(size=14),
                    titlefont = list(size=18),
                    showline = FALSE)




