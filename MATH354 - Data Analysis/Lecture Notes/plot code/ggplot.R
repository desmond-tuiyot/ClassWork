############
# ggplot2 -- setup
############
#ggplot(data=dataframe,  #Specify data to be used
#       aes(x=dataframe$x, y=dataframe$y, fill= dataframe$groupby)) #specify x and y


############
# ggplot2 -- library
############
library(ggplot2) #loads ggplot functionality
library(gridExtra) #for arranging multiple plots

#Load data
ship1dat<-read.table(file = "https://cipolli.com/students/data/ship1.txt",
                     sep=",",header=TRUE)

############
# ggplot2 -- barplot
############
#frequency bar plot
ggdat<-data.frame(table(ship1dat$Ship1))
colnames(ggdat)=c("Ship1","Count")
p1<-ggplot(data=ggdat,aes(x=Ship1,y=Count)) + #tell ggplot which data to use
  geom_bar(stat="identity",           #plot the count (no transformation needed)
           color="black",             #bar outline color
           fill="lightblue")        + #bar colors
  xlab("Ship1 Status")              + #x axis label
  ylab("Frequency")                 + #y axis label
  ggtitle("Ship1 Status of Mice") + #add title to plot
  geom_hline(yintercept=0)          + #adds a line for the x-axis
  theme_bw()                     #removes grey background
#relative frequency bar plot
ggdat<-data.frame(prop.table(table(ship1dat$Ship1)))
colnames(ggdat)=c("Ship1","Proportion")
p2<-ggplot(data=ggdat, aes(x=Ship1, y=Proportion)) + #tell ggplot which data to use
  geom_bar(stat="identity",  #make y the realtive frequency (proportion)
           color="black",            #bar outline
           fill="lightblue")      + #bar colors
  xlab("Ship1 Status")              + #x axis label
  ylab("Relative Frequency")                 + #y axis label
  ggtitle("Ship1 Status of Mice") + #add title to plot
  geom_hline(yintercept=0)          +  #adds a line for the x-axis
  theme_bw()                    #removes grey background
grid.arrange(p1,p2,ncol=2) #print plots side by side

#We can flip these plots
p1.flipped<-p1+ coord_flip()
p2.flipped<-p2+ coord_flip()
grid.arrange(p1.flipped,p2.flipped,ncol=2) #print both plots

############
# ggplot2 -- pie chart
############
#Create Data for pie chart
proportions<-(as.numeric(table(ship1dat$Ship1))/nrow(ship1dat))*100 #convert to percentage
label.positions<-cumsum(proportions) - 0.5*proportions #label placement at center of slice
Ship1.levels<-levels(ship1dat$Ship1)
(piechart.df<-data.frame(proportions,label.positions,Ship1.levels))
#Create Plot
p3<-ggplot(data=piechart.df, aes(x="",y=proportions,fill=Ship1.levels)) + #tell ggplot which data to use
  geom_bar(stat="identity")  + #uses the y-values specified above
  coord_polar("y", start=0)  + #tells ggplot to convert to a pie chart
  scale_fill_brewer(palette="Blues") + #gives a nice light blue color
  xlab("")                 + #blank x axis label
  ylab("")                 + #blank y axis label
  ggtitle("Ship1 Status of Mice") + #add title to plot
  theme_bw() + #removes grey background 
  geom_text(aes(y=label.positions,label = round(proportions,1))) #adds labels
p3


############
# ggplot2 -- histogram
############
p1<-ggplot(data=ship1dat, aes(x=iNKT)) + #which data to plot
  geom_histogram(bins=10,            #how many bins to use
                 fill = "lightblue", color="black")  + #color the histogram)  
  xlab("Frequencies of iNKT Cells")  + #x axis label
  ylab("Frequency")                  + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations") + #add title to plot
  theme_bw()                    + #removes grey background 
  geom_hline(yintercept=0)             #adds a line for the x-axis

p2<-ggplot(data=ship1dat, aes(x=iNKT)) + #which data to plot
  geom_histogram(aes(y = ..density..), #plots the density
                 binwidth=density(ship1dat$iNKT)$bw, #sets bin width
                 fill = "lightblue", color="black")  + #color the histogram
  geom_density(fill="red", alpha = 0.2) +
  xlab("Frequencies of iNKT Cells")  + #x axis label
  ylab("Density")                    + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations") + #add title to plot
  theme_bw()                    + #removes grey background 
  geom_hline(yintercept=0)             #adds a line for the x-axis

grid.arrange(p1,p2,ncol=2) #print both plots


############
# ggplot
############
p1<-ggplot(data=ship1dat[ship1dat$Ship1=="+/+",], aes(x=iNKT)) + #which data to plot
  geom_histogram(aes(y = ..density..), #plots the density
                 binwidth=density(ship1dat$iNKT)$bw, #sets bin width
                 fill = "lightblue", color="black")  + #color the histogram
  geom_density(fill="red", alpha = 0.2) +
  xlab("Frequencies of iNKT Cells")  + #x axis label
  ylab("Density")                    + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
          subtitle = "Mice with +/+ Ship1 Status") + #add title to plot
  theme_bw()                    + #removes grey background 
  geom_hline(yintercept=0)             #adds a line for the x-axis

p2<-ggplot(data=ship1dat[ship1dat$Ship1=="+/-",], aes(x=iNKT)) + #which data to plot
  geom_histogram(aes(y = ..density..), #plots the density
                 binwidth=density(ship1dat$iNKT)$bw, #sets bin width
                 fill = "lightblue", color="black")  + #color the histogram
  geom_density(fill="red", alpha = 0.2) +
  xlab("Frequencies of iNKT Cells")  + #x axis label
  ylab("Density")                    + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
          subtitle = "Mice with +/- Ship1 Status") + #add title to plot
  theme_bw()                    + #removes grey background 
  geom_hline(yintercept=0)             #adds a line for the x-axis

p3<-ggplot(data=ship1dat[ship1dat$Ship1=="-/-",], aes(x=iNKT)) + #which data to plot
  geom_histogram(aes(y = ..density..), #plots the density
                 binwidth=density(ship1dat$iNKT)$bw, #sets bin width
                 fill = "lightblue", color="black")  + #color the histogram
  geom_density(fill="red", alpha = 0.2) +
  xlab("Frequencies of iNKT Cells")  + #x axis label
  ylab("Density")                    + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
          subtitle = "Mice with -/- Ship1 Status") + #add title to plot
  theme_bw()                    + #removes grey background 
  geom_hline(yintercept=0)             #adds a line for the x-axis
grid.arrange(p1,p2,p3,ncol=3)

############
# ggplot2
############
p1<-ggplot(data=ship1dat, aes(x=iNKT,fill=Ship1)) + #which data to plot
  geom_histogram(aes(y = ..density..), #plots the density
                 binwidth=0.2, #sets bin width
                 color="black",alpha=0.25,
                 position = "identity")+
  geom_density(alpha = 0.2) +
  xlab("Frequencies of iNKT Cells")  + #x axis label
  ylab("Density")                    + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
          subtitle = "Mice with +/+ Ship1 Status") + #add title to plot
  theme_bw()                    + #removes grey background 
  geom_hline(yintercept=0)           +  #adds a line for the x-axis
  scale_fill_manual(values=c("red", "blue", "grey"))

p2<-ggplot(data=ship1dat, aes(x=iNKT,fill=Ship1)) + #which data to plot
  geom_density(alpha = 0.2) +
  xlab("Frequencies of iNKT Cells")  + #x axis label
  ylab("Density")                    + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
          subtitle = "Mice with +/+ Ship1 Status") + #add title to plot
  theme_bw()                    + #removes grey background 
  geom_hline(yintercept=0)           +  #adds a line for the x-axis
  scale_fill_manual(values=c("red", "blue", "grey"))
grid.arrange(p1,p2,ncol=2)

############
# ggplot2
############
p1<-ggplot(ship1dat, aes(x="", y=iNKT)) + 
  geom_boxplot(fill="lightblue")+
  xlab("")  + #x axis label
  ylab("Frequencies of iNKT Cells")                  + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations") + #add title to plot
  theme_bw()  #removes grey background 

p2<-ggplot(ship1dat, aes(x="", y=iNKT)) + 
  geom_boxplot(fill="lightblue")+
  xlab("")  + #x axis label
  ylab("Frequencies of iNKT Cells")                  + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations") + #add title to plot
  theme_bw()+  #removes grey background 
  geom_jitter(position=position_jitter(0.2))
grid.arrange(p1,p2,ncol=2)


############
# ggplot2
############
ggplot(ship1dat, aes(x=Ship1, y=iNKT)) + 
  geom_boxplot(fill="lightblue")+
  xlab("Ship1")  + #x axis label
  ylab("Frequencies of iNKT Cells")    + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations") + #add title to plot
  theme_bw()  #removes grey background 




#####################################
# Graphical Summary -- violin plot 
#####################################
p1<-ggplot(ship1dat, aes(x="", y=iNKT)) + 
  geom_violin(fill="lightblue",    
              trim = FALSE,
              draw_quantiles = c(0.25,0.5,0.75), 
              alpha = 0.5, 
              show.legend = FALSE)+
  xlab("")  + #x axis label
  ylab("Frequencies of iNKT Cells")                  + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations") + #add title to plot
  theme_bw()+  #removes grey background 
  geom_jitter(position=position_jitter(0.2))

p2<-ggplot(ship1dat, aes(x="", y=iNKT)) + 
  geom_violin(fill="lightblue",    
              trim = FALSE,
              alpha = 0.5, 
              show.legend = FALSE)+
  geom_boxplot(width = 0.25, fill="white") + #plot smaller boxplot inside violin
  xlab("")  + #x axis label
  ylab("Frequencies of iNKT Cells")                  + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations") + #add title to plot
  theme_bw()  #removes grey background 
grid.arrange(p1,p2,ncol=2)


############
# groups
############
p1<-ggplot(ship1dat, aes(x=Ship1, y=iNKT)) + 
  geom_violin(fill="lightblue",    
              trim = FALSE,
              draw_quantiles = c(0.25,0.5,0.75), 
              alpha = 0.5, 
              show.legend = FALSE)+
  xlab("Ship1")  + #x axis label
  ylab("Frequencies of iNKT Cells")    + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations") + #add title to plot
  theme_bw()  +#removes grey background 
  geom_jitter(position=position_jitter(0.2))

p2<-ggplot(ship1dat, aes(x=Ship1, y=iNKT)) + 
  geom_violin(fill="lightblue",    
              trim = FALSE,
              alpha = 0.5, 
              show.legend = FALSE)+
  geom_boxplot(width = 0.25, fill="white") + #plot smaller boxplot inside violin
  xlab("Ship1")  + #x axis label
  ylab("Frequencies of iNKT Cells")    + #y axis label
  ggtitle("Frequencies of Invariant Natural Killer T (iNKT) Cell Populations") + #add title to plot
  theme_bw()  #removes grey background 
grid.arrange(p1,p2,ncol=2)