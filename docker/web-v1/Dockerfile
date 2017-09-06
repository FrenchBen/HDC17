# escape=`
FROM microsoft/aspnet:windowsservercore-10.0.14393.1593
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# disable DNS cache so container addresses always fetched from Docker
RUN Set-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord

COPY SignUp-1.0.msi /
COPY bootstrap.ps1 /
COPY setup.ps1 /

RUN Start-Process msiexec.exe -ArgumentList '/i', 'C:\SignUp-1.0.msi', '/quiet', '/norestart' -NoNewWindow -Wait
RUN powershell.exe -executionpolicy bypass 'C:\setup.ps1'

EXPOSE 80

ENTRYPOINT ["powershell", "./bootstrap.ps1"]
