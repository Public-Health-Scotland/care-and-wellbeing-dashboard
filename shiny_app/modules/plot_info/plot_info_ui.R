# ? Buttons for summary tab
summaryButtonUI <- function(id, title, content, placement = "left",
                            # If no label for the button is provided, add screen reader text
                            # explaining the purpose of the button
                            label = HTML(glue("<label class='sr-only'>Click button for more information</label>")),
                            icon = "circle-info", class = "summary-btn"){

  ns <- NS(id)

  popify(bsButton(ns("click"),
                  class = class,
                  label = label,
                  icon = icon(icon),
                  size = "small"),
         title,
         content,
         placement = placement,
         trigger = "click",
         options = list(id = "summary-popover", container = "body", html = "true")
  )

}

# Buttons that go next to plots for how to interact with the plot
plotInfoButtonUI <- function(id, placement = "bottom") {
  ns <- NS(id)

  summaryButtonUI(ns("plotinfo"),
                  title = "How to interact with the plot",
                  content = paste("<ul>",
                                  "<li>Move the cursor over the data points to see the data values</li>",
                                  "<li>Click the magnifying glass in the top right of the charts to enable zoom capabilities. Then zoom into the plot by holding down the cursor and dragging to select the region</li>",
                                  "<li>Click the pan button (four way arrows) in the top right of the charts to enable panning capabilites.Then move the chart around by holding down the cursor and dragging</li>",
                                  "<li>Alter the x axis range by dragging the vertical white bars on the left and right of the bottom panel</li>",
                                  "<li>Click the home button in the top right to reset the axes</li>",
                                  "<li>Single click on legend variables to remove the corresponding trace</li>",
                                  "<li>Double click on legend variables to isolate the corresponding trace</li>",
                                  "<li>Double click on the legend to restore all traces</li>",
                                  "<li>Click the camera icon in the top right to download the plot as a png file</li>",
                                  "</ul>",
                                  strong("Click again to close.")),
                  placement = placement,
                  label = "Using the plot",
                  class = "plotinfo-btn"
  )
}






iButtonUI <- function(id, content = "", placement = "right") {
  ns <- NS(id)

  summaryButtonUI(ns("background"),
                  title = "Background information and source",
                  content = paste(content,
                                  "<br> <br>",
                                  strong("Click again to close.")),
                  placement = placement,
                  class = "plotinfo-btn"
  )
}



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
