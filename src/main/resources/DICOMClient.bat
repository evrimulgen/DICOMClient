@echo off

echo Run in University of Michigan specific environment.

echo java -version | cmd 2>&1 | find "1.6.0" >nul 2>nul
if %errorlevel% EQU 0 GOTO javaok
echo java -version | cmd 2>&1 | find "1.7.0" >nul 2>nul
if %errorlevel% EQU 0 GOTO javaok

@rem Use java JVM that is available on the network
set JAVA_HOME=S:\Physics\Projects\jre6-32
set PATH=%JAVA_HOME%\bin;%PATH%
:javaok

set dirname=%~dp0
echo Starting DICOM+

java -cp %dirname%@@with-dep-jar@@ -Djava.util.logging.config.file=%dirname%logging.propertiesWindows edu.umro.dicom.client.DicomClient %*

