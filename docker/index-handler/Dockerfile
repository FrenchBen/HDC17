# escape=`

FROM frenchben/msbuild:4.5.2 AS builder

WORKDIR C:\src\SignUp.MessageHandlers.IndexProspect
COPY src\SignUp\SignUp.MessageHandlers.IndexProspect\packages.config .
RUN nuget restore packages.config -PackagesDirectory ..\packages

COPY src\SignUp C:\src
RUN msbuild SignUp.MessageHandlers.IndexProspect.csproj /p:OutputPath=c:\out\index-prospect\IndexProspectHandler

# app image
## Windows Server 2016 Server Core base OS image for Windows containers
FROM microsoft/windowsservercore:10.0.14393.1593
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

WORKDIR /index-prospect-handler

ENV MESSAGE_QUEUE_URL="nats://message-queue:4222" `
    ELASTICSEARCH_URL="http://elasticsearch:9200"

COPY --from=builder C:\out\index-prospect\IndexProspectHandler .

CMD .\SignUp.MessageHandlers.IndexProspect.exe