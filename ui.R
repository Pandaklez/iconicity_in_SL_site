navbarPage("Iconicity patterns in Sign Languges",
           tabPanel("About",
                    column(1,""),
                    fluidPage(HTML("<p><strong><span style=\"font-size: 14.0pt; font-family: 'Verdana','sans-serif';\">About us</span></strong></p>
<p><span style=\"font-size: 14.0pt; font-family: 'Verdana','sans-serif';\">This is a linguistic resource, which deals with nouns from different sign languages in respect to their iconicity type. It is based on a current research about iconicity patterns in non-abstract nouns from 7 semantic fields according to 19 languages. You can download our database with annotated signs on this website.</span></p>
                                   <p><span style=\"font-size: 14.0pt; font-family: 'Verdana','sans-serif';\">Here you can find data on 1542 annotated signs in formats: maps and graphs. There is an opportunity to search maps of words and look up for signs' characteristics in respect to semantic fields. On the graphs' page you can find some statistics on our data.</span></p>
                                   <p><span style=\"font-size: 14.0pt; font-family: 'Verdana','sans-serif';\">You can read more about methodology of our research here [LINK]</span></p>
                                   <p><strong><span style=\"font-size: 14.0pt; font-family: 'Verdana','sans-serif';\">Project members</span></strong></p>
                                   <p><span style=\"font-size: 14.0pt; font-family: 'Verdana','sans-serif';\">Vadim Kimmelman (<a href=\"mailto:vadimkmm@mail.ru\">vadimkmm@mail.ru</a>)</span></p>
                                   <p><span style=\"font-size: 14.0pt; font-family: 'Verdana','sans-serif';\">Anna Klezovich (<a href=\"mailto:belkannkl@gmail.com\">belkannkl@gmail.com</a>)</span></p>
                                   <p><span style=\"font-size: 14.0pt; font-family: 'Verdana','sans-serif';\">George Moroz (<a href=\"mailto:agricolamz@gmail.com\">agricolamz@gmail.com</a>)</span></p>
                                   <p><span style=\"font-size: 14.0pt; font-family: 'Verdana','sans-serif';\">When using this web resource, please acknowledge it by including the URL (</span>[LINK]<span style=\"font-size: 14.0pt; font-family: 'Verdana','sans-serif';\"><span style=\"font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-align: start; widows: 2; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; float: none; word-spacing: 0px;\">) and the following reference: [REFERENCE] URL:&nbsp;</span>[LINK]. [DATE OF ACCESS]</span></p>"
                                   ))
                    ),
           tabPanel("Search by word",
                      column(2,
                             selectInput('word_search', 'select the word:', 
                                unique(read.csv("iconisity_SL.csv", sep = "\t", stringsAsFactors = FALSE)$word),
                                selectize=TRUE),
                             selectInput("act", "Action", c("yes", "no", "all"), selected = "all"),
                             selectInput("loc", "Localization", c("yes", "no", "all"), selected = "all"),
                             selectInput("person", "Personification", c("yes", "no", "all"), selected = "all"),
                             selectInput("part_wholes", "Parts/wholes", c("yes", "no", "all"), selected = "all")
                             ),
                      column(10,
                             leaflet::leafletOutput("word_map"),
                      column(6,
                             DT::dataTableOutput("word_table"))
                    )),
           tabPanel("Search by sematic field",
                      column(2,
                           selectInput('field_search', 'select the semantic field:', 
                                       unique(read.csv("iconisity_SL.csv", sep = "\t", stringsAsFactors = FALSE)$semantic.field),
                                       selectize=TRUE),
                           selectInput("act_f", "Action", c("yes", "no", "all"), selected = "all"),
                           selectInput("loc_f", "Localization", c("yes", "no", "all"), selected = "all"),
                           selectInput("person_f", "Personification", c("yes", "no", "all"), selected = "all"),
                           selectInput("part_wholes_f", "Parts/wholes", c("yes", "no", "all"), selected = "all"),
                           selectInput("iconicity_pattern_f", "Iconicity pattern",
                                       choices = c("object", "handling", "tracing", "contour"))),
                      column(6,
                             leaflet::leafletOutput("field_map")),
                      column(4,
                             DT::dataTableOutput("field_table"))),
           tabPanel("Graphs",
                    column(2,
                           selectInput('graph_field', 'select the semantic field:', 
                                       unique(read.csv("iconisity_SL.csv", sep = "\t", stringsAsFactors = FALSE)$semantic.field),
                                       selectize=TRUE),
                           selectInput("iconicity_pattern_graph", "Iconicity pattern",
                                       choices = c("object", "handling", "tracing", "contour"))),
                    column(6,
                           plotOutput("graph_picture")),
                    column(4,
                           DT::dataTableOutput("graph_table"))),
           tabPanel("Raw data",
                    fluidRow(column(1,""),
                             tagList("Download the data: ", a(".tsv", href="https://goo.gl/7j7jJV"))),
                    fluidRow(column(1,""),
                             column(11,
                             DT::dataTableOutput("full_table")))))
