FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY /bin/Debug/net5.0 .
ENTRYPOINT ["dotnet", "angulardotnet.dll"]



