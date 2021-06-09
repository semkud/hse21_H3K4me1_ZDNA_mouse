# hse21_H3K4me1_ZDNA_mouse

#  Кудрявцев Семен Алексеевич, 4 группа, доклад о проделанной работе

В данной работе будет рассматриваться гистоновая метка H3K4me1 в геноме мыши (сборка генома mm10).
Я выбрал клетку CH12.LX и в ней эксперименты ENCFF596ORE и ENCFF791SEO.

Сначала я скачал bed-файлы экспериментов и для работы с ними обрезал до первых пяти столбцов:
> wget https://www.encodeproject.org/files/ENCFF791SEO/@@download/ENCFF791SEO.bed.gz
> 
> wget https://www.encodeproject.org/files/ENCFF596ORE/@@download/ENCFF596ORE.bed.gz
> 
> zcat ENCFF791SEO.bed.gz  |  cut -f1-5 > H3K4me1_ENCFF832EOL.mm10.bed
> 
> zcat ENCFF596ORE.bed.gz  |  cut -f1-5 > H3K4me1_ENCFF832EOL.mm10.bed

Затем я построил гистограммы длин участков для каждого распределения, и оставил только те, длины которых не превышают 3000.

![alttag](results/filter_peaks.H3K4me1_ENCFF596ORE.mm10.init.hist.pdf "Для ENCFF596ORE")​

![alttag](results/filter_peaks.H3K4me1_ENCFF596ORE.mm10.init.hist.pdf "Для ENCFF791SEO")​

Вот новые гистограммы:


