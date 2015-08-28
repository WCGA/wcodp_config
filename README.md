# WCODP Configuration Files
This repo is for tracking changes to static configuration files for the West Coast Ocean Data Portal server.  This can include ESRI geoportal configuration files, as well as solr configurations.   

The folder structure mimics the folder structure of the application, but only the files that have been customized or added for the WCODP are included. If additional files are modified, they and/or their folders can be added to the repository.

The master branch is for the configuration files production portal and the dev branch is for the development portal. 

Currently the workflow would be to store repo into any location on the server, (a home directory is fine), and when changes are made, manually copy the modified files into their correct location in the application directory(ies).
