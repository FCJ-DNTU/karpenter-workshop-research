#!/bin/bash

C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_BLUE='\033[0;34m'
C_YELLOW='\033[1;33m'
C_ORANGE='\033[0;33m'
C_CYAN='\033[0;36m'
C_PURPLE='\033[0;35m'
C_LIGHT_GRAY='\033[0;37m'
C_DARK_GRAY='\033[1;30m'
C_LIGHT_RED='\033[1;31m'
C_LIGHT_GREEN='\033[1;32m'
C_LIGHT_BLUE='\033[1;34m'
C_LIGHT_PURPLE='\033[1;35m'
C_LIGHT_CYAN='\033[1;36m'

# println echos string
function println() {
  echo -e "$1"
}

# errorln echos i red color
function errorln() {
  println "${C_RED}${1}${C_RESET}"
}

# successln echos in green color
function successln() {
  println "${C_GREEN}${1}${C_RESET}"
}

# infoln echos in blue color
function infoln() {
  println "${C_BLUE}${1}${C_RESET}"
}

# warnln echos in yellow color
function warnln() {
  println "${C_YELLOW}${1}${C_RESET}"
}

# fatalln echos in red color and exits with fail status
function fatalln() {
  errorln "$1"
  exit 1
}

# Other colors
function orangeln() {
  println "${C_ORANGE}${1}${C_RESET}"
}

function cyanln() {
  println "${C_CYAN}${1}${C_RESET}"
}

function purpleln() {
  println "${C_PURPLE}${1}${C_RESET}"
}

function lightGrayln() {
  println "${C_LIGHT_GRAY}${1}${C_RESET}"
}

function darkGrayln() {
  println "${C_DARK_GRAY}${1}${C_RESET}"
}

function lightRedln() {
  println "${C_LIGHT_RED}${1}${C_RESET}"
}

function lightGreenln() {
  println "${C_LIGHT_GREEN}${1}${C_RESET}"
}

function lightBlueln() {
  println "${C_LIGHT_BLUE}${1}${C_RESET}"
}

function lightPurpleln() {
  println "${C_LIGHT_PURPLE}${1}${C_RESET}"
}

function lightCyanln() {
  println "${C_LIGHT_CYAN}${1}${C_RESET}"
}

export -f errorln
export -f successln
export -f infoln
export -f warnln
export -f orangeln
export -f cyanln
export -f purpleln
export -f lightGrayln
export -f darkGrayln
export -f lightRedln
export -f lightGreenln
export -f lightBlueln
export -f lightPurpleln
export -f lightCyanln