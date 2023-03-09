# multirocauc
R-package to draw multiroc with auc on legends


## code for processing analysis

```r
## preprocess remove missing data
library(multirocauc)
data(kras)
kras<-rocpreprocess(kras)
head(kras)

```
![res](https://github.com/cdesterke/multirocauc/blob/main/rocpreprocess.png)

