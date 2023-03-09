#' @title rocplot

#' this function makes the ROC plot
#' @usage rocplot(roc.list,line=0.5,title="KRAS network ~ OS pancreas cancer",police=14)
#' @examples data(kras)
#' @examples kras<-rocpreprocess(kras)
#' @examples data(geneset)
#' @examples roc.list<-roclist(kras,geneset,outcome="os.status")
#' @examples rocplot(roc.list,line=0.5,title="KRAS network ~ OS pancreas cancer",police=14)


rocplot<-function(roc.list,line=0.5,title="KRAS network ~ OS pancreas cancer",police=14){
    #install require R packages if necessary and load them
    if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
        }

    if(!require(purrr)){
    install.packages("purrr")
    library(purrr)
        }

    if(!require(pals)){
    install.packages("pals")
    library(pals)
        }
	
	    if(!require(ggplot2)){
    install.packages("ggplot2")
    library(ggplot2)
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

	# generate labels 
	values %>% mutate(label_long=paste0(id," , AUC = ",paste(round(auc,2)))) -> data.labels

	# plot on a single plot with AUC in labels
	ggroc(roc.list,size=line) +
		scale_color_manual(labels=data.labels$label_long,values=as.vector(cols25()))+
		theme_classic()+theme(text=element_text(size=police))+
		ggtitle(title)
  

}