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

# Buttons that go next to maps for how to interact with the map
mapInfoButtonUI <- function(id, placement = "bottom") {
  ns <- NS(id)

  summaryButtonUI(ns("mapinfo"),
                  title = "How to interact with the map",
                  content = paste("<ul>",
                                  "<li>Click an area of the map to get a pop up with the area\\'s name, and the key data.</li>",
                                  "<li>Hold down and move your cursor to pan around the map.</li>",
                                  "<li>Use the \\'+\\' or \\'-\\' buttons in the top left corner of the map to zoom in or out respectively.</li>",
                                  "<li>The map legend is found in the bottom right corner.</li>",
                                  "</ul>",
                                  strong("Click again to close.")),
                  placement = placement,
                  label = "Using the map",
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

