#! usr/bin/bash

find /home -type f -name "*" -exec du -h {} \; | sort -nrk1 | head -5 

