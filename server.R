
## ~~~~~~~~~~ SERVER ~~~~~~~~~~~ ##

# Created by: Sijia Wang
# Team: Data Analytics and Business Solutions (DABS)
# Version: 1.0
# Last modified: 2020-03-12
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
}