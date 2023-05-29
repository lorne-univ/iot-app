#!/bin/bash
#Script to instantiate influxdb - telegraf - grafana 
#Data are stored in folder iot-app
path=/home/etudiant
#path=$(pwd)
dest_folder=iot-app

function create_folder () {
#Bind volume for influxdb
mkdir -p ${path}/${dest_folder}/influx_data
mkdir -p ${path}/${dest_folder}/telegraf_data
mkdir -p ${path}/${dest_folder}/node_data
mkdir -p ${path}/${dest_folder}/grafana_data
}

function destroy_folder () {
	rm -rf ${path}/${dest_folder}/influx_data
  rm -rf ${path}/${dest_folder}/telegraf_data
  rm -rf ${path}/${dest_folder}/node_data
  rm -rf ${path}/${dest_folder}/grafana_data
}

printf "This script allows to create or destroy the folders\n"
printf "for Influxdb, NodeRed, Grafana and Telegraf Docker installation\n\n"


if [[ -z "${1}" ]] ; then
  printf "You must supply one argument :\n"
  printf "\t-create\n"
  printf "\t-destroy\n"
elif [[ "${1}" == "destroy" ]]; then
    destroy_folder
    printf "Removing folder: \n"
elif [[ "$1" == "create" ]]; then 
     create_folder
     printf "Creating folders : \n" 
     printf "\t-${path}/${dest_folder}/influx_data"    
else  
  printf "First argument is unknown. You must enter create or destroy"
fi


