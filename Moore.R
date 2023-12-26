library("tidyverse")
library("rvest") #scrape web pages
library("ggrepel") #repel labels
library("janitor") #clean dirty data

#get rid of scientific notation
options(scipen = 999)

# get data from url and table directly
url <- "https://en.wikipedia.org/wiki/Transistor_count"
html <- read_html(url)
df_transistors <- html_nodeset[[4]] %>% html_table()%>%as_tibble()

# clean table and columns
df_transistors <- df_transistors %>% janitor::clean_names()
df_transistors <- df_transistors %>% mutate_all(~ str_remove_all(., "\\s*\\([^)]+\\)|\\s*\\[[^]]+\\]"))
# Remove all substrings in () or []: \\s* matches whitespace characters. \\([^)]+\\) matches substring in parentheses. \\[[^]]+\\] matches substring in brackets
df_transistors <- df_transistors %>%  slice(1:(n() - 1)) #get rid of last row in dataframe
df_transistors_cleaned <- df_transistors %>%
  mutate(transistor_count = str_remove_all(transistor_count, "[-+],")) %>% # Remove values after "-" or "+", and remove all commas
  mutate(transistor_count = str_remove_all(transistor_count,"[,+\\-]")) %>% # Remove all ",", "-", and "+"
  mutate(transistor_count = str_extract(transistor_count, "\\d+")) %>%  # Extract only the digits
  filter(!is.na(transistor_count)) %>% # Remove rows with NA (non-numeric values)
  mutate_at(c("transistor_count", "year"), parse_number) # change to numeric type


# if we want to only show the top 7 designers and lump everything else together into one category
df_transistors_cleaned <- df_transistors_cleaned %>%
  mutate(designerTop = fct_lump(designer, 7))
#fct_lump function is used to lump together less frequent levels of the designer column into a new level called "Other

cleanedTheme = theme(panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),
                panel.background = element_blank(),
                legend.key=element_blank())

# different variations of plots
# plot including points and regression line, log scale, showing designer by color and shape
df_transistors_cleaned %>%
  ggplot(aes(year, transistor_count)) +
  geom_smooth(group = 1, alpha = .1, method = "loess", color = "#000000", formula = y ~ x) +
  geom_point(aes(color = designerTop), cex = 2) +
  scale_color_brewer(palette = "Set2") +
  scale_y_log10(labels = scales::comma_format(),breaks = 10^seq(3, 14, by = 1)) +
  labs(x = "Years", y = "Transistor Count (log)", color = "Designer")+
  cleanedTheme

# add labels manually, remove line
process_labels_manual <- c("Apple M2 Ultra","IBM z15 CP chip", "Apple A8","AMD Zen 3 CCD","Itanium 2","AWS Graviton2","Fujitsu A64FX","IBM z14","Xeon Phi","Atom","AMD K8","Motorola 68030","TMS9900")

df_transistors_cleaned %>%
  ggplot(aes(year, transistor_count)) +
  geom_point(aes(color = designerTop), cex = 2) +
  ggrepel::geom_text_repel(data = df_transistors_cleaned %>%filter(processor %in% process_labels_manual),aes(year, transistor_count, label = processor),cex = 2, max.overlaps = 20)+
  scale_color_brewer(palette = "Set2") +
  scale_y_log10(labels = scales::comma_format(),breaks = 10^seq(3, 14, by = 1)) +
  labs(x = "Years", y = "Transistor Count (log)", color = "Designer")+
  cleanedTheme

# Linear Regression
linearReg = lm(year ~ transistor_count, data = df_transistors_cleaned)
summary(linearReg)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -32.137  -9.142   4.712  11.927  17.372 
# 
# Coefficients:
#   Estimate          Std. Error  t value
# (Intercept)      2002.13710557297554    0.93109741304623 2150.298
# transistor_count    0.00000000036704    0.00000000005091    7.209
# Pr(>|t|)    
# (Intercept)      < 0.0000000000000002 ***
#   transistor_count     0.00000000000721 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 13.51 on 241 degrees of freedom
# Multiple R-squared:  0.1774,	Adjusted R-squared:  0.174 
# F-statistic: 51.97 on 1 and 241 DF,  p-value: 0.000000000007213



