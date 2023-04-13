#!/bin/bash

spawn-fcgi -p 8080 ./home/hello
nginx -g 'daemon off;'
