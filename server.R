#import necessary libraries
library(ggplot2)
library(ggforce)
library(leaflet)

#create datasets with coordiantes for geom_segment
dfx <- data.frame(x1 = 5.8, x2 = 5.8, y1 = 10, y2 = 15)
dfy <- data.frame(x1 = 5.3, x2 = 11, y1 = 12.16)

#start the function for the server file
function(input, output, session) {
  
  #static map of phytoplankton growth
  output$static_critical_depth_growth <- renderPlot({
    ggplot() + 
      theme_classic() +
      geom_arc(aes(x0 = 10.3, y0 = 10, r = 5, start = 4.72-2*pi, end = 6.27-2*pi), 
               size = 1, color = "chartreuse3") +
      annotate(geom = "text", x = 6.1, y = 14.25, label = "Phytoplankton Production", fontface = 2,
               size = 5, color = "chartreuse3") + 
      annotate(geom = "text", x = 10.5, y = 10.2, label = "Limit of Mixed Layer", size = 5) + 
      geom_hline(yintercept = 15)+
      geom_hline(yintercept = 10, linetype = "longdash") + 
      ylim(10,15) +
      xlim(5.3,11) + 
      ylab("Depth") +
      ggtitle("Phytoplankton Growth in Sverdrup's Critical Depth Hypothesis", subtitle = "Surface") + 
      theme(axis.text = element_blank(),
            axis.ticks = element_blank(),
            axis.title.x = element_blank(),
            axis.line.x = element_blank(),
            plot.title = element_text(hjust = 0.5, size = 18),
            plot.subtitle = element_text(hjust = 0.02, size = 13),
            axis.line.y = element_line(arrow = grid::arrow(length = unit(0.3, "cm"), ends = "first")))
  })
  
  #static map of phytoplankton loss
  output$static_critical_depth_loss<- renderPlot({
    ggplot() + 
      theme_classic() +
      geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = dfx, color = "red") + 
      annotate(geom = "text", x = 5.5, y = 12.5, label = "Phytoplankton Respiration", fontface = 2, 
               size = 5, angle = '90', color = "red") + 
      annotate(geom = "text", x = 10.5, y = 10.2, label = "Limit of Mixed Layer", size = 5) + 
      geom_hline(yintercept = 15)+
      geom_hline(yintercept = 10, linetype = "longdash") + 
      ylim(10,15) +
      xlim(5.3,11) + 
      ylab("Depth") +
      ggtitle("Phytoplankton Loss in Sverdrup's Critical Depth Hypothesis", subtitle = "Surface") + 
      theme(axis.text = element_blank(),
            axis.ticks = element_blank(),
            axis.title.x = element_blank(),
            axis.line.x = element_blank(),
            plot.title = element_text(hjust = 0.5, size = 18),
            plot.subtitle = element_text(hjust = 0.02, size = 13),
            axis.line.y = element_line(arrow = grid::arrow(length = unit(0.3, "cm"), ends = "first")))
  })
  
  #map with interactive depth slider and if else loop to output message based on slider value
  output$depth_slider <- renderPlot({
    if(input$critical_depth < 12.8){
      ggplot() + 
        theme_classic() +
        geom_arc(aes(x0 = 10.3, y0 = -15, r = 5, start = 4.72-2*pi, end = 6.27-2*pi), size = 1) +
        geom_segment(aes(x = x1, y = -1*y1, xend = x2, yend = -1*y2), data = dfx) + 
        geom_segment(aes(x = x1, y = -1*input$critical_depth, xend = x2, yend = -1*input$critical_depth),
                     linetype = "longdash", data = dfy, color = "chartreuse3") +
        annotate(geom = "text", x = 10, y = -1*input$critical_depth + 0.2, label = "More Production Than Loss",
                 size = 5, color = "chartreuse3") +
        geom_hline(yintercept = -10)+
        ylim(-15,-10) +
        xlim(5.3,11) + 
        ylab("Depth") +
        ggtitle("Drag the slider to find the critical depth!") +
        theme(axis.text = element_blank(),
              axis.ticks = element_blank(),
              axis.title.x = element_blank(),
              axis.line.x = element_blank(),
              plot.title = element_text(hjust = 0.5, size = 18),
              axis.line.y = element_line(arrow = grid::arrow(length = unit(0.3, "cm"), ends = "first")))
    } else if (input$critical_depth == 12.8){
      ggplot() + 
        theme_classic() +
        geom_arc(aes(x0 = 10.3, y0 = -15, r = 5, start = 4.72-2*pi, end = 6.27-2*pi), size = 1) +
        geom_segment(aes(x = x1, y = -1*y1, xend = x2, yend = -1*y2), data = dfx) + 
        geom_segment(aes(x = x1, y = -1*input$critical_depth, xend = x2, yend = -1*input$critical_depth),
                     linetype = "longdash", data = dfy, color = "blue") +
        annotate(geom = "text", x = 10, y = -1*input$critical_depth + 0.2, label = "This is the Critical Depth",
                 size = 5, color = "blue") +
        geom_hline(yintercept = -10)+
        ylim(-15,-10) +
        xlim(5.3,11) + 
        ylab("Depth") +
        ggtitle("Drag the slider to find the critical depth!") +
        theme(axis.text = element_blank(),
              axis.ticks = element_blank(),
              axis.title.x = element_blank(),
              axis.line.x = element_blank(),
              plot.title = element_text(hjust = 0.5, size = 18),
              axis.line.y = element_line(arrow = grid::arrow(length = unit(0.3, "cm"), ends = "first")))
    } else {
      ggplot() + 
        theme_classic() +
        geom_arc(aes(x0 = 10.3, y0 = -15, r = 5, start = 4.72-2*pi, end = 6.27-2*pi), size = 1) +
        geom_segment(aes(x = x1, y = -1*y1, xend = x2, yend = -1*y2), data = dfx) + 
        geom_segment(aes(x = x1, y = -1*input$critical_depth, xend = x2, yend = -1*input$critical_depth),
                     linetype = "longdash", data = dfy, color = "red") +
        annotate(geom = "text", x = 10, y = -1*input$critical_depth + 0.2, label = "More Loss than Production",
                 size = 5, color = "red") +
        geom_hline(yintercept = -10)+
        ylim(-15,-10) +
        xlim(5.3,11) + 
        ylab("Depth") +
        ggtitle("Drag the slider to find the critical depth!") +
        theme(axis.text = element_blank(),
              axis.ticks = element_blank(),
              axis.title.x = element_blank(),
              axis.line.x = element_blank(),
              plot.title = element_text(hjust = 0.5, size = 18),
              axis.line.y = element_line(arrow = grid::arrow(length = unit(0.3, "cm"), ends = "first")))
      
    }
  })
  
  #leaflet map with weather ship M location
  output$ship_M <- renderLeaflet({
    leaflet() %>% 
      addProviderTiles(providers$CartoDB.Positron) %>% 
      setView(lng = 2, lat = 66, zoom = 3.5) %>% 
      addMarkers(lng = 2, lat = 66, popup = "Weather Ship 'M'\n (66°N, 2°E)")
  })
  
}