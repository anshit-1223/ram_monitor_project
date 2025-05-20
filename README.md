# RAM MONITORING
It's a Ram Monitoring Script which checks free ram and if it goes below defined threshold sends an email notification.


Here are the steps to set up and run the script on your system:

Step 1: Install postfix and s-nail(earlier mailx before RHEL 9)

Step 2: Setup postfix

   1. Navigate to /etc/postfix
      cd /etc/postfix

   2. Edit main.conf
   
      vim main.conf
      Go to line 337
      add relayhost=[smtp.gmail.com]:587
      Go to line 96
      add myhostname=yourhostname
      at the end 
      add the written below code

      ########################################
    #Location of sasl_passwd we saved
    smtp_sasl_password_maps= hash:/etc/postfix/sasl/sasl_passwd

    #Enables SASL Authentication for postfix
    smtp_sasl_auth_enable= yes
    smtp_tls_security_level= encrypt

    #Disallow methods that allow anonymous authentication
    smtp_sasl_security_options= noanonymous

      

Step 3: Create a directory sasl

Step 4: Create sasl_passwd file

        vim sasl_passwd
        [smtp.gmail.com]:587 your@email.com:your-password
        Esc :wq

Step 5: Now run

        postmap sasl_passwd

Step 6: Clone the repository and edit the hidden files

        cd ram_monitor_project
        .email_user.conf - provide the receiver's email
        .ram_threshold - set the threshold value

Step 7: Run the Shell file

        bash ram_status.sh

Step 8: Add this to Crontab to run script everyday.        
    