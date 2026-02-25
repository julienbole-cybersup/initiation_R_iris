# Chargement du jeu de données Iris
# Le jeu Iris est inclus dans le package "datasets" (chargé par défaut dans R)
data(iris)

# Aperçu des données
head(iris)

# Structure du jeu de données
str(iris)

# Résumé statistique
summary(iris)

# =============================================================================
# Manipulation des données avec dplyr
# =============================================================================
# exploration descriptives
iris %>%
  summarise(
    Moyenne_SL = round(mean(Sepal.Length),2),
    Mediane_SL = round(median(Sepal.Length),2),
    SD_SL = round(sd(Sepal.Length),2),
    Q1_SL = quantile(Sepal.Length, 0.25),
    Q3_SL = quantile(Sepal.Length, 0.75)
  )
iris %>%
  summarise(
    Moyenne_SW = round(mean(Sepal.Width),2),
    Mediane_SW = round(median(Sepal.Width),2),
    SD_SW = round(sd(Sepal.Width),2),
    Q1_SW = quantile(Sepal.Width, 0.25),
    Q3_SW = quantile(Sepal.Width, 0.75)
  )
iris %>%
  summarise(
    Moyenne_PL = round(mean(Petal.Length),2),
    Mediane_PL = round(median(Petal.Length),2),
    SD_PL = round(sd(Petal.Length),2),
    Q1_PL = quantile(Petal.Length, 0.25),
    Q3_PL = quantile(Petal.Length, 0.75)
  )
iris %>%
  summarise(
    Moyenne_PW = round(mean(Petal.Width),2),
    Mediane_PW = round(median(Petal.Width),2),
    SD_PW = round(sd(Petal.Width),2),
    Q1_PW = quantile(Petal.Width, 0.25),
    Q3_PW = quantile(Petal.Width, 0.75)
  )

# valeur null
colSums(is.na(iris))

# corrélation
cor_matrix <- cor(iris[,1:4])
cor_matrix

# heatmap
library(ggcorrplot)

ggcorrplot(cor_matrix,
           method = "square",
           type = "lower",
           lab = TRUE)

# histogramme
library(ggplot2)

# petal length
ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_histogram(alpha = 0.6, bins = 20, position = "identity") +
  theme_minimal()


# scatterplot
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  theme_minimal()
