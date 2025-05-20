# RAM Monitoring Script

#!/bin/bash

source ./.ram_threshold.conf
source ./.email_user.conf
FREE_SPACE=$( free -mt | grep "Total" | awk '{print $4}' )

if [[ $FREE_SPACE -lt THRESHOLD ]]
then
    echo "WARNING! RAM is running low." | mail -s "Regarding RAM Usage" Email
else
    echo "RAM is Sufficient - $FREE_SPACE M"
fi
