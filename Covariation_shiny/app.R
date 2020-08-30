library(tidyverse)
library(DT)
library(plotly)
library(shiny)
library(reshape2)
library(shinyalert)
library(shinydashboard)
library(shinythemes)

###################
#data
###################

ONZE_summary <- readRDS("ONZE_summary.rds")
sound_change_plot_data <- readRDS("mod_pred_data.rds")
mod_pred_PC_plot_data <- readRDS("mod_pred_PC_values_data.rds") %>%
  mutate(Comp.1 = round(-Comp.1, 3),
         Comp.2 = round(-Comp.2, 3),
         Comp.3 = round(-Comp.3, 3))

###################
#ui
###################

ui <- navbarPage(
  title = "Systematic co-variation",
  
  ################
  #bottom matter
  ################
  
  footer = 

  #add in various information about the data and app
  HTML(paste(
    
    br(),
    br(),
    br(),
    br(),
    br(),
    
    #creative commons
    a(img(src="by.png", width=120, height=42), href="https://creativecommons.org/licenses/by/4.0/", target="_blank"),
    
    #NZILBB
    a(img(src="NZILBB2.png", width=300, height=42), href="https://www.canterbury.ac.nz/nzilbb/", target="_blank"),
    
    #reuse declaration
    h5("You can distribute, remix, tweak, and build upon this work as long as you credit us for the original creation. Please use the following citation:\nBrand, J., Hay, J., Clark, L., Watson, K., & Sóskuthy, M. (submitted). Systematic co-variation of monophthongs across speakers of New Zealand English.
")
      )
    ),
  
  tabPanel("About",
           dashboardPage(
             dashboardHeader(disable = TRUE),
             dashboardSidebar(disable = TRUE),
             dashboardBody(
               # useShinyalert(),  # Set up shinyalert
               fluidRow(
                 column(6,
                        includeMarkdown("www/about.md")
                        )
                 ),
               #horizontal rule
               hr()
               ))),
  
  tabPanel("PCA explorer",
           dashboardPage(
             
             dashboardHeader(disable = TRUE),
             dashboardSidebar(disable = TRUE
                              # sidebarMenu(
                              #   menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
                              #   menuItem("Widgets", tabName = "widgets", icon = icon("th"))
                              # )
             ),
             
             
             dashboardBody(
               
               tags$head(tags$style(HTML(
                 '
                 # body {
                 # -moz-transform: scale(0.8, 0.8); /* Moz-browsers */
                 # zoom: 0.8; /* Other non-webkit browsers */
                 # zoom: 80%; /* Webkit browsers */
                 # }
                 
                 /* body */
                 .content-wrapper, .right-side {
                 background-color: #FFFFFF;
                 }
                 
                 .navbar { background-color: #BFCB6F;
                 font-size: 18px;
                 color: #6A6A6A; }
                 
                 #  .navbar-default .navbar-brand {
                 # color: #6A6A6A;
                 #  }
                 
                 .navbar-default .navbar-brand { color: #F5F4F4; 
                 font-size: 18px; 
                 background-color: #6A6A6A ;}
                 
                 '))),
               
               # fluidRow(useShinyalert(),  # Set up shinyalert
               box(collapsible = TRUE,
                   title = "PC1",
                   width = 1200,
                   column(width = 6,
                          plotlyOutput("PC1_plot", height = 300)
                   )
                   ,
                   column(width = 3,
                          plotlyOutput("PC1_vowels", height = 300, width = 300))
                   ,
                   column(width = 2, align="right",
                          img(src = 'mod_pred_PC1_values_vowel_plot.png', width = 350, height = 350,
                              style='padding:20px;')
                   )
               )
               ,
               box(collapsible = TRUE,
                   title = "PC2",
                   width = 1200,
                   column(width = 6,
                          plotlyOutput("PC2_plot", height = 300)
                   )
                   ,
                   column(width = 3,
                          plotlyOutput("PC2_vowels", height = 300, width = 300))
                   ,
                   column(width = 2,
                          img(src = 'mod_pred_PC2_values_vowel_plot.png', width = 350, height = 350,
                              style='padding:20px;')
                   )
               )
               ,
               box(collapsible = TRUE,
                   title = "PC3",
                   width = 1200,
                   column(width = 6,
                          plotlyOutput("PC3_plot", height = 300)
                   )
                   ,
                   column(width = 3,
                          plotlyOutput("PC3_vowels", height = 300, width = 300))
                   ,
                   column(width = 2,
                          img(src = 'mod_pred_PC3_values_vowel_plot.png', width = 350, height = 350,
                              style='padding:20px;')
                   )
               ),
               
               #horizontal rule
               hr()
               )
               )
               ),
  
  tabPanel("Sound change",
           mainPanel(width = 12,
                     column(width = 3,
                            fluidRow(
                              # column(5,
                              sliderInput("yob",
                                          "Year of birth:",
                                          min = min(sound_change_plot_data$participant_year_of_birth),
                                          max = max(sound_change_plot_data$participant_year_of_birth),
                                          value = min(sound_change_plot_data$participant_year_of_birth),
                                          step = 2,
                                          sep = "",
                                          animate = animationOptions(interval = 1000),
                                          width = 250)
                            ),
                            
                            fluidRow(
                              plotOutput("distPlot", width = 280, height = 300)
                            )
                     ),
                     
                     column(width = 3, offset = 0.25,
                            fluidRow(
                              # column(5,
                              sliderInput("PC1",
                                          "PC1 score:",
                                          min = round(min(mod_pred_PC_plot_data$Comp.1), 2) + 0.1,
                                          max = round(max(mod_pred_PC_plot_data$Comp.1), 2),
                                          value = round(min(mod_pred_PC_plot_data$Comp.1), 3),
                                          step = 0.2,
                                          sep = "",
                                          animate = animationOptions(interval = 1000),
                                          width = 250)
                            ),
                            
                            fluidRow(
                              plotOutput("distPlot1", width = 280, height = 300)
                            )
                     ),
                     
                     column(width = 3, offset = 0.25,
                            fluidRow(
                              # column(5,
                              sliderInput("PC2",
                                          "PC2 score:",
                                          min = round(min(mod_pred_PC_plot_data$Comp.2), 2),
                                          max = round(max(mod_pred_PC_plot_data$Comp.2), 2),
                                          value = round(min(mod_pred_PC_plot_data$Comp.2), 2),
                                          step = 0.2,
                                          sep = "",
                                          animate = animationOptions(interval = 1000),
                                          width = 250)
                            ),
                            
                            fluidRow(
                              plotOutput("distPlot2", width = 280, height = 300)
                            )
                     ),
                     
                     column(width = 3, offset = 0.25,
                            fluidRow(
                              # column(5,
                              sliderInput("PC3",
                                          "PC3 score:",
                                          min = round(min(mod_pred_PC_plot_data$Comp.3), 2),
                                          max = round(max(mod_pred_PC_plot_data$Comp.3), 2),
                                          value = round(min(mod_pred_PC_plot_data$Comp.3), 2),
                                          step = 0.2,
                                          sep = "",
                                          animate = animationOptions(interval = 1000),
                                          width = 250)
                            ),
                            
                            fluidRow(
                              plotOutput("distPlot3", width = 280, height = 300)
                            )
                     )
           ),
           
           fluidRow()
  ),

tabPanel("More",
         dashboardPage(
           dashboardHeader(disable = TRUE),
           dashboardSidebar(disable = TRUE
           ),
           dashboardBody(
             # useShinyalert(),  # Set up shinyalert
             fluidRow(
               column(6,
                      includeMarkdown("www/more.md")
               )
             )
           )
         )
)

)

###################
#server
###################

server <- function(input, output, session) {
  
  #----------------
  #Speaker PC scores
  #----------------
  
  output$PC1_plot <- renderPlotly({
    
    print(ggplotly(source = "PC1_plot",
                   
                   ggplot(ONZE_summary %>% select(Speaker, Gender, participant_year_of_birth, Comp.1) %>% distinct(), aes(x = participant_year_of_birth, y = Comp.1, label = Gender, color = Gender, group = Speaker, key = Speaker)) +
                     geom_text(show.legend = FALSE) + #add text label i.e. F/M
                     scale_y_continuous(breaks = seq(-6,6,2), limits = c(-7,7)) +
                     scale_color_manual(breaks = c("F", "M"), labels = c("Female", "Male"), values = c("black", "#7CAE00")) +
                     geom_hline(yintercept = 2, color = "red", linetype = "dashed") + #add red dashed line at 2
                     geom_hline(yintercept = -2, colour = "red", linetype = "dashed") + #add red dashed line at -2
                     xlab(NULL) + #label x axis
                     ylab("PC1 speaker loading") + #label y axis
                     theme_bw() + #general aesthetics
                     theme(axis.text = element_text(face = "bold", size = 14), axis.title = element_text(face = "bold", size = 14), legend.position="none") #make the text bold and larger on the axes
                   
      , tooltip = c("x", "y", "label", "key")
    )
    )
  })
  
  output$PC2_plot <- renderPlotly({
    print(
      ggplotly(
     
      ggplot(ONZE_summary %>% select(Speaker, Gender, participant_year_of_birth, Comp.2) %>% distinct(), aes(x = participant_year_of_birth, y = Comp.2, label = Gender, color = Gender, group = Speaker, key = Speaker)) +
        geom_text(show.legend = FALSE) + #add text label i.e. F/M
        scale_y_continuous(breaks = seq(-6,6,2), limits = c(-7,7)) +
        scale_color_manual(breaks = c("F", "M"), labels = c("Female", "Male"), values = c("black", "#7CAE00")) +
        geom_hline(yintercept = 2, color = "red", linetype = "dashed") + #add red dashed line at 2
        geom_hline(yintercept = -2, colour = "red", linetype = "dashed") + #add red dashed line at -2
        xlab(NULL) + #label x axis
        ylab("PC2 speaker loading") + #label y axis
        theme_bw() + #general aesthetics
        theme(axis.text = element_text(face = "bold", size = 14), axis.title = element_text(face = "bold", size = 14), legend.position="none") #make the text bold and larger on the axes

      , source = "PC2_plot", tooltip = c("x", "y", "label", "key")
    )
    )
  })
  
  output$PC3_plot <- renderPlotly({
    print(
      ggplotly(
      
      ggplot(ONZE_summary %>% select(Speaker, Gender, participant_year_of_birth, Comp.3) %>% distinct(), aes(x = participant_year_of_birth, y = Comp.3, label = Gender, color = Gender, group = Speaker, key = Speaker)) +
        geom_text(show.legend = FALSE) + #add text label i.e. F/M
        scale_y_continuous(breaks = seq(-6,6,2), limits = c(-7,7)) +
        scale_color_manual(breaks = c("F", "M"), labels = c("Female", "Male"), values = c("black", "#7CAE00")) +
        geom_hline(yintercept = 2, color = "red", linetype = "dashed") + #add red dashed line at 2
        geom_hline(yintercept = -2, colour = "red", linetype = "dashed") + #add red dashed line at -2
        xlab(NULL) + #label x axis
        ylab("PC3 speaker loading") + #label y axis
        theme_bw() + #general aesthetics
        theme(axis.text = element_text(face = "bold", size = 14), axis.title = element_text(face = "bold", size = 14), legend.position="none") #make the text bold and larger on the axes

      , source = "PC3_plot" , tooltip = c("x", "y", "label", "key")
    )
    )
  })
  
  #----------
  #vowel space
  #----------
  
  output$PC1_vowels <- renderPlotly({
    s1 <- event_data("plotly_click", source = "PC1_plot")
    
    if (is.character(s1$key) == FALSE) {
      ggplotly(
        p <- ggplot(data = ONZE_summary, aes(x = F2_mean, y = F1_mean)) +
          theme_bw() +
          theme(legend.position="none", plot.title = element_text(size = 6))
      )
    }
    else {
    vowel_means_click <- ONZE_summary[ONZE_summary$Speaker == event_data("plotly_click", source = "PC1_plot")$key, ]
    
    vowel_means_click <- vowel_means_click %>%
      mutate(F1_mean = round(F1_mean, 2),
             F2_mean = round(F2_mean, 2))
    
    ggplotly(
      p <- ggplot(data = vowel_means_click, aes(x = F2_mean, y = F1_mean, label = Vowel, colour = Vowel, size = PC1_loadings_abs)) +
        geom_text(show.legend = FALSE) +
        scale_color_manual(values = c("grey", "grey", "grey", "grey", "grey",
                                      "grey", "#00B0F6", "#F8766D", "#E76BF3", "grey")) +
        # scale_color_manual(values = c("#9590FF", "#D89000", "#A3A500", "#39B600", "#00BF7D",
        #                               "#00BFC4", "#00B0F6", "#F8766D", "#E76BF3", "#FF62BC")) +   
        scale_size_continuous(range = c(1,3)) +
        scale_x_reverse(position = "top", name = "F2", limits = c(max(ONZE_summary$F2_mean) + 0.2, min(ONZE_summary$F2_mean) - 0.2)) +
        scale_y_reverse(position = "right", name = "F1", limits = c(max(ONZE_summary$F1_mean) + 0.2, min(ONZE_summary$F1_mean) - 0.2)) +
        ggtitle(event_data("plotly_click", source = "PC1_plot")$key) +
        theme_bw() +
        theme(legend.position="none", plot.title = element_text(size = 6)),
        tooltip = c("x", "y", "label")
    )
    }
  })
  
  output$PC2_vowels <- renderPlotly({
    s2 <- event_data("plotly_click", source = "PC2_plot")
    
    if (is.character(s2$key) == FALSE) {
      ggplotly(
        p <- ggplot(data = ONZE_summary, aes(x = F2_mean, y = F1_mean)) +
          theme_bw() +
          theme(legend.position="none", plot.title = element_text(size = 6))
      )
    }
    else {
    vowel_means_click <- ONZE_summary[ONZE_summary$Speaker == event_data("plotly_click", source = "PC2_plot")$key, ]
    
    vowel_means_click <- vowel_means_click %>%
      mutate(F1_mean = round(F1_mean, 2),
             F2_mean = round(F2_mean, 2))
    
    ggplotly(
      p <- ggplot(data = vowel_means_click, aes(x = F2_mean, y = F1_mean, label = Vowel, colour = Vowel, size = PC2_loadings_abs)) +
        geom_text(show.legend = FALSE) +
        scale_color_manual(values = c("#9590FF", "#D89000", "grey", "#39B600", "#00BF7D",
                                      "#00BFC4", "grey", "grey", "grey", "#FF62BC")) +
        # scale_color_manual(values = c("#9590FF", "#D89000", "#A3A500", "#39B600", "#00BF7D",
        #                               "#00BFC4", "#00B0F6", "#F8766D", "#E76BF3", "#FF62BC")) +
        scale_size_continuous(range = c(1,3)) +
        scale_x_reverse(position = "top", name = "F2", limits = c(max(ONZE_summary$F2_mean) + 0.2, min(ONZE_summary$F2_mean) - 0.2)) +
        scale_y_reverse(position = "right", name = "F1", limits = c(max(ONZE_summary$F1_mean) + 0.2, min(ONZE_summary$F1_mean) - 0.2)) +
        ggtitle(event_data("plotly_click", source = "PC2_plot")$key) +
        theme_bw() +
        theme(legend.position="none", plot.title = element_text(size = 6)),
      tooltip = c("x", "y", "label")
    )
    }
  })
  
  output$PC3_vowels <- renderPlotly({
    s3 <- event_data("plotly_click", source = "PC3_plot")
    
    if (is.character(s3$key) == FALSE) {
      ggplotly(
        p <- ggplot(data = ONZE_summary, aes(x = F2_mean, y = F1_mean)) +
          theme_bw() +
          theme(legend.position="none", plot.title = element_text(size = 6))
      )
    }
    else {
    vowel_means_click <- ONZE_summary[ONZE_summary$Speaker == event_data("plotly_click", source = "PC3_plot")$key, ]
    
    vowel_means_click <- vowel_means_click %>%
      mutate(F1_mean = round(F1_mean, 2),
             F2_mean = round(F2_mean, 2))
    
    ggplotly(
      p <- ggplot(data = vowel_means_click, aes(x = F2_mean, y = F1_mean, label = Vowel, colour = Vowel, size = PC3_loadings_abs)) +
        geom_text(show.legend = FALSE) +
        scale_color_manual(values = c("#9590FF", "grey", "#A3A500", "grey", "#00BF7D",
                                      "grey", "#00B0F6", "grey", "grey", "grey")) +
        # scale_color_manual(values = c("#9590FF", "#D89000", "#A3A500", "#39B600", "#00BF7D",
        #                               "#00BFC4", "#00B0F6", "#F8766D", "#E76BF3", "#FF62BC")) +
        scale_size_continuous(range = c(1,3)) +
        scale_x_reverse(position = "top", name = "F2", limits = c(max(ONZE_summary$F2_mean) + 0.2, min(ONZE_summary$F2_mean) - 0.2)) +
        scale_y_reverse(position = "right", name = "F1", limits = c(max(ONZE_summary$F1_mean) + 0.2, min(ONZE_summary$F1_mean) - 0.2)) +
        ggtitle(event_data("plotly_click", source = "PC3_plot")$key) +
        theme_bw() +
        theme(legend.position="none", plot.title = element_text(size = 6)),
      tooltip = c("x", "y", "label")
    )
    }
  })
  
  #-----------
  #sound change
  #-----------
  
  output$distPlot <- renderPlot({
    
    sound_change_plot_data %>%
      filter(participant_year_of_birth == input$yob) %>%
      #set general aesthetics
      ggplot(aes(x = F2_yob, y = F1_yob, colour = Vowel, group = Vowel, label = Vowel)) +
      geom_text(aes(fontface = 2), size = 4, show.legend = FALSE) +
      #label the axes
      xlab("F2 (normalised)") +
      ylab("F1 (normalised)") +
      #reverse the axes to follow conventional vowel plotting
      scale_x_reverse(limits = c(2,-2.5), position = "top") +
      scale_y_reverse(limits = c(2.3,-2), position = "right") +
      #set the colours
      scale_color_manual(values = c("#9590FF", "#D89000", "#A3A500", "#39B600", "#00BF7D",
                                    "#00BFC4", "#00B0F6", "#F8766D", "#E76BF3", "#FF62BC")) +
      #add a title
      labs(caption = paste0('Year of birth: ', input$yob)) +
      #set the theme
      theme_bw() +
      #make text more visible
      theme(axis.title = element_text(size = 14, face = "bold"),
            axis.text.x = element_text(size = 14, face = "bold"),
            axis.text.y = element_text(size = 14, face = "bold", angle = 270),
            axis.ticks = element_blank(),
            plot.caption = element_text(size = 30, hjust = 0))
  })
  
  
  #-----------
  #PCs
  #-----------
  
  output$distPlot1 <- renderPlot({
    
    Comp.1_distinct <- mod_pred_PC_plot_data %>%
      ungroup() %>%
      distinct(Comp.1) %>%
      arrange(Comp.1)
    
    mod_pred_PC_plot_data %>%
      filter(Comp.1 == as.numeric(Comp.1_distinct[findInterval(input$PC1, Comp.1_distinct$Comp.1), 1])) %>%
      #set general aesthetics 
      ggplot(aes(x = F2_PC1, y = F1_PC1, colour = Vowel, group = Vowel, label = Vowel)) +
      geom_text(aes(fontface = 2), show.legend = FALSE) +
      #label the axes
      xlab("F2 (normalised)") +
      ylab("F1 (normalised)") +
      #reverse the axes to follow conventional vowel plotting
      scale_x_reverse(limits = c(2,-2.5), position = "top") +
      scale_y_reverse(limits = c(2.3,-2), position = "right") +
      #set the colours
      scale_color_manual(values = c("grey", "grey", "grey", "grey", "grey",
                                    "grey", "#00B0F6", "#F8766D", "#E76BF3", "grey")) +
      scale_size_continuous(range = c(1,4)) +
      #add a title
      labs(caption = paste0('PC1 score: ', input$PC1)) +
      #set the theme
      theme_bw() +
      #make text more visible
      theme(axis.title = element_text(size = 14, face = "bold"),
            axis.text.x = element_text(size = 14, face = "bold"),
            axis.text.y = element_text(size = 14, face = "bold", angle = 270),
            axis.ticks = element_blank(),
            plot.caption = element_text(size = 30, hjust = 0))
    
      })
  
  output$distPlot2 <- renderPlot({
    
    Comp.2_distinct <- mod_pred_PC_plot_data %>%
      ungroup() %>%
      distinct(Comp.2) %>%
      arrange(Comp.2)
    
    value <- as.numeric(Comp.2_distinct[findInterval(input$PC2 + 0.05, Comp.2_distinct$Comp.2), 1])
    
    mod_pred_PC_plot_data %>%
      filter(Comp.2 == value) %>%
      #set general aesthetics
      ggplot(aes(x = F2_PC2, y = F1_PC2, colour = Vowel, group = Vowel, label = Vowel)) +
      geom_text(aes(fontface = 2), show.legend = FALSE) +
      #label the axes
      xlab("F2 (normalised)") +
      ylab("F1 (normalised)") +
      #reverse the axes to follow conventional vowel plotting
      scale_x_reverse(limits = c(2,-2.5), position = "top") +
      scale_y_reverse(limits = c(2.3,-2), position = "right") +
      #set the colours
      scale_color_manual(values = c("#9590FF", "#D89000", "grey", "#39B600", "#00BF7D",
                                    "#00BFC4", "grey", "grey", "grey", "#FF62BC")) +
      scale_size_continuous(range = c(1,4)) +
      #add a title
      labs(caption = paste0('PC2 score: ', input$PC2)) +
      #set the theme
      theme_bw() +
      #make text more visible
      theme(axis.title = element_text(size = 14, face = "bold"),
            axis.text.x = element_text(size = 14, face = "bold"),
            axis.text.y = element_text(size = 14, face = "bold", angle = 270),
            axis.ticks = element_blank(),
            plot.caption = element_text(size = 30, hjust = 0))
    
    })
  
  output$distPlot3 <- renderPlot({
    
    Comp.3_distinct <- mod_pred_PC_plot_data %>%
      ungroup() %>%
      distinct(Comp.3) %>%
      arrange(Comp.3)
    
    value <- as.numeric(Comp.3_distinct[findInterval(input$PC3 + 0.05, Comp.3_distinct$Comp.3), 1])
    
    mod_pred_PC_plot_data %>%
      filter(Comp.3 == value) %>%
      #set general aesthetics
      ggplot(aes(x = F2_PC3, y = F1_PC3, colour = Vowel, group = Vowel, label = Vowel)) +
      geom_text(aes(fontface = 2), show.legend = FALSE) +
      #label the axes
      xlab("F2 (normalised)") +
      ylab("F1 (normalised)") +
      #reverse the axes to follow conventional vowel plotting
      scale_x_reverse(limits = c(2,-2.5), position = "top") +
      scale_y_reverse(limits = c(2.3,-2), position = "right") +
      #set the colours
      scale_color_manual(values = c("#9590FF", "grey", "#A3A500", "grey", "#00BF7D",
                                    "grey", "#00B0F6", "grey", "grey", "grey")) +
      scale_size_continuous(range = c(1,4)) +
      #add a title
      labs(caption = paste0('PC3 score: ', input$PC3)) +
      #set the theme
      theme_bw() +
      #make text more visible
      theme(axis.title = element_text(size = 14, face = "bold"),
            axis.text.x = element_text(size = 14, face = "bold"),
            axis.text.y = element_text(size = 14, face = "bold", angle = 270),
            axis.ticks = element_blank(),
            plot.caption = element_text(size = 30, hjust = 0))
    
    })
  
  
  
}

shinyApp(ui, server)
