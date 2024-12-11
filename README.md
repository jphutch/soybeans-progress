# README

## Productivity Growth from Genetic Improvement: Evidence from Illinois Soybean Trial Data

**Author:** Jared Hutchins, jhtchns2@illinois.edu; Scott Irwin 

To keep up to date with any changes or point out errors in this code, please refer to [the companion GitHub repository](https://github.com/jphutch/soybeans-progress).

### Abstract

In 2023, the United States produced 28% of the world's soybeans, making understanding yield trends in the United States important for understanding global price trends. We estimate yield growth due to genetic change in soybeans using Illinois variety trial data with a modified approach. Specifically, our approach uses the yield from ``check varieties'' that are planted consistently from 1997 to 2020 as a control variable to identify the gain in yield across years using only yield variation within the plot and year. Ours are the first estimates of genetic gain in commercial soybean varieties after 2010 and we find that soybean yields increased between 25-26 kg/ha (0.37-0.38 bu/acre), or 0.7%, per year at a roughly linear rate in the past two decades. We find mixed evidence that the yield of genetically engineered soybeans grew faster than conventional varieties: in many years, conventional varieties did just as well as genetically engineered ones. We also find that adding the check variety's yield as a control variable significantly impacts how models in the literature estimate the average annual yield gain from genetics in these data. Our findings suggest that genetic change continued to be a consistent driver of yield change in soybeans over the past two decades.

### Directories
The files necessary for replicating this paper are organized into four main directories:

\code

- Code in Python and R for cleaning the data and producing the results.


\writing
- Latex code for generating the paper, plus supplementary materials.


\figs
- Figures generated for the paper.

\results
- Results used to make tables and figures.

### Code
The analysis and data cleaning was done using Python 3.8.20 and 4.4.1. The python code files are in the form of Jupyter notebooks, which allow for interactive coding. The Python environment used to run the notebooks is in the file __environment.yml__ and can be created after installing Anaconda 3 and running the command:

`conda env create -f environment.yml`

Each code file starts with a two digit number indicating the order in which the files should be run.

Tables used in the paper are all generated in various code files using the command "stargazer" in R or to_latex() in Python but most tables have changed formatting when they are eventually placed in the paper to fit the style of the article.

Figures are almost all created with `matplotlib.` Note that depending on how your environment looks the Figures may look slightly different than those that are in the paper.

### Generating the Data
The main data files are "soybeans_95_20.csv" and "entries_97_20.csv", both of which are from the Soybean Variety Trials data found at the location below. Once downloading the raw files, a user can run the file 10_Data_Assembly.ipynb to assemble "soybeans_95_20.csv." Since the data cannot be stored on GitHub, the data files should be copied over from the data files that are stored in a zip folder at the AJAE website to the directory "data."


### Data Sources
Soybean Variety Trials, 1995-2020 https://vt.cropsci.illinois.edu/soybeans/

PRISM Climate Group, https://www.prism.oregonstate.edu/ 

NASS Crop Production Annual Summary, https://usda.library.cornell.edu/concern/publications/k3569432s