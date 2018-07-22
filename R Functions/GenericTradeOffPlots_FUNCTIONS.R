#---------------------------------------------------------------------------------------
#   FUNCTION TO CREATE A TRADE OFF PLOT
#---------------------------------------------------------------------------------------

generic.trade.off.plot <- function(x.vec,y.vec,
							x.label="X Label",x.lim=NULL,
							y.label="Y Label",y.lim=NULL,
							plot.title="Plot Title",
							pch.use=NULL,
							pch.cols=NULL,
							pch.bg=NULL){

# NOTE: 
# vec.x and vec.y must have the same length
# can specify a vector of plotting symbols and colors and background colors (pch.use, pch.cols, pch.bg) 
		
if(length(x.vec) != length(x.vec)){stop("Input vectors must have same length")}	
	
if(is.null(x.lim)){x.lim <- c(0,max(x.vec,na.rm=TRUE))}
if(is.null(y.lim)){y.lim <- c(0,max(y.vec,na.rm=TRUE))}

if(is.null(pch.use)){pch.use <- rep(21,length(x.vec))}
if(is.null(pch.cols)){pch.cols<- rep("darkblue",length(x.vec))}
if(is.null(pch.bg)){pch.bg <- rep("lightgrey",length(x.vec))}


plot(x.vec,y.vec,bty="n",xlim=x.lim,ylim=y.lim,
		xlab=x.label, ylab= y.label,pch=pch.use,col=pch.cols,bg=pch.bg, cex=1.5 )



title(main=plot.title, col.main="darkblue",cex.main=1.3)

} # end generic.trade.off.plot()

