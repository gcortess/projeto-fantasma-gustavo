library(readr)
vendas <- read_csv("bancos/vendas.csv")
View(vendas)
devolução <- read_csv("bancos/devolução.csv")
View(devolução)
library(tidyverse)

# descobrindo quais os valores dentro de uma variavel

### product name
vendas$`Product Name` <- as.factor(vendas$`Product Name`)
levels(vendas$`Product Name`)
vendas$`Product Name` <- as.character(vendas$`Product Name`)
### category
vendas$Category <- as.factor(vendas$Category)
levels(vendas$Category)
vendas$Category <- as.character(vendas$Category)
### color
vendas$Color <- as.factor(vendas$Color)
levels(vendas$Color)
vendas$Color <- as.character(vendas$Color)
### size
vendas$Size <- as.factor(vendas$Size)
levels(vendas$Size)
vendas$Size <- as.character(vendas$Size)

# trocando os valores para o português

### Product Name
vendas$`Product Name`[vendas$`Product Name` == "Dress"] <- "Vestido"
vendas$`Product Name`[vendas$`Product Name` == "Shoes"] <- "Tênis"
vendas$`Product Name`[vendas$`Product Name` == "Sweater"] <- "Sueter"
vendas$`Product Name`[vendas$`Product Name` == "T-shirt"] <- "Camiseta"
vendas$`Product Name`[vendas$`Product Name` == "Jeans"] <- "Calças"
vendas$`Product Name` <- as.factor(vendas$`Product Name`)

### Category
vendas$Category[vendas$Category == "Kids' Fashion"] <- "Moda Infantil"
vendas$Category[vendas$Category == "Men's Fashion"] <- "Moda Masculina"
vendas$Category[vendas$Category == "Women's Fashion"] <- "Moda Feminina"
vendas$Category <- as.factor(vendas$Category)

### Color
vendas$Color[vendas$Color == "Black"] <- "Preto"
vendas$Color[vendas$Color == "Blue"] <- "Azul"
vendas$Color[vendas$Color == "Green"] <- "Verde"
vendas$Color[vendas$Color == "Red"] <- "Vermelho"
vendas$Color[vendas$Color == "White"] <- "Branco"
vendas$Color[vendas$Color == "Yellow"] <- "Amarelo"
vendas$Color <- as.factor(vendas$Color)

### Size
vendas$Size[vendas$Size == "L"] <- "G"
vendas$Size[vendas$Size == "S"] <- "P"
vendas$Size[vendas$Size == "XL"] <- "GG"
vendas$Size <- as.factor(vendas$Size)

# Faturamento anual por categoria

### Moda infantil
vendasi <- vendas %>% 
  filter(Category == "Moda Infantil") 
sum(vendasi$Price, na.rm = T)
 
### Moda Masculina 
vendasm <- vendas %>% 
  filter(Category == "Moda Masculina") 
sum(vendasm$Price, na.rm = T)

### Moda Feminina

vendasF <- vendas %>% 
  filter(Category == "Moda Feminina") 
sum(vendasF$Price, na.rm = T)



# VARIAÇÃO DE PREÇO POR MARCA

vendas$Brand <- as.factor(vendas$Brand)
vendaspm <- vendas %>% 
  filter(Brand == "Adidas" | Brand == "Gucci" | Brand == "H&M" | Brand == "Nike" | Brand == "Zara")
#### GRAFICO DE BOXPLOT PREÇO/MARCA
ggplot(vendaspm, aes(x=Price, y=Brand)) +
  geom_boxplot(fill=c("#A11D21"), width = 0.5) +
  guides(fill=FALSE) +
  stat_summary(fun.y="mean", geom="point", shape=22, size=3, fill="white")+
  labs(x="PREÇO", y="MARCA")+
  theme_bw() +
  theme(axis.title.y=element_text(colour="black", size=12),
        axis.title.x = element_text(colour="black", size=12),
        axis.text = element_text(colour = "black", size=9.5),
        panel.border = element_blank(),
        axis.line.y = element_line(colour = "black")) 

# RELAÇÃO ENTRE CATEGORIA E MARCA
vendascm <- vendas %>% 
  filter(Category == "Moda Masculina" | Category == "Moda Feminina") %>% 
  filter(Brand != " ") %>%  
  group_by(Category, Brand) %>%
  summarise(freq = n()) %>%
  mutate(freq_relativa = round((freq/sum(freq))*100, 2))

names(vendascm)[names(vendascm) == "Category"] <- "Categoria"

#### GRAFICO DE COLUNAS CATEGORIA/MARCA

meanTLE <- c(76, 73, 63, 74, 66, 71, 60, 62, 74, 76)

ggplot(vendascm) +
  aes(x = Brand, y = freq,
      fill = Categoria) +
  geom_col(position = position_dodge2(preserve = "single", padding = 0)) +
  labs(x = "MARCA", y = "FREQUÊNCIA ABSOLUTA")+
  geom_text(
    aes(label = meanTLE),
    vjust = 0,
    colour = "black", 
    position = position_dodge(width=0.9),
    fontface = "bold",
    size=3,
    angle = 0,
    hjust = -0.2) + 
  ylim(0, 80) +
  scale_fill_manual(values = c("#A11D21","#003366")) +
  coord_flip() +
  theme_bw()


ggplot( aes(Price, Rating)) + geom_box()
