plot.new()
imgexp<-read.bitmap("figureextract.png")
rasterImage(imgexp, 0, 0, 1, 1)
## User need to use mouse-clicks to decide the positions of coordinates,
## and the points want to extract.
dfTAVR <- getpoints(imgexp,0,5,0,100)
dfTAVR2 <- dfTAVR
dfTAVR2$y <- 100-dfTAVR$y

dfCTRL <- getpoints(imgexp,0,5,0,100)
dfCTRL2 <- dfCTRL
dfCTRL2$y <- 100-dfCTRL$y
## the extracted dataset df can be used to estimate IPD by other functions in the package trisk
# Load time points when the patients number =======
# at risk reported (i.e. trisk in month) ======
trisk_cntrl<-c(0,1,2,3,4,5)
trisk_TAVR<-c(0,1,2,3,4,5)
nrisk_cntrl<-c(446,306,267,189,118,46)
nrisk_TAVR<-c(455,392,365,287,142,103)

# Use the trisk and nrisk as input for preprocess and reconstruction ============
pre_cnrtl <- preprocess(dat=dfCTRL2, trisk=trisk_cntrl, nrisk=nrisk_cntrl,
                        totalpts=NULL,maxy=100)
est_cntrl <- getIPD(prep=pre_cnrtl,armID=0,tot.events=NULL)

# Use the trisk and nrisk as input for preprocess and reconstruction ============
pre_TAVR <- preprocess(dat=dfTAVR2, trisk=trisk_TAVR, nrisk=nrisk_TAVR,
                       totalpts=NULL,maxy=100)
est_TAVR <- getIPD(prep=pre_TAVR,armID=0,tot.events=NULL)

# Plot
plot(est_cntrl)
plot(est_TAVR)