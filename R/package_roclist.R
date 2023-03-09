#' @title roclist

#' this function makes ROC analyses
#' @usage roclist(kras,geneset,outcome="os.status")
#' @examples data(kras)
#' @examples kras<-rocpreprocess(kras)
#' @examples data(geneset)
#' @examples roc.list<-roclist(kras,geneset,outcome="os.status")
#' @examples roc.list


roclist<-function(data,set,outcome="os.status"){
    suppressWarnings(suppressMessages({
	#install require R packages if necessary and load them
    if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
        }

    if(!require(pROC)){
    install.packages("pROC")
    library(pROC)
        }



	## define outcome
	outcome <- as.character(outcome)

	## define formula
	f <- formula(paste(outcome, paste(set, collapse = " + "), sep = " ~ "))
	
	## perform roc analyses on the formula
	roc.list<-roc(f,data=data)



    return(roc.list)
	}))
}