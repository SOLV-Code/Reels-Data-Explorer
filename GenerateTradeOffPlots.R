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




# -------------------------------------------------
# Plot 1: Test
vec.x.tmp <- reels.df[,"Price"]
names(vec.x.tmp) <- reels.df[,"Price"]
vec.y.tmp <- reels.df[,"TotalBearings"]

pch.list <- c(3,4)
col.list <- c("red","darkblue")
bg.list <- c("white","white")

casting.idx <- reels.df[,"Type"]=="Casting"
spinning.idx <- reels.df[,"Type"]=="Spinning"

pch.in <- cols.in <- bg.in <- rep(NA,length(vec.x))

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

legend("bottomright",legend=c("Casting","Spinning"),pch=pch.list,col=col.list,bg=bg.list,bty="n",cex=0.8)

abline(h=8,col="red")
abline(v=300,col="red")


