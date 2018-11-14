# Animate Diabetes Logo to celebrate #WorldDiabetesDay
library(ggplot2)
library(ggforce)

##
d<-data.frame(start=seq(0,0,by=0),end=seq(0.1,8,by=0.1),r=1)
d$textcol<-'lightskyblue'
d$textcol[1:55]<-'grey95'

inc<-seq(0.1,8,by=0.1)
for (i in 1:length(inc)){
  fileName = paste("frame", ifelse(i < 10, "0", ""), i, ".png", sep="")
  png(filename=fileName)
  g <- ggplot()+
    geom_arc(aes(x0=0, y0=0, r=r, start=0, end=inc[i]),
             data=d,size=14,colour="lightskyblue")+
    coord_equal(ratio=1)+
    scale_x_continuous(limits = c(-1.05,1.05))+
    scale_y_continuous(limits = c(-1.05,1.05))+
    annotate("text",x = 0,y=0,label="#WorldDiabetesDay",size=10,colour=d$textcol[i])+
    theme_void()
    print(g)
    dev.off()
}
##
# convert to animation
#convert *.png worlddiabeteaday.gif

