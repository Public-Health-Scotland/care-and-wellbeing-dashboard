# Alt text module server ----
#
# plotInfoServer <- function(id) {
#
#   moduleServer(
#     id,
#     function(input, output, session) {
#
#       modal <- modalDialog(
#         h3("How to interact with the plot"),
#         paste("<ul>",
#               "<li>Move the cursor over the data points to see the data values</li>",
#               "<li>Click the magnifying glass in the top right of the charts to enable zoom capabilities. Then zoom into the plot by holding down the cursor and dragging to select the region</li>",
#               "<li>Click the pan button (four way arrows) in the top right of the charts to enable panning capabilites.Then move the chart around by holding down the cursor and dragging</li>",
#               "<li>Alter the x axis range by dragging the vertical white bars on the left and right of the bottom panel</li>",
#               "<li>Click the home button in the top right to reset the axes</li>",
#               "<li>Single click on legend variables to remove the corresponding trace</li>",
#               "<li>Double click on legend variables to isolate the corresponding trace</li>",
#               "<li>Double click on the legend to restore all traces</li>",
#               "<li>Click the camera icon in the top right to download the plot as a png file</li>",
#               "</ul>",
#         strong("Click again to close.")),
#         size = "l",
#         easyClose = TRUE,
#         fade = TRUE,
#         footer = modalButton("Close")
#       )
#
#       observeEvent(input$plotinfo, { showModal(modal) })
#
#
#     }
#   )
#
# }

plotInfoServer <- function(id, title, content) {

  moduleServer(
    id,
    function(input, output, session) {

      modal <- modalDialog(
        h3(title),
        content,
        size = "l",
        easyClose = TRUE,
        fade = TRUE,
        footer = modalButton("Close")
      )

      observeEvent(input$plotinfo, { showModal(modal) })


    }
  )

}




# summaryButtonUI(ns("plotinfo"),
#                 title = "How to interact with the plot",
#                 content = paste("<ul>",
#                                 "<li>Move the cursor over the data points to see the data values</li>",
#                                 "<li>Click the magnifying glass in the top right of the charts to enable zoom capabilities. Then zoom into the plot by holding down the cursor and dragging to select the region</li>",
#                                 "<li>Click the pan button (four way arrows) in the top right of the charts to enable panning capabilites.Then move the chart around by holding down the cursor and dragging</li>",
#                                 "<li>Alter the x axis range by dragging the vertical white bars on the left and right of the bottom panel</li>",
#                                 "<li>Click the home button in the top right to reset the axes</li>",
#                                 "<li>Single click on legend variables to remove the corresponding trace</li>",
#                                 "<li>Double click on legend variables to isolate the corresponding trace</li>",
#                                 "<li>Double click on the legend to restore all traces</li>",
#                                 "<li>Click the camera icon in the top right to download the plot as a png file</li>",
#                                 "</ul>",
#                                 strong("Click again to close.")),
#                 placement = placement,
#                 label = "Using the plot",
#                 class = "plotinfo-btn"
# )
