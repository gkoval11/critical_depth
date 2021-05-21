# Waves and Mixing Seminar - Final Project

## Critical Depth Hypothesis Web Application
#### By *Gammon Koval*

Files to launch a web application in R that describe the critical depth hypothesis with interactive examples.

### Contents

1. [Critical_Depth.Rproj](Critical_Depth.Rproj) - R project file
2. [server.R](server.R) - R script file with server portion of code
3. [ui.R](ui.R) - R script file with user interface portion of code
4. [plot.R](plot.R) - R script file with plot used in web app
5. [map.R](map.R) - R script file with map used in web app
6. [www directory](www) - folder containing imbedded images and CSS file for formatting

### Requirements

In addition to R and RStudio, you will need the following R packages:

* shiny
* leaflet
* ggplot2
* ggforce

### How to use

Open Critical_Depth.Rproj and ensure appropriate packages are installed and loaded. To launch the app run the following command in the console:

`shiny::runApp()`

Alternatively, you can open the server.R and ui.R files and select the Run App button that appears in the top bar of the Source pane.

##### **Launch the app in your default browser**

The app will open in an R window by default, but you can open it in a web browser by selecting the Open in Browser button at the top of the R window in which the app is running or by running the following command in the console:

`shiny::runApp(launch.broswer = TRUE)`

**Note:** If you run this command you will have to interrupt the console because it won't know when you close the app.

### Online Access

This app is also currently being hosted on the shinyapps.io website and is available to be viewed by the public at:

 [Critical Depth Web App](https://gkoval11.shinyapps.io/Critical_Depth/)

 If the app is not currently active, please contact it's creator [Gammon Koval](mailto:gkoval@mlml.calstate.edu) and the host instance will be restarted for you to access.
