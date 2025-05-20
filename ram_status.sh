# RAM Monitoring Script

#!/bin/bash

source ~/.ram_threshold.conf
FREE_SPACE=$( free -mt | grep "Total" | awk '{print $4}' )
TH=500

if [[ $FREE_SPACE -lt $TH ]]
then
    echo "WARNING! RAM is running low." | mail -s "Regarding RAM Usage" anshit1223@gmail.com
else
    echo "RAM is Sufficient - $FREE_SPACE M"
fi
