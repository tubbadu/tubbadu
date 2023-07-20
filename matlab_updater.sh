#! /usr/bin/bash
#/usr/local/MATLAB/R2021a/bin/glnxa64/update_installer
cd /usr/local/MATLAB
edition=$(ls)
echo "current edition: ${edition}"
cd ${edition}
cd bin/glnxa64/
sudo ./update_installer
