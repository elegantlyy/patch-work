library(ggplot2)
library(patchwork)


plist <- list()
for(i in 1:2){
  p_frame <- tibble(
    x = rnorm(100),
    group = sample(c(0,1), 100, replace = T) %>% as.character()
  )
  
  plist[[i]] <- p_frame %>% ggplot(aes(x = x, group = group, colour = group, fill = group)) +
    geom_density(alpha = 0.3) +
    theme_bw()
}
i = 3
p_frame <- tibble(
  x = rnorm(100, mean = 10),
  group = sample(c(0,1), 100, replace = T) %>% as.character()
)

plist[[i]] <- p_frame %>% ggplot(aes(x = x, group = group, colour = group, fill = group)) +
  geom_boxplot(alpha = 0.3) +
  theme_bw() + coord_flip()




plist[[1]] + plist[[2]] + plist[[3]] + 
  patchwork::plot_spacer() 

layout <- c(
    area(1, 1),
    area(1, 3, 3),
    area(3, 1, 3, 2)
  )
# Show the layout to make sure it looks as it should
plot(layout)
plist[[1]] + plist[[2]] + plist[[3]] + 
  patchwork::plot_spacer() +
  patchwork::plot_layout(design = layout)


ppl1 <- (plist[[1]] + plist[[2]] + plist[[3]]) / guide_area() + plot_layout(guides = 'collect')
ppl2 <- (plist[[1]] + plist[[2]] + plist[[3]]) / guide_area() + plot_layout(guides = 'collect')
ppl1/ppl2


ppl1 <- (plist[[1]] + plist[[2]] + plist[[3]])  + plot_layout(guides = 'collect') & theme(legend.position = "bottom")
ppl2 <- (plist[[1]] + plist[[2]] + plist[[3]])  + plot_layout(guides = 'collect') & theme(legend.position = "bottom")
ppl1/ppl2
