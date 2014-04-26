#/usr/bin/python

import sys
import os

for file in sys.argv:
  basename, extension = os.path.splitext(file)
  newfile = basename + ".png"
  os.system( "/usr/bin/convert" + " " + file + " " + newfile )


