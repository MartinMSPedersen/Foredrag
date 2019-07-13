library(RColorBrewer)
library(ggthemes)
library(ggplot2)


df <-  read.delim(file.choose())
df <- reshape2::melt(df) 
names(df)[2] <- "hyppighed"
names(df)[3] <- "år"
names(df)[4] <- "pct"

df$år <- sub("X","",df$år)

df$alder <- factor(df$alder, levels = c("7 år","12 år","15 år"))
df$hyppighed <- factor(df$hyppighed, levels = c(
  "Mindst en gang om ugen",
  "Mindst en gang om måneden",
  "Sjældnere end en gang om måneden",
  "Aldrig"))

df$år <- factor(df$år)
df
str(df)

g <- ggplot(df, aes(alder, pct, fill = hyppighed)) 
g <- g + geom_col(position = "fill")  
g <- g + facet_wrap(~år, scales = "free_x")
g <- g + scale_y_continuous(labels = scales::percent)
g <- g + labs(x = "Alder", 
              caption = "Kilde: Danmarks Statistik",
              title = "Hvor ofte læser børn bøger?")
g <- g + scale_fill_brewer(type = "seq")
g <- g + ggthemes::theme_economist()
g <- g + coord_flip() 
g

