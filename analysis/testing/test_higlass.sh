# I installed HiGlass from the terminal
pip install higlass

# then I initiated an instance of HiGlass locally
higlass-manage start
# This created a directory in my home directory called ~/hg-data, to which I moved my test Hi-C data `out.10000.cool`

# I then loaded this out.10000.cool file into HiGlass, using:
higlass-manage ingest out.10000.cool

# and then visited the HiGlass server that my laptop is hosting by going to http://localhost:8989
# I tried to load the .cool file into the visualization tool in the HiGlass browser, but it took forever to load. I learned from looking at the
# documentation that the HiGlass browser takes the 'multiresolution' .mcool file type, and if you provide a .cool file it needs to do some processing
# on it to convert it into an .mcool file, hence the pause. I instead used the following command from cooler to convert my .cool file to an .mcool
cooler zoomify -o out.10000.mcool out.10000.cool

# I then repeated the previous command (`ingest`) for the .mcool file and loaded it, which yielded a heat map which we could easily zoom in and out on,
# albeit sparsely populated with contacts.

