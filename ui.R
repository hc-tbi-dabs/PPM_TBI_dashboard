
## ~~~~~~~~~~ UI ~~~~~~~~~~~ ##

# Created by: Sijia Wang
# Team: Data Analytics and Business Solutions (DABS)
# Version: 1.0
# Last modified: 2020-03-24
# Description: UI for TBI project management dashboard

ui <- fluidPage(
  useShinyjs(),
  title="TBI-PPM / TIA-GPP",
  class="mainpage",
  tags$head(
    tags$link(rel="stylesheet",type="text/css",href="style.css")
  ),
  div(
    id="content",
    # fluidRow(
    #   column(
    #     width=8,
    #     div(
    #       # p(style="padding-top:3px; font-size:9pt;",
    #       #   "GC > ROEB / DGORAL > POD / DPO")
    #     )
    #   ),
    #   column(
    #     width=4,
    #     div(
    #       style="text-align:right; width:100%;",
    #       HTML("<p style='font-size:10pt;'>Language / langue:&nbsp;
    #          <span><select id='lang'>
    #          <option value='en'>EN</option>
    #          <option value='fr'>FR</option>
    #          </select></span></p>")
    #     )
    #   )
    # ),
    div(
      id="english",
      fluidRow(
        class="header",
        h2(class="title","TBI - PPM Dashboard")
      ),
      fluidRow(
        id="selector_en",
        em("Dashboard for current projects in Technology and Business Innovation"),
        br(),
        br(),
        tags$table(
          tags$tr(
            tags$td(style="padding:0 10px 23px 15px;",
                    tags$strong("Select a project:")),
            tags$td(selectInput(inputId="project_en",label=NULL,width="440px",
                                choices=c("All",health$Project)))
          )
        )
      ),
      fluidRow(
        class="subheader",
        h4(class="subtitle","Progress")
      ),
      fluidRow(
        uiOutput(outputId="progress_en") %>% withSpinner(color="#999999")
      ),
      fluidRow(
        class="subheader",
        h4(class="subtitle","Finances")
      ),
      br(),
      fluidRow(
        style="margin:5px;",
        column(
          width=6,
          div(plotOutput(outputId="finance1_en",height="380px") %>% withSpinner(color="#999999")),
          div(
            style="text-align:center;",
            div(style="display:inline-block; font-size:10pt; margin-right:5px;","Variance:"),
            div(style="display:inline-block;",uiOutput("variance_en"))
          )          
        ),
        column(
          width=6,
          wellPanel(
            style="padding:0; background-color:#fffbf0;",
            h5(style="padding:13px 0 5px 30px;","Breakdown of Forecasted Expenditures"),
            plotlyOutput(outputId="finance2_en",
                         width="100%",height="300px") %>% withSpinner(color="#999999"),
            br(),
            p(style="font-size:8pt; margin:0 0 20px 0; text-align:center;",
              "Hover over to view dollar amounts")
          )
        )
      )
    ),
    div(
      id="french",
      style="display:none;",
      fluidRow(
        class="header",
        h2(class="title","TIA - Tableau de bord pour la gpp")
      ),
      fluidRow(
        id="selector_fr",
        tags$em("Tableau de bord pour les projets actuels en Technologie et Innovation des affaires"),
        br(),
        br(),
        tags$table(
          tags$tr(
            tags$td(style="padding:0 10px 23px 15px;",
                    tags$strong("Sélectionnez un projet:")),
            tags$td(selectInput(inputId="project_fr",label=NULL,
                                choices=c("Tout"="tout")))
          )
        )
      ),
      fluidRow(
        class="subheader",
        h4(class="subtitle","Progrès")
      ),
      fluidRow(
        uiOutput(outputId="progress_fr") %>% withSpinner(color="#999999")
      ),
      fluidRow(
        class="subheader",
        h4(class="subtitle","Financement")
      ),
      br(),
      fluidRow(
        style="margin:5px;",
        column(
          width=6,
          uiOutput(outputId="finance1_fr") %>% withSpinner(color="#999999")
        ),
        column(
          width=6,
          wellPanel(
            uiOutput(outputId="finance2_fr") %>% withSpinner(color="#999999")
          )
        )
      )
    )
  )
)