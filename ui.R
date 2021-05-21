#import necessary libraries
library(leaflet)
library(shiny)

#begin UI 
navbarPage(
  "The Critical Depth?",
  position = "fixed-top",
  theme = "critical_depth_custom.css",
  #create first tab page
  tabPanel(
    "Critical Depth",
    fluidPage(
      titlePanel("Sverdrup's Critical Depth Hypothesis"),
      mainPanel(
        h3("The North Atlantic Spring Bloom", style = "color: CornflowerBlue;"),
        HTML("During the spring there is a bloom of phytoplankton. This occurs in the upper water column
          because phytoplankton require sunlight for photosynthesis. This upper section of the ocean, 
          or <b>mixed layer</b>, is separated from the rest of the water column by a strong thermocline, 
          an area of strong temperature differences."),
        br(),
        br(),
        p("During the fall and winter, the ocean starts to cool, which pushes the mixed layer depth deeper
          into the water column. The mixed layer reaches its maximum depth during January and its shallowest
          during July. Also during the winter when the mixed layer depth is deeper, the stratification 
          between the layers is weaker, which allows more nutrients to cross the boundary and 
          enter the upper water column. As the mixed layer depth starts to increase in the spring 
          these extra nutrients are used by the phytoplankton which helps facilitate the spring bloom."),
        br(),
        br(),
        #add figure from of plankton bloom
        img(src = "phytoplankton-bloom-east-coast_1big_landsat_nasa.jpg", width = "60%"),
        br(),
        em("Figure 1: Satellite view of plankton bloom from space by NASA. Source: earth.com"),
        br(),
        br(),
        h3("Sverdrup's Hypothesis", style = "color: CornflowerBlue;"),
        HTML("In 1953, Harald Ulrik Sverdrup published his paper 'On Conditions for the Vernal Blooming
        of Phytoplankton.' This was the paper in which he first proposed the <b>Critical Depth Hypothesis</b>.
        Sverdrup theorized that the spring bloom would occur when the phytoplankton production was greater
        than the loss rate. <b>Phytoplankton production</b> is the gross production (the amount of 
        photosynthesis happening during the day), shown in Figure 2a. This decreases with depth as less
        light penetrates the water column, so there is the greatest production at the surface. 
        <b>Phytoplantkon respiration</b>, or loss, is the amount of carbon being lost by metabolic 
        requirements of phytoplankton and grazing by predators, shown in Figure 2b. For Sverdrup's 
        purposes, he assumed that phytoplankon respiration was constant with depth."),
        br(),
        br()
      )),
    fluidPage(
      #add static graph for phytoplankton growth
      plotOutput("static_critical_depth_growth", width = "600px"),
      
      mainPanel(
        em("Figure 2a: Sverdup's proposed system with phytoplankton production."),
        br(),
        br()),
      
      #add static graph for phytoplankton loss
      plotOutput("static_critical_depth_loss", width = "600px"),
      
      mainPanel(
        br(),
        br(),
        em("Figure 2b: Sverdrup's proposed system with phytoplankton loss."),
        br(),
        br(),
        HTML("He used data gathered by a moored weather ship in the Norwegian sea (Figure 3). The ship gathered
          data in the spring of 1949 during which they counted phytoplankton and recorded the thickness
          of the mixed layer. Using this data, Sverdrup concluded that the spring phytoplankton bloom
          occurs when the mixed layer depth is less than a defined <b>critical depth</b>."),
        br(),
        br()
      ),
      #add leaflet map
      leafletOutput("ship_M", width = "60%"),
      mainPanel(
        em("Figure 3: Map with the location of Weather Ship 'M' from Sverdrup's paper"),
        br(),
        br(),
        p("Figure 4 represents the theoretical graph Sverdrup created with the critical depth. Play 
          around with the depth slider to try and find the critical depths (note: these depth values
          are theoretical)."),
        br(),
        br()
        ),
      #create slider for mixing depth values
      sliderInput("critical_depth",
                  label = "Mixed Layer Depth",
                  min = 10,
                  max = 15,
                  value = 10, 
                  step = 0.2,
                  round = FALSE,
                  ticks = FALSE),
      #add interactive graph
      plotOutput("depth_slider", width = "600px"),
      mainPanel(
        em("Figure 4: Interactive plot of Sverdrup's Critical Depth Hypothesis with changeable mixed layer depth."),
        br(),
        br(),
        h3("Sverdrups' Assumptions", style = "color: CornflowerBlue;"),
        HTML("Sverdrup defined the critical depth as the depth of the mixing layer where the phytoplankton
        loss was equal to the production. Sverdrup's Critical Depth Hypothesis is illustrated 
        in Figure 5 below. There are several critical assumptions associated with the Critical Depth 
        Hypothesis: <ul>
             <li>Phytoplankton growth is limited by light in the winter.</li>
             <li>There is an abundance of nutrients before the bloom starts.</li>
             <li>There is not an abundance of grazing on the phytoplankton by predators.</li>
            </ul>"),
        p("These are large assumptions that have been addressed in recent theories on when the spring
          bloom begins in the North Atlantic. Click on the other tabs at the top of the page to learn about how
          these other hypotheses predict when the spring bloom occurs."),
        #add figure from Behrenfeld and Boss 2014
        img(src = "critical_depth_hypothesis.JPG", width = "70%"),
        br(),
        em("Figure 5: Illustration of the Critical Depth Hypothesis from 'Behrenfeld and Boss (2014)
           Resurrecting the Ecological Underpinnings of Ocean Plankton Blooms.'")
      )
    )
  ),
  #create second tab page
  tabPanel(
    "Disturbance-Recovery",
    fluidPage(
      titlePanel("Behrenfeld's Distrubance-Recovery Hypothesis"),
      mainPanel(
        HTML("The common predator of phytoplankton is zooplankton. An assumption of the Critical Depth 
          Hypothesis was that there was negligible grazing by predators on the phytoplankton. In a real 
          ecosystem, as the concentration of prey increases, the concentration of predators also usually
          increases because of the new availability of abundance prey. Behrenfeld realized this and 
          proposed a new hypothesis, the <b>Dilution-Recoupling Hypothesis</b> (later renamed to the 
          Disturbance-Recovery Hypothesis)."),
        br(),
        br(),
        p("This hypothesis proposed that the spring bloom of phytoplankton in the North Atlantic started
          in the early winter, as the mixed depth increased. As the upper layer of the water column 
          got larger, this decreased the concentrations of predators and phytoplankton and thus reduced
          the number of predator prey interactions. With less grazing pressure, the phytoplankton are 
          able to utilize the new nutrients and light to reproduce, so by the spring the bloom is already 
          in full swing When the mixed layer depth starts to decrease, the predator-prey interactions 
          between the phyto- and zooplankton increase. This process is illustrated in Figure 6."),
        #add figure from Beherenfeld and Boss 2014
        img(src = "dilution-recoupling_hypothesis.JPG", width = "70%"),
        br(),
        em("Figure 6: Illustration of the Disturbance-Recovery Hypothesis from 'Behrenfeld and Boss (2014)
           Resurrecting the Ecological Underpinnings of Ocean Plankton Blooms.'")
      )
    )
  ),
  #create third tab page
  tabPanel(
    "Critical Turbulence",
    fluidPage(
      titlePanel("Huisman's The Critical Turbulence Hypothesis"),
      mainPanel(
        HTML("The <b>Critical Turbulence Hypothesis</b> deals with the assumption from the Critical Depth 
          Hypothesis that mixing within the mixed layer was constant, which we know isn't accurate 
          physics. Frequently there will be turbulent mixing that stirs up the mixed layer, but when 
          this turbulent mixing is only moderate or weak, it allows phytoplankton at the surface to 
          photosynthesize and reproduce rapidly. This hypothesis proposes that the spring bloom will 
          occur when the mixed layer depth is at its maximum because the convective mixing ends and there
          is a net heat flux at the surface and thus the bloom is initiated. Figure 7 illustrates
          this process."),
        #add figure from Beherenfeld and Boss 2014
        img(src = "critical_turbulence_hypothesis.JPG", width = "70%"),
        br(),
        em("Figure 7: Illustration of the Critical Turbulence Hypothesis from 'Behrenfeld and Boss (2014)
           Resurrecting the Ecological Underpinnings of Ocean Plankton Blooms.'")
      )
    )
  )
)



