#!/lustre/sw/xc40/python/2.7.11/sles11.3_gnu5.1.0/bin/python
import matplotlib
matplotlib.use('Agg')

import matplotlib.pyplot as plt
import netCDF4
import sys
nc = netCDF4.Dataset(str(sys.argv[1]))

# read all the data
topo = nc.variables['T2'][::1,::1]

# make image
plt.figure(figsize=(10,10))
plt.imshow(topo.squeeze(),origin='lower') 

#plt.title(nc.title)
output=str(sys.argv[1])+'.png'
plt.savefig(output, bbox_inches=0)
