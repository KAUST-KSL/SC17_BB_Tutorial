
import numpy as np
import time
from astropy.io import fits

def printname(name):
    print name

## how many spectra to read? 
nspectra = 1000
totnspectra = 1000

### first, read the pmf file
pmf = np.zeros( (nspectra,3))
i = -1
for line in open("pmf1k"):
    if "plates" in line:
        continue
    cols = line.split()

    i+=1
    if i>nspectra:
        continue

    pmf[i][0] = int(cols[0])
    pmf[i][1] = int(cols[1])
    pmf[i][2] = int(cols[2])

print pmf.shape

## this goes plate/mjd/fiber. I want to pull out spectrum - so plate/mjd/fiber/coadd/...
spectra = []

### timeing: open file, extract spectra, put into the array
t1 = time.time()
for i in range(nspectra):

    datasetname = "spPlates/spPlate-"+str(pmf[i][0])[:-2]+"-"+str(pmf[i][1])[:-2]+".fits"
    try:
        hdu = fits.open(datasetname)

    except:
        ##print "******* dataset not found! **************", datasetname
        continue
    
    flux = hdu[0].data


    try:
        spectra.append(flux[int(pmf[i][2])])
    except:
        #print "  "
        print "failed to append spectra"
        print i, pmf[i][2], int(pmf[i][2]), flux.shape
        continue

t2 = time.time()
spectra = np.array(spectra)
print spectra.shape
print spectra[0]
print "time taken to load all the spectra into an array:", t2-t1, "sec"

