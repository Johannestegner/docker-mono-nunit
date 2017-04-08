# docker-mono-nunit
Docker image for running nunit tests using mono.

Add your source as a mounted volume to the `/app` dir.  
Specify soltuions to build with the `SOLUTIONS` env variable, seperated with a `,`.  
Specify test projects to run with the `TEST_PROJECTS` env variable, seperated with a `,`.  
  
Example run:  
```
docker run -v $(pwd):/app \
           -e SOLUTIONS=test.sln,test2.sln \
           -e TEST_PROJECTS=test.csproj,test2.csproj \ 
           jitesoft/mono-nunit:latest
```


Don't worry! No files will be added or altered in the directory.
