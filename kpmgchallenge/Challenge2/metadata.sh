#!/bin/bash


function print_metadata_metric() {
	metadata_path=$2
	echo -n $1": "
	RESPONSE=$(curl -fs http://169.254.169.254/latest/${metadata_path}/)
	if [ $? == 0 ]; then
		echo $RESPONSE
	else
		echo not available
	fi
}


#start processing command line arguments
while [ "$1" != "" ]; do
	case $1 in
	-a | --ami-id )                print_metadata_metric ami-id meta-data/ami-id
																 ;;
	-l | --ami-launch-index )      print_metadata_metric ami-launch-index meta-data/ami-launch-index
																 ;;
	-m | --ami-manifest-path )     print_metadata_metric ami-manifest-path meta-data/ami-manifest-path
																 ;;
	-n | --ancestor-ami-ids )      print_metadata_metric ancestor-ami-ids meta-data/ancestor-ami-ids
																 ;;
	-i | --instance-id )           print_metadata_metric instance-id meta-data/instance-id
																 ;;
	-t | --instance-type )         print_metadata_metric instance-type meta-data/instance-type
																 ;;
	-h | --local-hostname )        print_metadata_metric local-hostname meta-data/local-hostname
																 ;;
	-o | --local-ipv4 )            print_metadata_metric local-ipv4 meta-data/local-ipv4
																 ;;
	-k | --kernel-id )             print_metadata_metric kernel-id meta-data/kernel-id
																 ;;
	-z | --availability-zone )     print_metadata_metric placement meta-data/placement/availability-zone
																 ;;
	-c | --product-codes )         print_metadata_metric product-codes meta-data/product-codes
																 ;;
	-p | --public-hostname )       print_metadata_metric public-hostname meta-data/public-hostname
																 ;;
	-v | --public-ipv4 )           print_metadata_metric public-ipv4 meta-data/public-ipv4
																 ;;
	-r | --ramdisk-id )            print_metadata_metric ramdisk-id /meta-data/ramdisk-id
																 ;;
	-e | --reservation-id )        print_metadata_metric reservation-id /meta-data/reservation-id
																 ;;
	-s | --security-groups )       print_metadata_metric security-groups meta-data/security-groups
																 ;;
	-d | --user-data )             print_metadata_metric user-data user-data
																 ;;
    	--all | --metadata-details )   print_metadata_metric metadata_details dynamic/instance-identity/document                 ;;                                                                 
	-h | --help )                  print_help
								 exit
																 ;;
	* )                            print_help
								 exit 1
	esac
	shift
done
