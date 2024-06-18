
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8.1-windowsservercore-ltsc2022
ARG source

WORKDIR /inetpub/wwwroot
# COPY ${source:-obj/Docker/publish} .
# COPY ${source:-Publish} .
WORKDIR /LogMonitor
COPY LogMonitor.exe  C:/LogMonitor
COPY LogMonitorConfig.json C:/LogMonitor

# Executed as cmd /S /C echo default
RUN echo 1-default

# Executed as cmd /S /C powershell -command Write-Host default
RUN powershell -command Write-Host 2-default

# Executed as powershell -command Write-Host hello
SHELL ["powershell", "-command"]
RUN Write-Host 3-hello

# Executed as cmd /S /C echo hello
SHELL ["cmd", "/S", "/C"]
RUN echo 4-hello

# C:\LogMonitor\LogMonitor.exe COMMAND Specifies the name of the executable to be run
SHELL ["C:\\LogMonitor\\LogMonitor.exe", "powershell.exe"]

ENTRYPOINT Start-Service WMSVC; & C:\\ServiceMonitor.exe w3svc;