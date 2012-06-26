#!/bin/bash

echo "For PTP Master"
make clean
make WRMODE=master
mv wrc.bin wrc_master.bin
scp wrc_master.bin bradomyn@140.181.86.116:~/project/

echo "For PTP Slave"
make clean
make WRMODE=slave
mv wrc.bin wrc_slave.bin
scp wrc_slave.bin bradomyn@140.181.86.116:~/project/
