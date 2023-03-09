# multirocauc
R-package to draw multiroc with auc on legends


## code to install multirocauc package
```r
library(devtools)
install_github("cdesterke/multirocauc")
```


## code for preprocessing data

```r
## preprocess remove missing data
library(multirocauc)
data(kras)
kras<-rocpreprocess(kras)
head(kras)

```
![res](https://github.com/cdesterke/multirocauc/blob/main/rocpreprocess.png)

## code for performing list of roc analyses

```r
## load geneset = list of variables and perform roc analyses
data(geneset)
roc.list<-roclist(kras,geneset,outcome="os.status")
roc.list


```
![res](https://github.com/cdesterke/multirocauc/blob/main/roclist.png)


## code for drwing multiroc curve with AUC

```r
rocplot(roc.list,line=0.5,title="KRAS network ~ OS pancreas cancer",police=14)


```
![res](https://github.com/cdesterke/multirocauc/blob/main/rocplot.png)




