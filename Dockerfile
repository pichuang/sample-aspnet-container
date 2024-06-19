
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8.1-windowsservercore-ltsc2022
ARG source

WORKDIR /inetpub/wwwroot
# COPY ${source:-obj/Docker/publish} .
# COPY ${source:-Publish} .
WORKDIR /LogMonitor
COPY LogMonitor.exe  C:/LogMonitor
COPY LogMonitorConfig.json C:/LogMonitor

# https://emmer.dev/blog/docker-shell-vs.-exec-form/
# In general, use the shell form for RUN, and the exec form for everything else.

# C:\LogMonitor\LogMonitor.exe COMMAND Specifies the name of the executable to be run
# SHELL ["C:\\LogMonitor\\LogMonitor.exe", "powershell.exe"]
RUN C:\\LogMonitor\\LogMonitor.exe powershell.exe

ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]
