#!/bin/bash
sfdx force:source:retrieve -p force-app/main/default -u DevHub
sfdx force:source:deploy:report -u DevHub
read -p "Press enter to continue"