
## ~~~~~~~~~~ SERVER ~~~~~~~~~~~ ##

# Created by: Sijia Wang
# Team: Data Analytics and Business Solutions (DABS)
# Version: 1.0
# Last modified: 2020-03-31
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
  
  output$progress_en <- renderUI({
    if(input$project_en=="All") {
      htmlstr <-
        "<table class='table table-striped' style='background-color:#fffbf0; font-size:10pt; margin:0 10px;'>
      <thead>
      <tr>
      <th width='32%'>Project</th>
      <th width='28%'>Status</th>
      <th width='20%'>Overall Progress</th>
      <th width='20%'>Anticipated End Date</th>
      </tr>
      </thead>
      <tbody>"
      col1 <-"<td>%s</td>"
      col2 <-
        "<td>
      <span class='label' style='display:inline-block; font-size:10pt;
      padding:6px 10px 6px 10px; color:white; background-color: %s;'>
      %s
      </span>
      </td>"
      col3 <-
        "<td>
      <span style='background-color:%s; width:50%%; margin-top:5px; border-radius:2px;'>
      %s
      </span>
      <span style='margin-top:5px; margin-left:5px;'>%s%%</span>
      </td>"
      col4 <- "<td>%s</td>"
      for(proj in health$Project) {
        tblrow <-"<tr style='font-size:10pt;'>"
        td1 <- sprintf(col1,proj)
        proj.status <- health[health$Project==proj,]$Status[1]
        if(is.na(proj.status)) {
          td2 <- sprintf(col2,"#bbbbbb","N/A")
        } else if(proj.status=="On Track") {
          td2 <- sprintf(col2,"#a2bf8a","On track")
        } else if(proj.status=="Attention Required") {
          td2 <- sprintf(col2,"#fddc81","Attention required")
        } else {
          td2 <- sprintf(col2,"#f0807f","Immediate attention required")
        }
        proj.progress <- mean(progress[progress$Project==proj,]$`% Complete`)
        bar.len <- round(proj.progress/100*25,0)
        if(!is.na(bar.len) & bar.len<1) { bar.len <- 1 }
        if(is.na(proj.progress)) {
          td3 <- "<td style='color:#999999;'>--</td>"
        } else if(proj.progress>75) {
          td3 <- sprintf(col3,"#98abc5",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(proj.progress,0))
        } else if(proj.progress>50) {
          td3 <- sprintf(col3,"#8989a6",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(proj.progress,0))
        } else if(proj.progress>25) {
          td3 <- sprintf(col3,"#6b486b",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(proj.progress,0))
        } else if(proj.progress>0){
          td3 <- sprintf(col3,"#9f5d55",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(proj.progress,0))
        } else {
          td3 <- sprintf(col3,"#d0743c",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(proj.progress,0))
        }
        proj.end <- suppressWarnings(max(progress[progress$Project==proj,]$Planned.End,na.rm=TRUE))
        if(is.finite(proj.end)) {
          td4 <- sprintf(col4,proj.end)
        } else {
          td4 <- "<td style='color:#999999;'>--</td>"
        }
        
        tblrow <- paste0(tblrow,td1,td2,td3,td4,"</tr>")
        htmlstr <- paste0(htmlstr,tblrow)
      }
      htmlstr <- paste0(htmlstr,"</tbody></table>")
      htmlstr2 <- paste0(shiny.header,
                         htmlstr,
                         '</body></html>')
      write(htmlstr2,"www/table.html")
      tags$iframe(src="table.html",width="100%",height="330px",frameborder=0)
    } else {
      topstr <-"<div>"
      tag1 <- "<span class='label' style='display:inline-block; font-size:10pt;
      padding:6px 10px 6px 10px; color:white; background-color:%s;
      margin-right:3px;'>
      %s
      </span>"
      tag2 <- "<span class='label' style='display:inline-block; font-size:10pt;
      padding:6px 10px 6px 10px; color:white; background-color:%s;
      margin-right:3px;'>
      %s%% complete
      </span>"
      tag3 <- "<span class='label' style='display:inline-block; font-size:10pt;
      padding:6px 10px 6px 10px; color:white; background-color:#d9b38c;
      margin-right:3px;'>
      Anticipated end: %s
      </span>"
      proj.status <- health[health$Project==input$project_en,]$Status[1]
      if(is.na(proj.status)) {
        tg1 <- sprintf(tag1,"#bbbbbb","N/A")
      } else if(proj.status=="On Track") {
        tg1 <- sprintf(tag1,"#a2bf8a","On track")
      } else if(proj.status=="Attention Required") {
        tg1 <- sprintf(tag1,"#fddc81","Attention required")
      } else {
        tg1 <- sprintf(tag1,"#f0807f","Immediate attention required")
      }
      proj.progress <- mean(progress[progress$Project==input$project_en,]$`% Complete`)
      if(is.na(proj.progress)) {
        tg2 <- sprintf(tag2,"#bbbbbb","--")
      } else if(proj.progress>75) {
        tg2 <- sprintf(tag2,"#98abc5",round(proj.progress,0))
      } else if(proj.progress>50) {
        tg2 <- sprintf(tag2,"#8989a6",round(proj.progress,0))
      } else if(proj.progress>25) {
        tg2 <- sprintf(tag2,"#6b486b",round(proj.progress,0))
      } else if(proj.progress>0){
        tg2 <- sprintf(tag2,"#9f5d55",round(proj.progress,0))
      } else {
        tg2 <- sprintf(tag2,"#d0743c",round(proj.progress,0))
      }
      proj.end <- suppressWarnings(max(progress[progress$Project==input$project_en,]$Planned.End,
                                       na.rm=TRUE))
      if(is.finite(proj.end)) {
        tg3 <- sprintf(tag3,proj.end)
      } else {
        tg3 <- sprintf(tag3,"--")
      }
      topstr <- paste0(topstr,tg1,tg2,tg3,"</div><br />")
      htmlstr <- "<div>
      <table class='table table-striped'
      style='background-color:#fffbf0; font-size:10pt; margin:0 10px;'>
      <thead>
      <tr>
      <th width='32%'>Deliverable</th>
      <th width='28%'>Status</th>
      <th width='20%'>Overall Progress</th>
      <th width='20%'>Anticipated End Date</th>
      </tr>
      </thead>
      <tbody>"
      col1 <-"<td>%s</td>"
      col2 <-
        "<td>
      <span class='label' style='display:inline-block; font-size:10pt;
      padding:6px 10px 6px 10px; color:white; background-color: %s;'>
      %s
      </span>
      </td>"
      col3 <-
        "<td>
      <span style='background-color:%s; width:50%%; margin-top:5px; border-radius:2px;'>
      %s
      </span>
      <span style='margin-top:5px; margin-left:5px;'>%s%%</span>
      </td>"
      col4 <- "<td>%s</td>"
      
      proj.data <- progress[progress$Project==input$project_en,]
      for(deliv in proj.data$Deliverables) {
        tblrow <-"<tr style='font-size:10pt;'>"
        td1 <- sprintf(col1,deliv)
        
        deliv.progress <- proj.data[proj.data$Deliverables==deliv,]$`% Complete`[1]
        bar.len <- round(deliv.progress/100*25,0)
        if(!is.na(bar.len) & bar.len<1) { bar.len <- 1 }
        if(is.na(deliv.progress)) {
          td3 <- "<td style='color:#999999;'>--</td>"
        } else if(deliv.progress>75) {
          td3 <- sprintf(col3,"#98abc5",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(deliv.progress,0))
        } else if(deliv.progress>50) {
          td3 <- sprintf(col3,"#8989a6",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(deliv.progress,0))
        } else if(deliv.progress>25) {
          td3 <- sprintf(col3,"#6b486b",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(deliv.progress,0))
        } else if(deliv.progress>0){
          td3 <- sprintf(col3,"#9f5d55",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(deliv.progress,0))
        } else {
          td3 <- sprintf(col3,"#d0743c",paste(rep("&nbsp;",bar.len),collapse=""),
                         round(deliv.progress,0))
        }
        deliv.end <- proj.data[proj.data$Deliverables==deliv,]$Planned.End[1]
        if(is.na(deliv.end)) {
          td4 <- "<td style='color:#999999;'>--</td>"
        } else {
          td4 <- sprintf(col4,deliv.end)
        }
        # deliv.act.end <- proj.data[proj.data$Deliverables==deliv,]$Actual.End[1]
        # if(is.na(deliv.end) | is.na(deliv.act.end)) {
        #   td2 <- sprintf()
        # }
        td2 <- "<td style='color:#999999;'>--</td>"
        
        tblrow <- paste0(tblrow,td1,td2,td3,td4,"</tr>")
        htmlstr <- paste0(htmlstr,tblrow)
      }
      
      htmlstr <- paste0(htmlstr,"</tbody></table></div>")
      htmlstr2 <- paste0(shiny.header,htmlstr,'</body></html>')
      write(htmlstr2,"www/table.html")
      tagList(
        HTML(topstr),
        tags$iframe(src="table.html",width="100%",height="280px",frameborder=0))
      #HTML(topstr)
    }
  })
  
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
