# jitesoft/mono-nunit
Docker image for running nunit tests using mono.

[Image on Docker hub](https://hub.docker.com/r/jitesoft/mono-nunit/)  
[Repo on GitHub](https://github.com/Johannestegner/docker-mono-nunit)  

### How-to:

Add your source as a mounted volume to the `/app` dir. 
Specify solution to restore with the `RESTORE` env variable.  
Specify solution to build with the `BUILD` env variable.  
Specify test projects to run with the `TEST_PROJECTS` env variable, seperated with a `,`.  
  
Example run:  
```
docker run -v $(pwd):/app \
           -e RESTORE=test.sln \
           -e BUILD=test.sln \
           -e TEST_PROJECTS=test.csproj,test2.csproj \ 
           jitesoft/mono-nunit:latest
```
  
Don't worry! No files will be added or altered in the directory.
