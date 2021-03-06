setwd("C:/Users/SKudr/Documents/GitHub/hse21_H3K4me1_ZDNA_mouse/src")
source('lib.R')

#NAME <- 'mouse-ZDNA1'
#NAME <- 'H3K4me1_ZDNA.intersect_with_DEEPZ'
#NAME <- 'H3K4me1_ENCFF596ORE.mm10'
#NAME <- 'H3K4me1_ENCFF791SEO.mm10'
#NAME <- 'H3K4me1_ENCFF596ORE.mm10.filtered'
NAME <- 'H3K4me1_ENCFF791SEO.mm10.filtered'
bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

hist(bed_df$len)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.png'), path = OUT_DIR)
