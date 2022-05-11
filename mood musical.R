
musicas_2019 <- read.csv("mais tocadas 2019 - playlist.csv") 
musicas_2020 <- read.csv("mais ouvidas 2020 - playlist.csv")
musicas_2018 <- read.csv("mais ouvidas 2018 - playlist.csv")
musicas_2021 <- read.csv("mais ouvidas 2021 - playlist.csv")
library(tidyverse)


df2 <- data.frame(Valence = c(musicas_2018$Valence, musicas_2019$Valence, musicas_2020$Valence, musicas_2021$Valence),
                  Ano = c("2018", "2019", "2020", "2021")) %>%

library(tidyverse)
library(RColorBrewer)

ggplot(data = df2, aes(x = Ano, y = Valence)) +
  geom_count(position = "jitter", alpha = 0.7, aes(color = Valence)) +
  scale_color_distiller(palette = "BuPu") +
  theme_classic() +
  labs(y = "Felicidade", 
       title = "mood musical") 

  
  
  

