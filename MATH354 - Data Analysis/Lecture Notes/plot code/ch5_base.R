###CHAPTER 5 -- CRAN R     ##Descriptive Title
###CIPOLLI                 ##Author

####################################################################################
####################################################################################
# Section: Categorical Variables
####################################################################################
####################################################################################

#####################################
# Numerical Summaries
#####################################
ship1dat<-read.table(file = "https://cipolli.com/students/data/ship1.txt",
                     sep=",",header=TRUE)
ship1dat$Ship1
as.numeric(ship1dat$Ship1)

table(ship1dat$Ship1) #frequency table
prop.table(table(ship1dat$Ship1)) #relative frequency table

#####################################
# Graphical Summary -- Bar plots
#####################################
############
# Base
############
par(mfrow=c(1,2)) #Graphics setting 1 row, 2 columns of plots
#Frequency Bar Plot
barplot(table(ship1dat$Ship1),                   #which table to plot
        main="Ship1 Status of Mice",             #title of graph
        xlab="Ship1 Status", ylab="Frequency",   #x and y axes labels
        col="lightblue")                         #bar colors
abline(h=0)  #adds a line for the x-axis

#Relative Frequency Bar Plot
barplot(prop.table(table(ship1dat$Ship1)),       #which table to plot
        main="Ship1 Status of Mice",             #title of graph
        xlab="Ship1 Status", ylab="Relative Frequency",   #x and y axes labels
        col="lightblue")                         #bar colors
abline(h=0)  #adds a line for the x-axis


#####################################
# Graphical Summary -- Pie Charts
#####################################
############
# Base
############
par(mfrow=c(1,1)) #Reset graphics setting
labels<-paste(levels(ship1dat$Ship1)," (",  #labels
              round(prop.table(table(ship1dat$Ship1))*100,1),"%)", #percentage
              sep="") #don't separate text

pie(table(ship1dat$Ship1), #which table to plot
    labels=labels,          #add labels to pieces of the pie
    main="Ship1 Status of Mice", #title of graph
)


####################################################################################
####################################################################################
# Section: Quantitative Variables
####################################################################################
####################################################################################
#####################################
# Numerical Summary 
#####################################
mean(ship1dat$iNKT)
sd(ship1dat$iNKT)
min(ship1dat$iNKT)
quantile(x=ship1dat$iNKT,probs=0.25)
median(ship1dat$iNKT)
quantile(x=ship1dat$iNKT,probs=0.75)
max(ship1dat$iNKT)
summary(ship1dat$iNKT)
IQR(ship1dat$iNKT)
#####################################
# Numerical Summary -- by group
#####################################
tapply(X=ship1dat$iNKT,INDEX=ship1dat$Ship1,mean)
tapply(X=ship1dat$iNKT,INDEX=ship1dat$Ship1,sd)
tapply(X=ship1dat$iNKT,INDEX=ship1dat$Ship1,min)
tapply(X=ship1dat$iNKT,INDEX=ship1dat$Ship1,quantile,probs=0.25)
tapply(X=ship1dat$iNKT,INDEX=ship1dat$Ship1,median)
tapply(X=ship1dat$iNKT,INDEX=ship1dat$Ship1,quantile,probs=0.75)
tapply(X=ship1dat$iNKT,INDEX=ship1dat$Ship1,max)
tapply(X=ship1dat$iNKT,INDEX=ship1dat$Ship1,summary)
tapply(X=ship1dat$iNKT,INDEX=ship1dat$Ship1,IQR)

#####################################
# Graphical Summary -- Histograms 
#####################################
############
# Base
############
par(mfrow=c(1,2)) #Graphics setting 1 row, 2 columns of plots
hist(ship1dat$iNKT,                           #which data to plot
     #title of graph
     main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
     xlab="Frequencies of iNKT Cells", ylab="Frequency",   #x and y axes labels
     col="lightblue")                         #bar colors
abline(h=0)  #adds a line for the x-axis
hist(ship1dat$iNKT,                           #which data to plot
     #title of graph
     main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
     xlab="Frequencies of iNKT Cells",ylab="Density",    #x and y axes labels
     col="lightblue",                         #bar colors
     probability=TRUE)                        #probability distribution, not frequency
lines(density(ship1dat$iNKT),col="red",lwd=2) #add kernel density estimate
abline(h=0)  #adds a line for the x-axis


############
# Different bin sizes
############
par(mfrow=c(1,3))
hist(ship1dat$iNKT,                           #which data to plot
     #title of graph
     main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
     xlab="Frequencies of iNKT Cells",ylab="Density",    #x and y axes labels
     col="lightblue",                         #bar colors
     probability=TRUE,                        #probability distribution, not frequency
     ylim=c(0,2.25),                           #set limits of y axis
     breaks=seq(0,2,0.05))                    #specify bins
lines(density(ship1dat$iNKT),col="red",lwd=2) #add kernel density estimate
abline(h=0)  #adds a line for the x-axis

hist(ship1dat$iNKT,                           #which data to plot
     #title of graph
     main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
     xlab="Frequencies of iNKT Cells",ylab="Density",    #x and y axes labels
     col="lightblue",                         #bar colors
     probability=TRUE,                        #probability distribution, not frequency
     ylim=c(0,2.25),                           #set limits of y axis
     breaks=seq(0,2,0.2))                     #specify bins
lines(density(ship1dat$iNKT),col="red",lwd=2) #add kernel density estimate
abline(h=0)  #adds a line for the x-axis

hist(ship1dat$iNKT,                           #which data to plot
     #title of graph
     main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
     xlab="Frequencies of iNKT Cells",ylab="Density",    #x and y axes labels
     col="lightblue",                         #bar colors
     probability=TRUE,                        #probability distribution, not frequency
     ylim=c(0,2.25),                           #set limits of y axis
     breaks=seq(0,2,1))                       #specify bins
lines(density(ship1dat$iNKT),col="red",lwd=2) #add kernel density estimate
abline(h=0)  #adds a line for the x-axis



#####################################
# Graphical Summary -- Histograms by group
#####################################
############
# Base
############
par(mfrow=c(1,3))
hist(ship1dat$iNKT[ship1dat$Ship1=="+/+"],                           #which data to plot
     #title of graph
     main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations
           for Mice with +/+ Ship1 Status",
     xlab="Frequencies of iNKT Cells", ylab="Frequency",   #x and y axes labels
     col="lightblue",                         #bar colors
     probability=TRUE)                        #probability distribution, not frequency
lines(density(ship1dat$iNKT[ship1dat$Ship1=="+/+"]),col="red",lwd=2) #add kernel density estimate

hist(ship1dat$iNKT[ship1dat$Ship1=="+/-"],                           #which data to plot
     #title of graph
     main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations
           for Mice with +/- Ship1 Status",
     xlab="Frequencies of iNKT Cells", ylab="Frequency",   #x and y axes labels
     col="lightblue",                         #bar colors
     probability=TRUE)                        #probability distribution, not frequency
lines(density(ship1dat$iNKT[ship1dat$Ship1=="+/-"]),col="red",lwd=2) #add kernel density estimate

hist(ship1dat$iNKT[ship1dat$Ship1=="-/-"],                           #which data to plot
     #title of graph
     main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations
           for Mice with -/- Ship1 Status",
     xlab="Frequencies of iNKT Cells", ylab="Frequency",   #x and y axes labels
     col="lightblue",                         #bar colors
     probability=TRUE)                        #probability distribution, not frequency
lines(density(ship1dat$iNKT[ship1dat$Ship1=="-/-"]),col="red",lwd=2) #add kernel density estimate

tapply(X=ship1dat$iNKT,INDEX=ship1dat$Ship1,FUN=summary)



#####################################
# Graphical Summary -- Histogram together
#####################################
############
# Base
############
library("grDevices") #for transparent coloring
par(mfrow=c(1,2)) 
hist(ship1dat$iNKT[ship1dat$Ship1=="+/+"], #which data to plot
     #title of graph
     main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations
           by Ship1 Status",
     xlab="Frequencies of iNKT Cells", ylab="Frequency",   #x and y axes labels
     col=adjustcolor("lightblue",alpha.f = 0.5), #bar colors, alpha.f controls transparency
     probability=TRUE, #probability density, not frequency
     xlim=c(0,2), #set domain
     ylim=c(0,3)) #set range
lines(density(ship1dat$iNKT[ship1dat$Ship1=="+/+"]),col="blue",lwd=2) #add kernel density estimate

hist(ship1dat$iNKT[ship1dat$Ship1=="+/-"],  #which data to plot
     col=adjustcolor("pink",alpha.f = 0.5), #bar colors, alpha.f controls transparency
     probability=TRUE, #probability distribution, not frequency
     add=TRUE) #add to current plot
lines(density(ship1dat$iNKT[ship1dat$Ship1=="+/-"]),col="red",lwd=2) #add kernel density estimate

hist(ship1dat$iNKT[ship1dat$Ship1=="-/-"], #which data to plot
     col=adjustcolor("lightgrey",alpha.f = 0.5), #bar colors, alpha.f controls transparency
     probability=TRUE, #probability distribution, not frequency
     add=TRUE) #add to current plot
lines(density(ship1dat$iNKT[ship1dat$Ship1=="-/-"]),col="darkgrey",lwd=2) #add kernel density estimate

legend("topright",legend=c("+/+","+/+","+/-","+/-","-/-","-/-"), #location and labels
       lty=c(1,NA,1,NA,1,NA), #lty 1 is a line, NA means not a line
       lwd=rep(2,6),          # sets line width for lines
       pch=c(NA,15,NA,15,NA,15), #uses point type 15 to show filling
       col=c("blue",adjustcolor("lightblue",alpha.f = 0.5),     #colors
             "red",adjustcolor("pink",alpha.f = 0.5),
             "darkgrey",adjustcolor("lightgrey",alpha.f = 0.5)))


plot(density(ship1dat$iNKT[ship1dat$Ship1=="+/+"]),type="l",col="blue",lwd=2,
     main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations
           by Ship1 Status",
     xlab="Frequencies of iNKT Cells", ylab="Frequency",   #x and y axes labels
     xlim=c(0,2), #set domain
     ylim=c(0,3)) #set range) #add kernel density estimate

lines(density(ship1dat$iNKT[ship1dat$Ship1=="+/-"]),col="red",lwd=2) #add kernel density estimate

lines(density(ship1dat$iNKT[ship1dat$Ship1=="-/-"]),col="darkgrey",lwd=2) #add kernel density estimate

legend("topright",legend=c("+/+","+/-","-/-"), #location and labels
       lty=rep(1,3), #lty 1 is a line, NA means not a line
       lwd=rep(2,3), # sets line width for lines
       col=c("blue","red","darkgrey"))



#####################################
# Graphical Summary -- boxplot 
#####################################

############
# Base
############
par(mfrow=c(1,1)) #Reset graphics environment
boxplot(ship1dat$iNKT,   #which data to plot
        #title of graph
        main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
        xlab="", ylab="Frequencies of iNKT Cells",   #x and y axes labels
        col="lightblue")    #box color
#add points
points(jitter(rep(1,length(ship1dat$iNKT)),amount = 0.2),ship1dat$iNKT)

#####################################
# Graphical Summary -- Boxplots by group
#####################################
############
# Base
############
par(mfrow=c(1,1))
boxplot(iNKT~Ship1, data=ship1dat, #frequencies of iNKT by Ship1 status
        #title of graph
        main="Frequencies of Invariant Natural Killer T (iNKT) Cell Populations",
        xlab="Frequencies of iNKT Cells", ylab="Frequency",   #x and y axes labels
        col="lightblue") #bar colors

