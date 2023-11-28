#!/bin/bash

HOST=$( cat ~/.rdphosts | dmenu -i -p "Please Select or Add Host")

if grep -R "$HOST" ~/.rdphosts
then
	HOST=$HOST
	     else
 echo $HOST >> ~/.rdphosts
	    fi

 caller="$(ps -o comm= -p $(ps -o ppid= -p $$))"
 prompt="${1:-[$caller]}"
 hidden=white

 USER=$(cat ~/.rdpuser_history | dmenu -i -p "Please Select or add an User")
 pass=$(dmenu -p "Password:"  \
	 -nf "$hidden" -nb "$hidden"  <&-)


if grep -R "$USER" ~/.rdpuser_history
then
	USER=$USER
	     else
 echo $USER >> ~/.rdpuser_history
	    fi
HOME="/home/$(whoami)"
xfreerdp +clipboard /u:$USER /v:$HOST /p:$pass  /drive:home,$HOME /f /floatbar:sticky:on,default:visible,show:fullscreen /cert-ignore &
