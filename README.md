# HEB_categories
Identification of the homoeologous expression bias (HEB) categories for each quadruplet

# Introduction
The coordinated expression of highly related homoeologous genes in polyploid species underlies the phenotypes of many of the world's major crops (Ramírez-González et al., 2018). Identification the patterns of HEB category for each quadruplet (1:1:1:1) could help us better study the diversity of octoploid species phenotypes. This study defined nine ideal categories of quadruplets and determined the category of each quadruplet by comparing the shortest distance between each quadruplet with the nine ideal quadruplets.

<img src="https://user-images.githubusercontent.com/72123585/233905753-b1a49b5f-1141-4503-9715-6ced46f03bb5.jpg" width="900" height="450">

# Dependencies
Practical Extraction and Report Language (Perl v5.26.2 is more recommended in this study)

# Installation
`wget https://github.com/jinxin112233/HEB_categories.git`

`unzip HEB_categories-main.zip` and `cd HEB_categories-main`

`chmod +x HEB_categories.perl`

`export PATH=/your/path/to/HEB_categories-main`

# Input file format
Input file: input.fpkm.txt

<img src="https://user-images.githubusercontent.com/72123585/233907234-b5ca7e6b-8994-4b5a-bfd7-0f8a4d939e0a.png" width="650" height="220">

Note: The values in the table represent the expression of each homoeologous (FPKM or TPM is recommended).

# Usage
##Identification of HEB categories

`HEB_categories.perl input.fpkm.txt`

-----------------------------------------

##Output file processing

`sed 1d input.fpkm.txt | awk '{print$1}' - > tmp1.txt`

`awk '{print$5}' input.fpkm.txt_summary > tmp2.txt`

`paste tmp1.txt tmp2.txt > output.Categories.txt`

# Output file
Output file: output.Categories.txt

<img src="https://user-images.githubusercontent.com/72123585/233910231-3414cb9c-9fea-4f2e-8811-e248fe3ba233.png" width="300" height="250">

Note: A dominant (AD), B dominant (BD), C dominant (CD), D dominant (DD), A suppressed (AS), B suppressed (BS), C suppressed (CS) and D suppressed (DS).

# Note
Before you start running your data, we recommend that you run test data (input.fpkm.txt).

# Limitations
Please input each quadruple with a total expression > 0.5 (not normalized) or input the normalized data. If you input a quadruple with total expression < 0.5, the above command you use to process may get an error that the category does not match the quadruple id.

# Reference
Ramírez-González, R. H. et al. The transcriptional landscape of polyploid wheat. Science. 361, eaar6089 (2018).

Ye, C. Y. et al. The Genomes of the allohexaploid Echinochloa crus-galli and its progenitors provide insights into polyploidization-driven Adaptation. Mol. Plant. 13, 1298–1310 (2020).

# Citations
Chromosomal-scale haplotype-resolved genome assemblies of the two wild octoploid progenitors of cultivated strawberry illuminate genomic diversification from wild relatives to modern cultivars (in revision).
