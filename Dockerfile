#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8.1-windowsservercore-ltsc2022
ARG source

WORKDIR /inetpub/wwwroot
COPY ${source:-obj/Docker/publish} .
WORKDIR /LogMonitor
COPY LogMonitor.exe  C:/LogMonitor
COPY LogMonitorConfig.json C:/LogMonitor
SHELL ["C:\\LogMonitor\\LogMonitor.exe", "powershell.exe"]

ENTRYPOINT Start-Service WMSVC; & C:\\ServiceMonitor.exe w3svc;