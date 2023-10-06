library(readr)
vendas <- read_csv("bancos/vendas.csv")
View(vendas)
devolução <- read_csv("bancos/devolução.csv")
View(devolução)

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







vendas$Education <- factor(vendas$Education, levels = c("Sem faculdade", 
                                                      "Faculdade",
                                                      "Bacharelado",
                                                      "Mestre",
                                                      "Doutor"))