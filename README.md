# hse21_H3K4me1_ZDNA_mouse

#  Кудрявцев Семен Алексеевич, 4 группа, доклад о проделанной работе
# # Анализ пиков гистоновой метки
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

![hist1](results/filter_peaks.H3K4me1_ENCFF596ORE.mm10.init.hist.png "Для ENCFF596ORE")​

![hist2](results/filter_peaks.H3K4me1_ENCFF596ORE.mm10.init.hist.png "Для ENCFF791SEO")​

Вот новые гистограммы:

![hist3](results/filter_peaks.H3K4me1_ENCFF596ORE.mm10.filtered.hist.png "Для ENCFF596ORE")​

![hist4](results/filter_peaks.H3K4me1_ENCFF791SEO.mm10.filtered.hist.png "Для ENCFF791SEO")​

Рассмотрим, где располагаются пики гистоновой метки относительно аннотированных генов:


![pie1](results/chip_seeker.H3K4me1_ENCFF596ORE.mm10.filtered.plotAnnoPie.png "Для ENCFF596ORE")​

![pie2](results/chip_seeker.H3K4me1_ENCFF791SEO.mm10.filtered.plotAnnoPie.png "Для ENCFF791SEO")​

Как мы видим, большинство пиков приходится на интроны и межгенные участки.


Затем я объединил два набора отфильтрованных ChIP-seq пиков с помощью утилиты bedtools merge.

>cat  *.filtered.bed  |   sort -k1,1 -k2,2n   |   bedtools merge   >  H3K4me3_A549.merge.hg19.bed 

Можно проверить корректность работы bedtools, визуализировав пики до и после объединения в геномном браузере:

![browser](results/genome_browser_pic.png "Пики двух экспериментов и объединения")​

Кажется, все работает!

# # Анализ участков вторичной структуры
