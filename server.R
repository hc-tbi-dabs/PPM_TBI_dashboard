
## ~~~~~~~~~~ SERVER ~~~~~~~~~~~ ##

# Created by: Sijia Wang
# Team: Data Analytics and Business Solutions (DABS)
# Version: 1.0
# Last modified: 2020-03-24
# Description: Server logic for TBI project management dashboard

server <- function(session, input, output) {
  
  runjs('document.getElementById("lang").onchange = function() {
        if($("#lang").val()=="en") {
        $("#english").show();
        $("#french").hide();
        } else {
        $("#english").hide();
        $("#french").show();
        }
};')
  
  output$variance_en <- renderUI({
    htmlstr <- 
      "<span class='label' style='display:inline-block; font-size:10pt;
    padding:6px 10px 6px 10px; color:white; background-color: %s;'>
    %s
    </span>"
    if(input$project_en=="All") {
      var <- sum(budget[budget$Type=="Total","Budget"]) -
        sum(budget[budget$Type=="Total","Total Forecast"])
    } else {
      var <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,
                               "Budget"]) -
        as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,
                          "Total Forecast"])
    }
    if(is.na(var)) {
      htmlstr <- "<span style='display:inline-block; color:#999999; font-size:10pt;'>N/A</span>"
    } else if(var>0) {
      if(var>=1000) {
        mid <- sprintf("%03d",var %% 1000)
        htmlstr <- sprintf(htmlstr,"#a2bf8a",paste0("+ $",var %/% 1000,",",mid,",000"))
      } else {
        htmlstr <- sprintf(htmlstr,"#a2bf8a",paste0("+ $",var,",000"))
      }
    } else if (var==0) {
      htmlstr <- sprintf(htmlstr,"#999999",paste0("$ 0"))
    } else {
      htmlstr <- sprintf(htmlstr,"#f0807f",paste0("- $",-var,",000"))
    }
    HTML(htmlstr)
  })
  
  output$finance1_en <- renderPlot(bg="transparent",{
    if(input$project_en=="All") {
      d <- data.frame(Project=rep("All",2),
                      Cat=c("Budget","Forecast"),
                      Val=c(sum(budget[budget$Type=="Total","Budget"]),
                            sum(budget[budget$Type=="Total","Total Forecast"])))
    } else {
      bgt <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,"Budget"])
      fcst <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,
                                "Total Forecast"])
      d <- data.frame(Project=rep(input$project_en,2),
                      Cat=c("Budget","Forecast"),
                      Val=c(bgt,fcst))
    }
    p <- ggplot(d,aes(x=input$project_en,y=Val)) +
      geom_bar(aes(fill=Cat),stat="identity",width=0.45,position=position_dodge(width=0.6)) +
      geom_text(aes(label=Val),size=3,position=position_dodge2(width=0.6),vjust=-1) +
      labs(fill="Expense",x="",y="1000s of dollars") +
      ggtitle("Budget vs Total Forecast") +
      theme_minimal() +
      theme(
        plot.title = element_text(hjust=0.5,margin=margin(b=15)),
        axis.title.y = element_text(margin=margin(t=0,r=20,b=0,l=0)),
        panel.background = element_blank(),
        plot.background = element_blank()
      )
    suppressWarnings(print(p))
  })
  
  output$finance2_en <- renderPlotly({
    if(input$project_en=="All") {
      d <- data.frame(Category=factor(c("Actuals","Commitment","Anticipated"),
                                      levels=c("Actuals","Commitment","Anticipated")),
                      Value=c(sum(budget[budget$Type=="Total","Actuals"]),
                              sum(budget[budget$Type=="Total","Commitment"]),
                              sum(budget[budget$Type=="Total","Anticipated"])))
    } else {
      actuals <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,"Actuals"])
      commitment <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,
                                      "Commitment"])
      anticipated <- as.numeric(budget[budget$Type=="Total" & budget$Project==input$project_en,
                                       "Anticipated"])
      d <- data.frame(Category=factor(c("Actuals","Commitment","Anticipated"),
                                      levels=c("Actuals","Commitment","Anticipated")),
                      Value=c(actuals,commitment,anticipated))
    }
    colors <- c("rgb(254,232,154)","rgb(78,163,177)","rgb(162,217,163)")
    fig <- plot_ly(d, labels=~Category, values=~Value, type="pie",
                   textposition="outside",
                   textinfo="label+percent",
                   insidetextfont=list(color="#000000"),
                   hoverinfo="text",
                   hoverlabel=list(bordercolor="#444444"),
                   text=~paste0("$ ",Value*1000),
                   marker=list(colors=colors,line=list(color="rgb(253,253,253)",width=2)),
                   showlegend=FALSE,
                   hole=0.5)
    fig <- fig %>% layout(margin=list(l=40,r=25,b=35,t=60),
                          paper_bgcolor="rgba(245,245,245,0)")
    fig
  })
}