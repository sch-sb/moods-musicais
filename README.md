# moods-musicais
análise do meu mood ao longo dos anos


Após descobrir o [índice](https://link.springer.com/article/10.3758/s13428-021-01747-7) de [valência,](https://www.economist.com/graphic-detail/2020/02/08/data-from-spotify-suggest-that-listeners-are-gloomiest-in-february) valor atribuído ao sentimento geral de uma música que vai desde zero (depressão pura e intensa) até cem (axel f - crazy frog), comecei a ler um pouco sobre e descobri que o spotify utiliza esse valor na sua biblioteca e ele é facilmente acessível através de ferramentas como [http://sortyourmusic.playlistmachinery.com/](http://sortyourmusic.playlistmachinery.com/). 

Tendo isso em vista resolvi elaborar um wrapped do mood geral das minhas músicas nos últimos quatro anos. Para isso, utilizei a playlist de mais ouvidas de cada ano, aquelas que são geradas automaticamente pelo spotify. Salvei-as como .csv e importei para o Rstudio. 

```r
library(tidyverse)

musicas_2019 <- read.csv("mais tocadas 2019 - playlist.csv") 
musicas_2021 <- read.csv("mais ouvidas 2021 - playlist.csv")
musicas_2020 <- read.csv("mais ouvidas 2020 - playlist.csv")
musicas_2018 <- read.csv("mais ouvidas 2018 - playlist.csv")

df2 <- data.frame(Valence = c(musicas_2018$Valence, musicas_2019$Valence, musicas_2020$Valence, musicas_2021$Valence),
                  Ano = c("2018", "2019", "2020", "2021")) %>%

ggplot(data = df2, aes(x = Ano, y = Valence)) +
  geom_count(position = "jitter", alpha = 0.7, aes(color = Valence)) +
  scale_color_distiller(palette = "BuPu") +
  theme_classic() +
  labs(y = "Felicidade", 
       title = "mood musical")
```
![Captura de tela 2022-05-09 215539](https://user-images.githubusercontent.com/98799624/167924202-e04666e2-347f-4eb5-aead-8048c40f2c4a.png)



Meti um geom_count() e o resultado foi esse. Observações sobre os resultados:

- Enquanto em 2018 e 2019 as músicas são homogeneamente distribuídas por todo o espectro de moods, 2020 tem uma concentração intensa na área mais deprimida do gráfico. Não é à toa que fui 0.05% top ouvintes de Fiona Apple por dois anos seguidos!
- Em 2021 dei um chute na depressão? Não! Só passei a usar tiktok e as músicas que hitavam grudavam na minha cabeça e eu tinha que adicionar nas playlists... também foi o ano em que fazia muitas chamadas de zoom e ao terminar ia dançar bêbada pela casa - o top 100 foi constituído por muitas músicas dançantes.
