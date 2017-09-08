# escape=`

FROM frenchben/msbuild:4.5.2 AS builder

WORKDIR C:\src\SignUp.EndToEndTests
COPY src\SignUp\SignUp.EndToEndTests\packages.config .
RUN nuget restore packages.config -PackagesDirectory ..\packages

COPY src\SignUp C:\src
RUN msbuild SignUp.EndToEndTests.csproj /p:OutputPath=C:\out\tests\EndToEndTests

# test runner
FROM frenchben/nunit:3.6.1
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Set-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord

WORKDIR /e2e-tests

COPY --from=builder C:\out\tests\EndToEndTests .

CMD nunit3-console SignUp.EndToEndTests.dll