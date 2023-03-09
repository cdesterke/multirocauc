#' @title roctable

#' this function output a table of AUC results
#' @usage roctable(roc.list)
#' @examples data(kras)
#' @examples kras<-rocpreprocess(kras)
#' @examples data(geneset)
#' @examples roc.list<-roclist(kras,geneset,outcome="os.status")
#' @examples roc.table<-roctable(roc.list)
#' @examples roc.table

roctable<-function(roc.list){
    #install require R packages if necessary and load them
    if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
        }

    if(!require(purrr)){
    install.packages("purrr")
    library(purrr)
        }


		
	roc.list %>% 
		map(~tibble(AUC = .$auc))->data.auc

	x <- data.auc
	data.auc<-Map(function(x, i) paste(x), x,names(x))

	values<-t(data.frame(data.auc))
	values<-as.data.frame(values)
	values$id<-row.names(values)
	colnames(values)<-c("auc","id")
	values$auc<-as.numeric(values$auc)
	return(values)
  
}