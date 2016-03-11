# CiscoCSVToolkit
A collection of Ruby scripts for preparing exported CSV files from CUCM 7.x to import into CUCM 10.x and above

## Background
When migrating configurations between CUCM 7.x and CUCM 10.x and above, a typical task involves using the Bulk Administration system to export phones and configurations as CSV files. One of the issues with importing these CSV files directly into CUCM 10.x is that there are many headers in the 7.x CSV file format that aren't supported in CUCM 10.x and will cause a failed import. These files will help to clean up the exported CSV files as well as provide some basic filtering functionality to limit the import to certain users and phones (as the CSV files can be very large sometimes they can be difficult to work with in Excel). Before importing any files be sure that your new CUCM system has all referenced dependencies configured (device pools, partititions, etc) or the import will fail.


## Usage
From your 7.x Cisco Unified CM Administration page, navigate to Bulk Administration > Phones > Export Phones > All Details. Select "All Phone Types", add a name for your export, select "Run Immediately", and then click "Submit". Next go to Bulk Administration > Users > Export Users. Click "Find" to pull up all user accounts, and then click Next. Input a file name and select "All User Format" for the file format. Select "Run Immediately" and then click "Submit". Both of these export jobs can be viewed in Bulk Administration > Job Scheduler and, once completed, can be downloaded from Bulk Administration > Upload/Download Files. After downloading rename the files from .txt to .csv and place them in the CiscoCSVToolkit folder.

Replace the importfile variable in the stripbadcolumns.rb script to match your exported phone CSV file. Next run the script from a command line ("ruby stripbadcolumns.rb"). It may take a little while to run. This will save a file called "forimport.csv" that you can upload to your 10.x system and run using Bulk Administration > Phones > Insert Phones.

If necessary you can use the filterbydevicepool.rb script on your forimport.csv file to limit which phones you want to import by device pool. You can also use the filteruserbypartition.rb script to modify your exported user CSV file by the primary extension's partition.
