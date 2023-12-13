#!/bin/bash
################################################################################
# Script for installing Odoo on Ubuntu 14.04, 15.04, 16.04 and 18.04 (could be used for other version too)
# Author: Yenthe Van Ginneken
#-------------------------------------------------------------------------------
# This script will install Odoo on your Ubuntu 16.04 server. It can install multiple Odoo instances
# in one Ubuntu because of the different xmlrpc_ports
#-------------------------------------------------------------------------------
# Make a new file:
# sudo nano odoo-install.sh
# Place this content in it and then make the file executable:
# sudo chmod +x odoo-install.sh
# Execute the script to install Odoo:
# ./odoo-install
################################################################################

OE_USER="odoo"
OE_HOME="/$OE_USER"
OE_HOME_EXT="/$OE_USER/${OE_USER}-server"
# The default port where this Odoo instance will run under (provided you use the command -c in the terminal)
# Set to true if you want to install it, false if you don't need it or have it already installed.
INSTALL_WKHTMLTOPDF="True"
# Set the default Odoo port (you still have to use -c /etc/odoo-server.conf for example to use this.)
OE_PORT="8069"
# Choose the Odoo version which you want to install. For example: 13.0, 12.0, 11.0 or saas-18. When using 'master' the master version will be installed.
# IMPORTANT! This script contains extra libraries that are specifically needed for Odoo 13.0
OE_VERSION="17.0"
# Set this to True if you want to install the Odoo enterprise version!
IS_ENTERPRISE="False"
# Set this to True if you want to install Nginx!
INSTALL_NGINX="False"
# Set the superadmin password - if GENERATE_RANDOM_PASSWORD is set to "True" we will automatically generate a random password, otherwise we use this one
OE_SUPERADMIN="admin"
# Set to "True" to generate a random password, "False" to use the variable in OE_SUPERADMIN
GENERATE_RANDOM_PASSWORD="False"
OE_CONFIG="${OE_USER}-server"
# Set the website name
WEBSITE_NAME="_"
# Set the default Odoo longpolling port (you still have to use -c /etc/odoo-server.conf for example to use this.)
LONGPOLLING_PORT="8072"
# Set to "True" to install certbot and have ssl enabled, "False" to use http
ENABLE_SSL="True"
# Provide Email to register ssl certificate
ADMIN_EMAIL="info@tadreb.live"

# Set Custom Modules
OCA="True"
SAAS="True"
CybroOdoo="True"
MuKIT="True"
SythilTech="True"
odoomates="True"
openeducat="True"
Openworx="True"
JayVoraSerpentCS="True"
##
###  WKHTMLTOPDF download links
## === Ubuntu Trusty x64 & x32 === (for other distributions please replace these two links,
## in order to have correct version of wkhtmltopdf installed, for a danger note refer to
## https://github.com/odoo/odoo/wiki/Wkhtmltopdf ):
## https://www.odoo.com/documentation/13.0/setup/install.html#debian-ubuntu


echo -e "* Create server config file"


sudo touch /etc/${OE_CONFIG}.conf
echo -e "* Creating server config file"
sudo su root -c "printf '[options] \n; This is the password that allows database operations:\n' >> /etc/${OE_CONFIG}.conf"
if [ $GENERATE_RANDOM_PASSWORD = "True" ]; then
    echo -e "* Generating random admin password"
    OE_SUPERADMIN=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
fi
sudo su root -c "printf 'admin_passwd = ${OE_SUPERADMIN}\n' >> /etc/${OE_CONFIG}.conf"
if [ $OE_VERSION > "11.0" ];then
    sudo su root -c "printf 'http_port = ${OE_PORT}\n' >> /etc/${OE_CONFIG}.conf"
else
    sudo su root -c "printf 'xmlrpc_port = ${OE_PORT}\n' >> /etc/${OE_CONFIG}.conf"
fi
sudo su root -c "printf 'logfile = /var/log/${OE_USER}/${OE_CONFIG}.log\n' >> /etc/${OE_CONFIG}.conf"

if [ $IS_ENTERPRISE = "True" ]; then
    sudo su root -c "printf 'addons_path=${OE_HOME}/enterprise/addons,${OE_HOME_EXT}/addons\n' >> /etc/${OE_CONFIG}.conf"
else
    sudo su root -c "printf 'addons_path=${OE_HOME_EXT}/addons,${OE_HOME}/custom/addons\n' >> /etc/${OE_CONFIG}.conf"
fi
sudo chown $OE_USER:$OE_USER /etc/${OE_CONFIG}.conf
sudo chmod 640 /etc/${OE_CONFIG}.conf



#--------------------------------------------------
# Adding ODOO as a Modules (initscript)
#--------------------------------------------------
echo -e "install odoo Modules"
cd  $OE_HOME/custom
if [ $OCA = "True" ]; then
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-analytic.git oca/account-analytic")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-budgeting.git oca/account-budgeting")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-closing.git oca/account-closing")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-consolidation.git oca/account-consolidation")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-financial-reporting.git oca/account-financial-reporting")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-financial-tools.git oca/account-financial-tools")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-fiscal-rule.git oca/account-fiscal-rule")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-invoice-reporting.git oca/account-invoice-reporting")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-invoicing.git oca/account-invoicing")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-payment.git oca/account-payment")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/account-reconcile.git oca/account-reconcile")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/bank-payment.git oca/bank-payment")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/bank-statement-import.git oca/bank-statement-import")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/commission.git oca/commission")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/community-data-files.git oca/community-data-files")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/connector.git oca/connector")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/connector-telephony.git oca/connector-telephony")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/contract.git oca/contract")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/credit-control.git oca/credit-control")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/crm.git oca/crm")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/currency.git oca/currency")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/data-protection.git oca/data-protection")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/ddmrp.git oca/ddmrp")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/delivery-carrier.git oca/delivery-carrier")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/e-commerce.git oca/e-commerce")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/edi.git oca/edi")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/event.git oca/event")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/field-service.git oca/field-service")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/geospatial.git oca/geospatial")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/hr.git oca/hr")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/timesheet.git oca/timesheet")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/iot.git oca/iot")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/knowledge.git oca/knowledge")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/management-system.git oca/management-system")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/manufacture.git oca/manufacture")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/manufacture-reporting.git oca/manufacture-reporting")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/margin-analysis.git oca/margin-analysis")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/mis-builder.git oca/mis-builder")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/multi-company.git oca/multi-company")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/operating-unit.git oca/operating-unit")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/partner-contact.git oca/partner-contact")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/pos.git oca/pos")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/product-attribute.git oca/product-attribute")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/product-kitting.git oca/product-kitting")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/product-variant.git oca/product-variant")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/project.git oca/project")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/project-reporting.git oca/project-reporting")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/purchase-reporting.git oca/purchase-reporting")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/purchase-workflow.git oca/purchase-workflow")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/queue.git oca/queue")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/reporting-engine.git oca/reporting-engine")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/report-print-send.git oca/report-print-send")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/sale-financial.git oca/sale-financial")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/sale-reporting.git oca/sale-reporting")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/sale-workflow.git oca/sale-workflow")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/server-auth.git oca/server-auth")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/server-backend.git oca/server-backend")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/server-brand.git oca/server-brand")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/server-env.git oca/server-env")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/server-tools.git oca/server-tools")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/server-ux.git oca/server-ux")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/social.git oca/social")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/stock-logistics-barcode.git oca/stock-logistics-barcode")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/stock-logistics-reporting.git oca/stock-logistics-reporting")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/stock-logistics-tracking.git oca/stock-logistics-tracking")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/stock-logistics-transport.git oca/stock-logistics-transport")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/stock-logistics-warehouse.git oca/stock-logistics-warehouse")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/stock-logistics-workflow.git oca/stock-logistics-workflow")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/vertical-community.git oca/vertical-community")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/vertical-construction.git oca/vertical-construction")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/vertical-edition.git oca/vertical-edition")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/vertical-hotel.git oca/vertical-hotel")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/vertical-isp.git oca/vertical-isp")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/vertical-ngo.git oca/vertical-ngo")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/vertical-travel.git oca/vertical-travel")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/web.git oca/web")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/webkit-tools.git oca/webkit-tools")
  REPOS=( "${REPOS[@]}" "https://github.com/oca/website.git oca/website")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/storage.git oca/storage")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/brand.git oca/brand")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/rest-framework.git oca/rest-framework")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/connector-jira.git oca/connector-jira")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/search-engine.git oca/search-engine")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/helpdesk.git oca/helpdesk")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/product-pack.git oca/product-pack")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/payroll.git oca/payroll")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/wms.git oca/wms")
  REPOS=( "${REPOS[@]}" "https://github.com/OCA/dms.git oca/dms")


fi
if [ $SAAS = "True" ]; then
  REPOS=( "${REPOS[@]}" "https://github.com/it-projects-llc/e-commerce.git it-projects-llc/e-commerce")
  REPOS=( "${REPOS[@]}" "https://github.com/it-projects-llc/pos-addons.git it-projects-llc/pos-addons")
  REPOS=( "${REPOS[@]}" "https://github.com/it-projects-llc/access-addons.git it-projects-llc/access-addons")
  REPOS=( "${REPOS[@]}" "https://github.com/it-projects-llc/website-addons.git it-projects-llc/website-addons")
  REPOS=( "${REPOS[@]}" "https://github.com/it-projects-llc/misc-addons.git it-projects-llc/misc-addons")
  REPOS=( "${REPOS[@]}" "https://github.com/it-projects-llc/mail-addons.git it-projects-llc/mail-addons")
  REPOS=( "${REPOS[@]}" "https://github.com/it-projects-llc/odoo-saas-tools.git it-projects-llc/odoo-saas-tools")
  REPOS=( "${REPOS[@]}" "https://github.com/it-projects-llc/odoo-telegram.git it-projects-llc/odoo-telegram")
fi
if [ $CybroOdoo = "True" ]; then
  REPOS=( "${REPOS[@]}" "https://github.com/CybroOdoo/CybroAddons.git CybroOdoo/CybroAddons")
  REPOS=( "${REPOS[@]}" "https://github.com/CybroOdoo/OpenHRMS.git CybroOdoo/OpenHRMS")
fi
if [ $MuKIT = "True" ]; then
  REPOS=( "${REPOS[@]}" "https://github.com/muk-it/muk_base.git mukit/muk_base")
  REPOS=( "${REPOS[@]}" "https://github.com/muk-it/muk_web.git mukit/muk_web")
  REPOS=( "${REPOS[@]}" "https://github.com/muk-it/muk_bundles.git mukit/muk_bundles")
  REPOS=( "${REPOS[@]}" "https://github.com/muk-it/muk_website.git mukit/muk_website")
  REPOS=( "${REPOS[@]}" "https://github.com/muk-it/muk_misc.git mukit/muk_misc")
  REPOS=( "${REPOS[@]}" "https://github.com/muk-it/muk_dms.git mukit/muk_dms")
  REPOS=( "${REPOS[@]}" "https://github.com/muk-it/muk_docs.git mukit/muk_docs")
  REPOS=( "${REPOS[@]}" "https://github.com/muk-it/muk_quality.git mukit/muk_quality")
fi
if [ $SythilTech = "True" ]; then
  REPOS=( "${REPOS[@]}" "https://github.com/SythilTech/Odoo.git SythilTech/Odoo")
fi
if [ $odoomates = "True" ]; then
  REPOS=( "${REPOS[@]}" "https://github.com/odoomates/odooapps.git odoomates/odooapps")
fi
if [ $openeducat = "True" ]; then
  REPOS=( "${REPOS[@]}" "https://github.com/openeducat/openeducat_erp.git openeducat/openeducat_erp")
fi
if [ $JayVoraSerpentCS = "True" ]; then
  REPOS=( "${REPOS[@]}" "https://github.com/JayVora-SerpentCS/OdooHotelManagementSystem.git JayVora-SerpentCS/OdooHotelManagementSystem")
  REPOS=( "${REPOS[@]}" "https://github.com/JayVora-SerpentCS/SerpentCS_Contributions.git JayVora-SerpentCS/SerpentCS_Contributions")
  REPOS=( "${REPOS[@]}" "https://github.com/JayVora-SerpentCS/Jasperreports_odoo.git JayVora-SerpentCS/Jasperreports_odoo")
  REPOS=( "${REPOS[@]}" "https://github.com/JayVora-SerpentCS/MassEditing.git JayVora-SerpentCS/MassEditing")
  REPOS=( "${REPOS[@]}" "https://github.com/JayVora-SerpentCS/fleet_management.git JayVora-SerpentCS/fleet_management")
  REPOS=( "${REPOS[@]}" "https://github.com/JayVora-SerpentCS/DOST.git JayVora-SerpentCS/DOST")
  REPOS=( "${REPOS[@]}" "https://github.com/JayVora-SerpentCS/Community_Portal.git JayVora-SerpentCS/Community_Portal")

fi
if [ $Openworx = "True" ]; then
  REPOS=( "${REPOS[@]}" "https://github.com/Openworx/odoo-addons.git Openworx/odoo-addons")
  REPOS=( "${REPOS[@]}" "https://github.com/Openworx/backend_theme.git Openworx/backend_theme")
fi
 if [[ "${REPOS}" != "" ]]
 then
     apt-get install -y git
 fi

 for r in "${REPOS[@]}"
 do
     eval "git clone --depth=1 -b ${OE_VERSION} $r" || echo "Cannot clone: git clone -b ${OE_VERSION} $r"
 done

 if [[ "${REPOS}" != "" ]]
 then
     chown -R ${OE_USER}:${OE_USER} $OE_HOME/custom || true
 fi
      ADDONS_PATH=`ls -d1 /odoo/custom/*/* | tr '\n' ','`
      ADDONS_PATH=`echo /odoo/odoo-server/addons,/odoo/custom/addons,$ADDONS_PATH | sed "s,//,/,g" | sed "s,/,\\\\\/,g" | sed "s,.$,,g" `
     sed -ibak "s/addons_path.*/addons_path = $ADDONS_PATH/" /etc/odoo-server.conf

echo -e "install odoo requirements"
 sudo pip3 install wheel
 #sudo apt install libldap2-dev libsasl2-dev
 #sudo pip3 install pyldap
 #sudo pip3 install -r /$OE_USER/$OE_CONFIG/requirements.txt
 #sudo pip3 install configparser
 #sudo pip3 install future
 #pip3 install num2words
 #pip3 install PyXB
 #pip3 install mysql-connector-python
 #pip3 install -r oca/account-analytic/requirements.txt
 #pip3 install -r oca/account-budgeting/requirements.txt
 


