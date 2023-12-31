
#### CONFIDENCE INTERVAL DEFINTION ####
ciDefinitionUI <- function(id) {
  ns <- NS(id)

  summaryButtonUI(ns("ci_defintion"),
                  title = "What is a confidence interval?",
                  content = paste("A confidence interval gives an indication of the degree of uncertainty of an estimate,",
                                  "showing the precision of a sample estimate. The 95% confidence intervals are calculated so",
                                  "that if we repeated the study many times, 95% of the time the true unknown value would lie",
                                  "between the lower and upper confidence limits. A wider interval indicates more uncertainty",
                                  "in the estimate. Overlapping confidence intervals indicate that there may not be a true",
                                  "difference between two estimates."),
                  placement = "bottom",
                  label = "What is a confidence interval?",
                  icon = "circle-question",
                  class = "plotinfo-btn"
  )


}

#### SIMD QUINTILE DEFINTION ####

simdQuintileDefinitionUI <- function(id) {
  ns <- NS(id)

  summaryButtonUI(ns("simd_quintile_defintion"),
                  title = "What is Scottish Index of Multiple Deprivation (SIMD)?",
                  content = paste("People have been allocated to different levels of deprivation based on the small area (data zone) in which they live and the",
                                  "<a href = https://simd.scot/#/simd2020/BTTTFTT/9/-4.0000/55.9000/ target = _blank> Scottish Index of Multiple Deprivation (SIMD) (external website) </a>",
                                  "score for that area. SIMD scores are based on data for 8 indicators covering seven topic areas: income, employment, health, education, skills and training, housing, geographic access, and crime.",
                                  "<br> <br>",
                                  "The SIMD identifies deprived areas, not deprived individuals.",
                                  "<br> <br>",
                                  "In this tool we have presented results for people living in different SIMD ‘quintiles’. To produce quintiles, data zones are ranked by their SIMD score",
                                  "then the areas each containing a fifth (20%) of the overall population of Scotland are identified.",
                                  "People living in the most and least deprived areas that each contain a fifth of the population are assigned to SIMD quintile 1 and 5 respectively."),
                  placement = "bottom",
                  label = "What is SIMD?",
                  icon = "circle-question",
                  class = "plotinfo-btn"
  )


}

#### SIMD DECILE DEFINTION ####

simdDecileDefinitionUI <- function(id) {
  ns <- NS(id)

  summaryButtonUI(ns("simd_defintion"),
                  title = "What is the Scottish Index of Multiple Deprivation (SIMD)?",
                  content = paste("People have been allocated to different levels of deprivation based on the small area (data zone) in which they live and the",
                                  "<a href=https://simd.scot/#/simd2020/BTTTFTT/9/-4.0000/55.9000/ target=_blank> Scottish Index of Multiple Deprivation (SIMD) (external website) </a>",
                                  "core for that area. SIMD scores are based on data for 38 indicators covering seven topic areas:",
                                  "income, employment, health, education, skills and training, housing, geographic access, and crime.",
                                  "<br> <br> The SIMD identifies deprived areas, not deprived individuals. <br> <br>",
                                  "In this tab we have presented results for people living in different SIMD ‘deciles’. To produce deciles,",
                                  "data zones are ranked by their SIMD score then the areas each containing a tenth (10%) of the overall population",
                                  "of Scotland are identified. People living in the most and least deprived areas that each contain a tenth of the",
                                  "population are assigned to SIMD quintile 1 and 10 respectively."),
                  placement = "bottom",
                  label = "What is SIMD?",
                  icon = "circle-question",
                  class = "plotinfo-btn"
  )


}


#### WEMWBS DEFINTION ####

wemwbsDefinitionUI <- function(id) {
  ns <- NS(id)

  summaryButtonUI(ns("wemwbs_defintion"),
                  title = "What is the Warwick-Edinburgh Mental Wellbeing Scales  (WEMWBS)?",
                  content = paste("The Warwick-Edinburgh Mental Wellbeing Scales were developed to enable the measuring of mental wellbeing in the general population and the evaluation",
                                  "of projects, programmes and policies which aim to improve mental wellbeing. The 14-item scale WEMWBS has 5 response categories, summed to provide a",
                                  "single score. The items are all worded positively and cover both feeling and functioning aspects of mental wellbeing, thereby making the concept more accessible.",
                                  "<br> <br>",
                                  "More information can be found",
                                  "<a href = https://warwick.ac.uk/fac/sci/med/research/platform/wemwbs target = _blank> here (external website)."),
                  placement = "bottom",
                  label = "What is WEMWBS?",
                  icon = "circle-question",
                  class = "plotinfo-btn"
  )


}
