#! /bin/sh
 apt-get update && apt-get -y upgrade
cd /odoo/odoo-server
git pull
cd /odoo/custom/CybroOdoo/CybroAddons
git pull
cd /odoo/custom/CybroOdoo/OpenHRMS
git pull
cd /odoo/custom/oca/account-analytic && git config --global --add safe.directory /odoo/custom/oca/account-analytic && git pull
cd /odoo/custom/oca/account-budgeting && git config --global --add safe.directory /odoo/custom/oca/account-budgeting && git pull
cd /odoo/custom/oca/account-closing && git config --global --add safe.directory /odoo/custom/oca/account-closing && git pull
cd /odoo/custom/oca/account-consolidation && git config --global --add safe.directory /odoo/custom/oca/account-consolidation && git pull
cd /odoo/custom/oca/account-financial-reporting && git config --global --add safe.directory /odoo/custom/oca/account-financial-reporting && git pull
cd /odoo/custom/oca/account-financial-tools && git config --global --add safe.directory /odoo/custom/oca/account-financial-tools && git pull
cd /odoo/custom/oca/account-fiscal-rule && git config --global --add safe.directory /odoo/custom/oca/account-fiscal-rule && git pull
cd /odoo/custom/oca/account-invoice-reporting && git config --global --add safe.directory /odoo/custom/oca/account-invoice-reporting && git pull
cd /odoo/custom/oca/account-invoicing && git config --global --add safe.directory /odoo/custom/oca/account-invoicing && git pull
cd /odoo/custom/oca/account-payment && git config --global --add safe.directory /odoo/custom/oca/account-payment && git pull
cd /odoo/custom/oca/account-reconcile && git config --global --add safe.directory /odoo/custom/oca/account-reconcile && git pull
cd /odoo/custom/oca/bank-payment && git config --global --add safe.directory /odoo/custom/oca/bank-payment && git pull
cd /odoo/custom/oca/bank-statement-import && git config --global --add safe.directory /odoo/custom/oca/bank-statement-import && git pull
cd /odoo/custom/oca/brand && git config --global --add safe.directory /odoo/custom/oca/brand && git pull
cd /odoo/custom/oca/commission && git config --global --add safe.directory /odoo/custom/oca/commission && git pull
cd /odoo/custom/oca/community-data-files && git config --global --add safe.directory /odoo/custom/oca/community-data-files && git pull
cd /odoo/custom/oca/connector && git config --global --add safe.directory /odoo/custom/oca/connector && git pull
cd /odoo/custom/oca/connector-jira && git config --global --add safe.directory /odoo/custom/oca/connector-jira && git pull
cd /odoo/custom/oca/connector-telephony && git config --global --add safe.directory /odoo/custom/oca/connector-telephony && git pull
cd /odoo/custom/oca/contract && git config --global --add safe.directory /odoo/custom/oca/contract && git pull
cd /odoo/custom/oca/credit-control && git config --global --add safe.directory /odoo/custom/oca/credit-control && git pull
cd /odoo/custom/oca/crm && git config --global --add safe.directory /odoo/custom/oca/crm && git pull
cd /odoo/custom/oca/currency && git config --global --add safe.directory /odoo/custom/oca/currency && git pull
cd /odoo/custom/oca/data-protection && git config --global --add safe.directory /odoo/custom/oca/data-protection && git pull
cd /odoo/custom/oca/ddmrp && git config --global --add safe.directory /odoo/custom/oca/ddmrp && git pull
cd /odoo/custom/oca/delivery-carrier && git config --global --add safe.directory /odoo/custom/oca/delivery-carrier && git pull
cd /odoo/custom/oca/dms && git config --global --add safe.directory /odoo/custom/oca/dms && git pull
cd /odoo/custom/oca/e-commerce && git config --global --add safe.directory /odoo/custom/oca/e-commerce && git pull
cd /odoo/custom/oca/edi && git config --global --add safe.directory /odoo/custom/oca/edi && git pull
cd /odoo/custom/oca/event && git config --global --add safe.directory /odoo/custom/oca/event && git pull
cd /odoo/custom/oca/field-service && git config --global --add safe.directory /odoo/custom/oca/field-service && git pull
cd /odoo/custom/oca/geospatial && git config --global --add safe.directory /odoo/custom/oca/geospatial && git pull
cd /odoo/custom/oca/helpdesk && git config --global --add safe.directory /odoo/custom/oca/helpdesk && git pull
cd /odoo/custom/oca/hr && git config --global --add safe.directory /odoo/custom/oca/hr && git pull
cd /odoo/custom/oca/iot && git config --global --add safe.directory /odoo/custom/oca/iot && git pull
cd /odoo/custom/oca/knowledge && git config --global --add safe.directory /odoo/custom/oca/knowledge && git pull
cd /odoo/custom/oca/management-system && git config --global --add safe.directory /odoo/custom/oca/management-system && git pull
cd /odoo/custom/oca/manufacture && git config --global --add safe.directory /odoo/custom/oca/manufacture && git pull
cd /odoo/custom/oca/manufacture-reporting && git config --global --add safe.directory /odoo/custom/oca/manufacture-reporting && git pull
cd /odoo/custom/oca/margin-analysis && git config --global --add safe.directory /odoo/custom/oca/margin-analysis && git pull
cd /odoo/custom/oca/mis-builder && git config --global --add safe.directory /odoo/custom/oca/mis-builder && git pull
cd /odoo/custom/oca/multi-company && git config --global --add safe.directory /odoo/custom/oca/multi-company && git pull
cd /odoo/custom/oca/operating-unit && git config --global --add safe.directory /odoo/custom/oca/operating-unit && git pull
cd /odoo/custom/oca/partner-contact && git config --global --add safe.directory /odoo/custom/oca/partner-contact && git pull
cd /odoo/custom/oca/payroll && git config --global --add safe.directory /odoo/custom/oca/payroll && git pull
cd /odoo/custom/oca/pos && git config --global --add safe.directory /odoo/custom/oca/pos && git pull
cd /odoo/custom/oca/product-attribute && git config --global --add safe.directory /odoo/custom/oca/product-attribute && git pull
cd /odoo/custom/oca/product-kitting && git config --global --add safe.directory /odoo/custom/oca/product-kitting && git pull
cd /odoo/custom/oca/product-pack && git config --global --add safe.directory /odoo/custom/oca/product-pack && git pull
cd /odoo/custom/oca/product-variant && git config --global --add safe.directory /odoo/custom/oca/product-variant && git pull
cd /odoo/custom/oca/project && git config --global --add safe.directory /odoo/custom/oca/project && git pull
cd /odoo/custom/oca/project-reporting && git config --global --add safe.directory /odoo/custom/oca/project-reporting && git pull
cd /odoo/custom/oca/purchase-reporting && git config --global --add safe.directory /odoo/custom/oca/purchase-reporting && git pull
cd /odoo/custom/oca/purchase-workflow && git config --global --add safe.directory /odoo/custom/oca/purchase-workflow && git pull
cd /odoo/custom/oca/queue && git config --global --add safe.directory /odoo/custom/oca/queue && git pull
cd /odoo/custom/oca/reporting-engine && git config --global --add safe.directory /odoo/custom/oca/reporting-engine && git pull
cd /odoo/custom/oca/report-print-send && git config --global --add safe.directory /odoo/custom/oca/report-print-send && git pull
cd /odoo/custom/oca/rest-framework && git config --global --add safe.directory /odoo/custom/oca/rest-framework && git pull
cd /odoo/custom/oca/sale-financial && git config --global --add safe.directory /odoo/custom/oca/sale-financial && git pull
cd /odoo/custom/oca/sale-reporting && git config --global --add safe.directory /odoo/custom/oca/sale-reporting && git pull
cd /odoo/custom/oca/sale-workflow && git config --global --add safe.directory /odoo/custom/oca/sale-workflow && git pull
cd /odoo/custom/oca/search-engine && git config --global --add safe.directory /odoo/custom/oca/search-engine && git pull
cd /odoo/custom/oca/server-auth && git config --global --add safe.directory /odoo/custom/oca/server-auth && git pull
cd /odoo/custom/oca/server-backend && git config --global --add safe.directory /odoo/custom/oca/server-backend && git pull
cd /odoo/custom/oca/server-brand && git config --global --add safe.directory /odoo/custom/oca/server-brand && git pull
cd /odoo/custom/oca/server-env && git config --global --add safe.directory /odoo/custom/oca/server-env && git pull
cd /odoo/custom/oca/server-tools && git config --global --add safe.directory /odoo/custom/oca/server-tools && git pull
cd /odoo/custom/oca/server-ux && git config --global --add safe.directory /odoo/custom/oca/server-ux && git pull
cd /odoo/custom/oca/social && git config --global --add safe.directory /odoo/custom/oca/social && git pull
cd /odoo/custom/oca/stock-logistics-barcode && git config --global --add safe.directory /odoo/custom/oca/stock-logistics-barcode && git pull
cd /odoo/custom/oca/stock-logistics-reporting && git config --global --add safe.directory /odoo/custom/oca/stock-logistics-reporting && git pull
cd /odoo/custom/oca/stock-logistics-tracking && git config --global --add safe.directory /odoo/custom/oca/stock-logistics-tracking && git pull
cd /odoo/custom/oca/stock-logistics-transport && git config --global --add safe.directory /odoo/custom/oca/stock-logistics-transport && git pull
cd /odoo/custom/oca/stock-logistics-warehouse && git config --global --add safe.directory /odoo/custom/oca/stock-logistics-warehouse && git pull
cd /odoo/custom/oca/stock-logistics-workflow && git config --global --add safe.directory /odoo/custom/oca/stock-logistics-workflow && git pull
cd /odoo/custom/oca/storage && git config --global --add safe.directory /odoo/custom/oca/storage && git pull
cd /odoo/custom/oca/timesheet && git config --global --add safe.directory /odoo/custom/oca/timesheet && git pull
cd /odoo/custom/oca/vertical-community && git config --global --add safe.directory /odoo/custom/oca/vertical-community && git pull
cd /odoo/custom/oca/vertical-construction && git config --global --add safe.directory /odoo/custom/oca/vertical-construction && git pull
cd /odoo/custom/oca/vertical-edition && git config --global --add safe.directory /odoo/custom/oca/vertical-edition && git pull
cd /odoo/custom/oca/vertical-hotel && git config --global --add safe.directory /odoo/custom/oca/vertical-hotel && git pull
cd /odoo/custom/oca/vertical-isp && git config --global --add safe.directory /odoo/custom/oca/vertical-isp && git pull
cd /odoo/custom/oca/vertical-ngo && git config --global --add safe.directory /odoo/custom/oca/vertical-ngo && git pull
cd /odoo/custom/oca/vertical-travel && git config --global --add safe.directory /odoo/custom/oca/vertical-travel && git pull
cd /odoo/custom/oca/web && git config --global --add safe.directory /odoo/custom/oca/web && git pull
cd /odoo/custom/oca/webkit-tools && git config --global --add safe.directory /odoo/custom/oca/webkit-tools && git pull
cd /odoo/custom/oca/website && git config --global --add safe.directory /odoo/custom/oca/website && git pull
cd /odoo/custom/oca/wms && git config --global --add safe.directory /odoo/custom/oca/wms && git pull

reboot
