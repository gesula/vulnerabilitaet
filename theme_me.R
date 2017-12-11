#### Mein Theme ####

theme_me <- function(bg = "white", axis_title_size = 1, position_x = .5, angle_y = 90,
                     position_y = .5, arrow = c("y", "x", "xy"), axis_text_size = 1,
                     text_colour_x = "darkgrey", text_colour_y = "darkgrey")
{
  template_background <- ggplot2::element_rect(fill = bg, color = bg)

  result <- ggplot2::theme_minimal() %+replace%
    theme(panel.background   = template_background,
          plot.background    = template_background,
          legend.background  = template_background,
          legend.key         = template_background,
          plot.caption       = element_text(hjust = 1, vjust = 0,
                                             size = rel(0.7)),
          axis.title.x       = element_text(hjust = position_x, margin = margin(t = 10),
                                            size = rel(axis_title_size)),
          axis.title.y       = element_text(hjust = position_y, margin = margin(t = 10),
                                            size = rel(axis_title_size), angle = angle_y),
          plot.title         = element_text(size = rel(axis_title_size * 2)),
          strip.placement    = "outside",
          strip.background   = element_blank(),
          axis.text          = element_text(size = rel(axis_text_size)),
          axis.text.x        = element_text(colour = text_colour_x),
          axis.text.y        = element_text(colour = text_colour_y)
          )

  arrow_cosmetics <- element_line(arrow = arrow(angle = 25, length = unit(.3, "cm")),
                                  size = .2, color = "darkgrey")

  if (arrow == "y") {
    result <- result + theme(axis.line.y = arrow_cosmetics)
  } else if (arrow == "x") {
    result <- result + theme(axis.line.x = arrow_cosmetics)
  } else if (arrow == "xy") {
    result <- result + theme(axis.line = arrow_cosmetics)
  } else {
    result <- result + theme(axis.line = element_blank())
  }
  return(result)
}




#### Beispiel ####
 ggplot(qm, aes(x = alter, fill = gender), arrow = "x") +
   geom_bar(position = "dodge") +
   labs(title = "Moin") +
   theme_me()
