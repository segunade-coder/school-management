@echo off

title Paymof

c:\xampp\xampp_stop.exe 

cls 

c:\xampp\xampp_start.exe 

cls

chdir c:\%HOMEPATH%\desktop\paymof

node app

