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

## output table of AUC

```r

roc.table<-roctable(roc.list)
roc.table

```
![res](https://github.com/cdesterke/multirocauc/blob/main/roctable.png)

## filter item with auc superior 0.7
```r
roc_list_filtered <- Filter(function(x) !is.null(x$auc) && as.numeric(x$auc) > 0.7, roc.list)
```
