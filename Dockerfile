# 1) Build the React frontend
FROM node:22-alpine AS client
WORKDIR /client
COPY client/package*.json ./
RUN npm ci
COPY client/ ./
RUN npm run build

# 2) Build and publish the ASP.NET API
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS server
WORKDIR /src
COPY server/ ./
RUN dotnet publish DragonGame.csproj -c Release -o /app

# 3) Small runtime image with the API and the built frontend
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=server /app ./
COPY --from=client /client/dist ./wwwroot
RUN mkdir -p App_Data
ENV ASPNETCORE_HTTP_PORTS=8080
EXPOSE 8080
ENTRYPOINT ["dotnet", "DragonGame.dll"]
