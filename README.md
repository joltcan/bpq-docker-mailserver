# BPQ simple mailserver

To get started, insert NODEid, adminuser, adminpassword, mailuser and mailpassword in the config file bpq32.cfg and linmail.cfg.

Either copy the example configs and edit yourself, or run the example below after you changed your values.
*note*: don't use the same admin and mail password if the container is ever connected to internet.

```bash
NODEID=133700 # Your HAM ID or equal
MAILUSER=myuser
MAILPASSWORD=mailuserpw
ADMINPASSWORD=AdminPassChange
ADMINUSER=adminUser
sed "s/{{NODEID}}/${NODEID}/g" bpq32.cfg.example-mail > bpq32.cfg
sed -i "s/{{ADMINUSER}}/${ADMINUSER}/g" bpq32.cfg
sed -i "s/{{ADMINPASSWORD}}/${ADMINPASSWORD}/g" bpq32.cfg
sed "s/{{MAILPASSWORD}}/${MAILPASSWORD}/g" linmail.cfg.example > linmail.cfg
sed -i "s/{{MAILUSER}}/${MAILUSER}/g" linmail.cfg
sed -i "s/{{NODEID}}/${NODEID}/g" linmail.cfg
```

The above script only needs to be run the first time the container is started.

$MAILUSER and $NODEID is what you the email address will be, so if you don't change the above, the email address is
`myuser@133700`.

It is possible to add more users and do more advanced configuration by using the admin interface described under `Other ports`.

## Start up

### First time:

Build the image with `docker compose build`.

### Start

Start the container with `docker compose up` or `docker compose up -d` if you want it to run in the background.

## Send test email to the server

I use [sendemail](https://packages.debian.org/search?keywords=sendemail&searchon=names&suite=all&section=all)

```
sendemail -m "Sending an email to my user" -f "MyNameIs <f@example.com>" -u "Testing subject" -t "$MAILUSER@$NODEID" -s "<IP of docker host>:8025" -xu $MAILUSER -xp $MAILPASSWORD
Apr 27 11:42:41 wopr sendemail[97869]: Email was sent successfully!
```

## Email Setup

Connect your email client to SMTP on port 8025 and POP 8026 and the IP address of the computer you are running docker on.

## Other ports

There is also a webmail and admin interface on port 8012, and telnet interface on port 8010 and finally BPQTermTCP port on 8011.


