<img style="align: right;" height="40" src="https://github.com/nzilbb/Covariation_monophthongs_NZE/blob/master/Covariation_shiny/www/NZILBB2.png?raw=true">

---

## Systematic co-variation of monophthongs across speakers of New Zealand English (repository)

Brand, J., Hay, J., Clark, L., Watson, K., & Sóskuthy, M. (submitted). Systematic co-variation of monophthongs across speakers of New Zealand English.

[![GitHub](https://img.shields.io/badge/GitHub-repo-blue?labelColor=lightgrey&logo=github)](https://github.com/nzilbb/Covariation_monophthongs_NZE)
[![OSF](https://tinyurl.com/osfshield1)](https://osf.io/q4j29/)
[![Pre-print](https://img.shields.io/badge/Preprint-pdf-blue?labelColor=lightgrey&logo=Adobe-Acrobat-Reader)	](https://nzilbb.github.io/Covariation_monophthongs_NZE/Write_up/Covariation_monophthongs_NZE.pdf)
[![Analysis](https://img.shields.io/badge/Analysis-html-blue?labelColor=lightgrey&logo=RStudio&logoColor=GhostWhite)](https://nzilbb.github.io/Covariation_monophthongs_NZE/Covariation_monophthongs_analysis.html)
[![Shiny](https://img.shields.io/badge/Shiny-link-blue?labelColor=lightgrey&logo=RStudio&logoColor=GhostWhite)](https://onze.shinyapps.io/Covariation_shiny/)

![Commit](https://img.shields.io/github/last-commit/nzilbb/Covariation_monophthongs_NZE)
![visitors](https://visitor-badge.laobi.icu/badge?page_id=nzilbb.Covariation_monophthongs_NZE)

---

### Download

You can download this repository as a `.zip` file, with all the files described below (advised):

[![Download](https://img.shields.io/badge/download-.zip-brightgreen)](https://github.com/nzilbb/Covariation_monophthongs_NZE/archive/master.zip)

Or you can clone this repository using your terminal/command prompt (if you are familiar with GitHub, advised):

```
git clone https://github.com/nzilbb/Covariation_monophthongs_NZE.git
```

Or fork it on GitHub (if you are familiar with GitHub, advised:

[![GitHub forks](https://img.shields.io/github/forks/nzilbb/Covariation_monophthongs_NZE.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/nzilbb/Covariation_monophthongs_NZE/fork/)

You can also download individual files using the ![](https://tinyurl.com/yct7xbra) icon (this not advised as most files are dependent on other files to run correctly).

---

## **Abstract**

The study of phonetic variation and change has tended to concentrate on particular variables in isolation, and it has proven challenging to move beyond an analysis of individual variables or small groups of variables, towards a better theoretical and empirical understanding of entire _vowel systems_. We develop a methodology that facilitates the study of co-variation, and introduce a large scale analysis of how elements of full sound systems co-vary across hundreds of speakers, demonstrating how constellations of vocalic variables operate together. Our data-set comprises F1 and F2 for 10 monophthongs of New Zealand English. We first obtain estimates of how advanced each speaker is with respect to changes in each of the vowels, irrespective of known predictors of sound change (i.e. year of birth, gender, speech rate). This is done by extracting by-speaker intercepts from Generalised Additive Models. We then use Principal Component Analysis on these intercepts to investigate the underlying structural co-variation that exists across the vocalic variables.  Within a large subset of vowels, we see 'leaders' and 'laggers' of sound change; however, there are also groups of vowels which stand in opposition to each other, such that if a speaker is innovative in one, they tend to be conservative in the other.  Some sets of covarying vowels could be linked by structural relationships (such as chain-shifting), but there are also covarying sets of vowels with no clear structural relationship, and which may be linked by shared social meaning. Our analysis provides novel insights into the structure of sound systems, demonstrating the existence of structured patterns in the realisations of specific vocalic variables across a large group of speakers. This approach offer a means to overcome long-standing methodological challenges in the study of phonetic co-variation, paving the way for research to move beyond the analysis of individual variables, towards an understanding of variation and co-variation in sound systems.

---

## **Repository structure**

In this repository you will find various files. related to the project. They are described in detail below.

You are reading the `README.md` file.

### Analysis files

- **Covariation_monophthongs_analysis.Rmd** [![](https://tinyurl.com/yct7xbra)](https://raw.githubusercontent.com/nzilbb/Covariation_monophthongs_NZE/master/Covariation_monophthongs_analysis.Rmd)

	- R Markdown document containing all the code that is required to reproduce the analyses reported in the paper
	- This file is to be used in RStudio
	- It requires the `data` folder to work

- **Covariation_monophthongs_analysis.html** [![](https://tinyurl.com/yct7xbra)](https://nzilbb.github.io/Covariation_monophthongs_NZE/Covariation_monophthongs_analysis.html)

	- HTML output of the main analysis file (`Covariation_monophthongs_analysis.Rmd`)
	- This is used as a web accessible version of the analysis (accessible [[here]](https://nzilbb.github.io/Covariation_monophthongs_NZE/Covariation_monophthongs_analysis.html))

- **Figures**

	- The figures used in the manuscript

- **Covariation_monophthongs_analysis_files**

	- All figures produced from the `Covariation_monophthongs_analysis.Rmd` file
	- These are in `.png` format and are used as an external source for the images in the `.html` output
	- Created to reduce the size of the `Covariation_monophthongs_analysis.html` file

- **Covariation_monophthongs_filtering_anon.Rmd** [![](https://tinyurl.com/yct7xbra)](https://raw.githubusercontent.com/nzilbb/Covariation_monophthongs_NZE/master/Covariation_monophthongs_filtering_anon.Rmd)

	- R Markdown document containing all the code that was run during the filtering workflow reported in the paper
	- This file is to be used in RStudio
	- We do not provide the raw data for this file to run as it contains information about the speakers that we do not wish to make publicly available

- **Covariation_monophthongs_filtering_anon.html** [![](https://tinyurl.com/yct7xbra)](https://nzilbb.github.io/Covariation_monophthongs_NZE/Covariation_monophthongs_filtering_anon.html)

	- HTML output of the data filtering file (`Covariation_monophthongs_filtering_anon.Rmd`)
	- This is used as a web accessible version to show the workflow of the data filtering (accessible [[here]](https://nzilbb.github.io/Covariation_monophthongs_NZE/Covariation_monophthongs_filtering_anon.html))

- **Data**

	- All data files required to run the main analysis file
	- The data is described in the manuscript and the .Rmd files
	- This contains
		- The raw data file as a R data object `ONZE_vowels_filtered_anon.rds` [![](https://tinyurl.com/yct7xbra)](https://github.com/nzilbb/Covariation_monophthongs_NZE/raw/master/Data/ONZE_vowels_filtered_anon.rds)
		- The random intercepts for speaker from the GAMMs `gam_intercepts_tmp_new.csv` [![](https://tinyurl.com/yct7xbra)](https://raw.githubusercontent.com/nzilbb/Covariation_monophthongs_NZE/master/Data/gam_intercepts_tmp_new.csv)
		- The random intercepts for speaker from the lmers `lmer_intercepts.csv` [![](https://tinyurl.com/yct7xbra)](https://raw.githubusercontent.com/nzilbb/Covariation_monophthongs_NZE/master/Data/lmer_intercepts.csv)
	- An additional folder `Models` containing pre-run GAMM outputs

- **Figures**

	- All figures produced from the `Covariation_monophthongs_analysis.Rmd` file
	- These are the images that are used in the manuscript

- **Covariation_shiny**

	- All the files that run the shiny web app (accessible [[here]](https://onze.shinyapps.io/Covariation_shiny/))
	- The `app.R` file contains the R code which provides the user interface and server side operations
	- There are two data files:
		- `ONZE_summary.rds` contains speaker summaries per vowel (mean F1/F2, demographics, PC scores) and PC vowel-formant loadings. This is used to generate the PC score and vowel space plots
		- `mod_pred_data.rds` contains the model predictions from the year of birth GAMMs. This is used for the sound change exploration
		- `mod_pred_PC_values_data.rds` contains the model predictions for the PC scores analysis. This is used to give an impression of how the speakers may differ in each PC
	- The `www` folder contains various images to customise the appearance of the app. There is also `about.md` and `more.md` that create the about and more sections

	- You can also run the app locally using the following R code (note you need the `shiny` package installed in R, you can do this by `install.packages("shiny")`):

<br>

	```r
	library(shiny)
	runUrl( "https://nzilbb.github.io/Covariation_monophthongs_NZE/Covariation_shiny.zip")
	```

---

### **Write_up**

This folder contains files that were submitted for publication - the manuscript, bibliography file and cover letter.

- **Covariation_monophthongs_NZE.pdf**

- **Cover_letter_JPhon.pdf**

- **Covariation_references.bib**
