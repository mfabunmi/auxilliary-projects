#!/bin/bash
# Made by Fabunmi MOtunrayo
# Script to onboard new employees
# Started on 11/13/2020


empfile=$(</home/mean/onboardingscript/employeefile2.csv)


for i in $empfile
 do
 if awk -F: '{print $1}' /etc/passwd | grep -q $i
   then
    echo  user $i already exists
   else
    useradd -g developers -s /bin/bash -c "new account for  user" -m -d /home/$i $i
    mkdir  /home/$i/.ssh
    cp /home/authorized_keys /home/$i/.ssh/authorized_keys
    chmod 600 /home/$i/.ssh/authorized_keys
    chown -R $i:developers /home/$i/.ssh &> /dev/null
   fi
 done
