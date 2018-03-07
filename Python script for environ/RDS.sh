##!/bin/sh

set -x
LOG_FILE=/var/log/mediasociety-userdata.log
exec > >(tee -a ${LOG_FILE} )
exec 2> >(tee -a ${LOG_FILE} >&2)

#This script for Install Python and Django and Launch the Application on Server.

git clone https://github.com/Sachin-95/Python.git

#Clone the Project Repositry on Instance.

sudo apt-get update
#Update the Instance.


sudo apt-get -y  install python
#Install Python.


#Install mysql server.

sudo apt-get -y install libmysqlclient-dev

sudo pip3 install mysqlclient
#install Mysql client.


update-alternatives --remove python /usr/bin/python2
#Update Python version and remove the old version as default.

update-alternatives --install /usr/bin/python python /usr/bin/python3 1
#Update Python with new version and set default the latest python version.

sudo apt-get -y install python-pip
sudo apt-get -y install python3-pip
#Installing pip command on python.

sudo pip install --upgrade pip
#Upgrate pip with the new version.

sudo apt-get update



sudo pip3 install Django
#Install Django server to deploy the application.

sudo pip3 install mysqlclient



cd Python 

python3 manage.py makemigrations ors
#Create migrations on python application. 

python3 manage.py migrate
#Make Migreate the Application.

echo "from django.contrib.auth.models import User; User.objects.create_superuser('Ayushi', 'ayushi@gmail.com', 'mandsaur')" | python manage.py shell
#Create the super user admin for access the server Application.


source /opt/python-server/${ENVIRONMENT}.sh

python3 manage.py runserver 0.0.0.0:80 &
#Run the server on the Application.