#!/bin/bash

function waitforpid {
  while ps -p $1 1>/dev/null 2> /dev/null; do 
    sleep 1; 
  done
}

function waitforprocess {
  while ps -p $(pgrep $1) 1>/dev/null 2> /dev/null; do
    sleep 1; 
  done
}
