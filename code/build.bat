@echo off

mkdir ..\..\build
pushd ..\..\build
cd
cl -Zi ..\handmade\code\win32_handmade.cpp user32.lib
popd

