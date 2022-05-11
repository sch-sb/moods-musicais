
musicas_2019 <- read.csv("mais tocadas 2019 - playlist.csv") 

musicas_2021 <- read.csv("mais ouvidas 2021 - playlist.csv")

musicas_2020 <- read.csv("mais ouvidas 2020 - playlist.csv")

musicas_2018 <- read.csv("mais ouvidas 2018 - playlist.csv")
musicas_2021 <- read.csv("mais ouvidas 2021 - playlist.csv")
install.packages("tidyverse")
library(tidyverse)

mean2020 <- mean(musicas_2020$Valence)
mean2019 <- mean(musicas_2019$Valence)
mean2018 <- mean(musicas_2018$Valence)
mean2021 <- mean(musicas_2021$Valence)
max2020 <- max(musicas_2020$Valence)
max2019 <- max(musicas_2019$Valence)
max2018 <- max(musicas_2018$Valence)
max2021 <- max(musicas_2021$Valence)
min2020 <- min(musicas_2020$Valence)
min2019 <- min(musicas_2019$Valence)
min2018 <- min(musicas_2018$Valence)
min2021 <- min(musicas_2021$Valence)

df <- data.frame(Media_Valencia = c(mean2018, mean2019, mean2020, mean2021),
                 Ano = c("2018", "2019", "2020", "2021"),
                 Max = c(max2018, max2019, max2020, max2021), 
                 Min = c(min2018, min2019, min2020, min2021)) %>%

df2 <- data.frame(Valence = c(musicas_2018$Valence, musicas_2019$Valence, musicas_2020$Valence, musicas_2021$Valence),
                  Ano = c("2018", "2019", "2020", "2021")) %>%

library(tidyverse)
library(RColorBrewer)

ggplot(data = df2, aes(x = Ano, y = Valence)) +
  geom_count(position = "jitter", alpha = 0.7, aes(color = Valence)) +
  scale_color_distiller(palette = "BuPu") +
  theme_classic() +
  labs(y = "Felicidade", 
       title = "mood musical") +
  scale_fill_continuous(name = "Valência", 
                      labels = c("deprê", "ok", "felizona")) 

  
  
  

