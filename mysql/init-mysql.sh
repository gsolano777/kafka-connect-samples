#!/bin/bash

echo "||||||||| Installing Employees database...||||||||||"
cd test_db-master
mysql --user=root --password=123456 -t < employees.sql

