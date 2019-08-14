#!/bin/bash
CT="Content-Type:application/json"

curl -H $CT -d "@samples.employees.source.json" -X POST http://localhost:8083/connectors
curl -H $CT -d "@samples.employees.target.json" -X POST http://localhost:8083/connectors
