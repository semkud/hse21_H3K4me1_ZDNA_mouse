setwd("C:/Users/SKudr/Documents/GitHub/hse21_H3K4me1_ZDNA_mouse/src")
source('lib.R')

install.packages("BiocManager")
BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")
BiocManager::install("clusterProfiler")
BiocManager::install("ChIPseeker")
BiocManager::install("org.Hs.eg.db")

library(ChIPseeker)
#library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(clusterProfiler)

###

#NAME <- 'H3K4me3_A549.intersect_with_DeepZ'
#NAME <- 'DeepZ'
#NAME <- 'H3K4me1_ENCFF791SEO.mm10.filtered'
NAME <- 'H3K4me1_ENCFF596ORE.mm10.filtered'
BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###

txdb <- TxDb.Mmusculus.UCSC.mm10.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

# peak <- readPeakFile(BED_FN)
# pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
# covplot(peak, weightCol="V5")
# dev.off()
# 