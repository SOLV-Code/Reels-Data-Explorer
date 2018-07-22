# Script to generate a few alternstive trade-off plots


# -------------------
# Read in the latest version of all the custom functions
fn.file.list <- list.files(path="R Functions/",pattern=".R") # get all .R files 
for(file.source in fn.file.list){
		print(paste("Sourcing: ",file.source))
		source(paste("R Functions",file.source,sep="/"))}


# -------------------
# Read in the data file
reels.df <- read.csv("DATA/Reels_Data.csv",stringsAsFactors=FALSE)





# start pdf


pdf("OUTPUT/Example1Plots.pdf",height=8.5,width=11,onefile=TRUE)

par(pty="s",mfrow=c(2,2))


# -------------------------------------------------
# Plot 1: Bearings vs. Price
vec.x.tmp <- reels.df[,"Price"]
names(vec.x.tmp) <- reels.df[,"LabelShort"]
vec.y.tmp <- reels.df[,"TotalBearings"]
names(vec.y.tmp) <- reels.df[,"LabelShort"]

pch.list <- c(3,4)
col.list <- c("red","darkblue")
bg.list <- c("white","white")

casting.idx <- reels.df[,"Type"]=="Casting"
spinning.idx <- reels.df[,"Type"]=="Spinning"

pch.in <- cols.in <- bg.in <- rep(NA,length(vec.x.tmp))

pch.in[casting.idx] <- pch.list[1]
pch.in[spinning.idx] <- pch.list[2] 

cols.in[casting.idx] <- col.list[1]
cols.in[spinning.idx] <- col.list[2]

bg.in[casting.idx] <- bg.list[1]
bg.in[spinning.idx] <- bg.list[2]


generic.trade.off.plot(x.vec=vec.x.tmp,y.vec=vec.y.tmp,
		x.label="Price ($)",x.lim=NULL, y.label="Total Bearings",y.lim=NULL,
		plot.title="Bearings vs Price",
		pch.use=pch.in,pch.cols=cols.in,pch.bg=bg.in)

legend("bottomright",legend=c("Casting","Spinning"),pch=pch.list,col=col.list,bg=bg.list,bty="n",cex=0.9)

abline(h=7.5,col="red")
abline(v=300,col="red")

# -------------------------------------------------
# Plot 1b: Bearings vs. Price (zoomed in with labels)


generic.trade.off.plot(x.vec=vec.x.tmp[casting.idx],y.vec=vec.y.tmp[casting.idx],
		x.label="Price ($)",x.lim=c(0,350), y.label="Total Bearings",y.lim=c(6,15),
		plot.title="Bearings vs Price (Subset)",
		pch.use=pch.in,pch.cols=cols.in,pch.bg=bg.in)


abline(h=7.5,col="red")
abline(v=300,col="red")
text(vec.x.tmp[casting.idx],vec.y.tmp[casting.idx],labels=names(vec.x.tmp[casting.idx]),pos=3,cex=0.7)




# -------------------------------------------------
# Plot 3: Bearings vs. Price
vec.x.tmp <- reels.df[,"Price"]
names(vec.x.tmp) <- reels.df[,"LabelShort"]
vec.y.tmp <- reels.df[,"MaxDrag_lbs"]
names(vec.y.tmp) <- reels.df[,"LabelShort"]

pch.list <- c(3,4)
col.list <- c("red","darkblue")
bg.list <- c("white","white")

casting.idx <- reels.df[,"Type"]=="Casting"
spinning.idx <- reels.df[,"Type"]=="Spinning"

pch.in <- cols.in <- bg.in <- rep(NA,length(vec.x.tmp))

pch.in[casting.idx] <- pch.list[1]
pch.in[spinning.idx] <- pch.list[2] 

cols.in[casting.idx] <- col.list[1]
cols.in[spinning.idx] <- col.list[2]

bg.in[casting.idx] <- bg.list[1]
bg.in[spinning.idx] <- bg.list[2]


generic.trade.off.plot(x.vec=vec.x.tmp,y.vec=vec.y.tmp,
		x.label="Price ($)",x.lim=NULL, y.label="Max Drag (lbs)",y.lim=NULL,
		plot.title="Max Drag vs Price",
		pch.use=pch.in,pch.cols=cols.in,pch.bg=bg.in)

legend("bottomright",legend=c("Casting","Spinning"),pch=pch.list,col=col.list,bg=bg.list,bty="n",cex=0.8)


dev.off()


