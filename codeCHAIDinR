#install.packages("CHAID", repos="http://R-Forge.R-project.org")

library(foreign)
library(Hmisc)
library(CHAID)

### example breast cancer dataset:
data("BreastCancer", package = "mlbench")  ## importing the breast cancer data

b_chaid <- chaid(Class ~ Cl.thickness + Cell.size + Cell.shape +
                   Marg.adhesion + Epith.c.size + Bare.nuclei +
                   Bl.cromatin + Normal.nucleoli + Mitoses,
                 data = BreastCancer)     ## building a CHAID model with default parameters
plot(b_chaid)  ## plotting the decision tree
