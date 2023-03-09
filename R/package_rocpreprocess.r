#' @title rocpreprocess

#' this function takes input dataframe and remove missing data
#' @usage rocpreprocess(kras)
#' @examples data(kras)
#' @examples kras<-rocpreprocess(kras)
#' @examples head(kras)


rocpreprocess<-function(df){
    #install require R packages if necessary and load them
    if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
        }

    # data.frame verification
    if (!is.data.frame(df)){
    stop('input need to be a dataframe which contains outcome and quantitative covariates\n',
    'You have provided an object of class: ', class(df)[1])
        }

    #transform factor columns as characters
    df %>% mutate_if(is.factor, as.character) -> df    
    
	#remove columns with only one value
    df %>% na.omit->df
    return(df)
}