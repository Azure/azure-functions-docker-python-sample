
# Disclaimer

The project is currently in progress. Please **DO NOT USE IN PRODUCTION** as we expect the feature and design patterns to develop and change over time. 

If you have any feedback or requests, please file an issue or add comments.


# Getting Started

## 1. Download and customize the sample

Clone the sample app repository to your local machine, then change to the directory that contains the sample code.
```bash
git clone https://github.com/Azure/azure-functions-docker-python-sample.git
cd azure-functions-docker-sample
```

## 2. Build the image from the Docker file
The `Dockerfile` describes the environment that is required to run the function app on Linux.

To build the Docker image, run the `docker build` command, and provide a name `mydockerimage`, and a tag `v1.0.0`. Replace `<docker-id>` with your Docker Hub account ID.
```bash
docker build . --tag <docker-id>/mydockerimage:v1.0.0
```

## 3. Run the app

Run the app, mapping your machine’s port 8080 to the container’s published port 80 using the -p flag.

```shell
docker run -p 8080:80 -it python-function-app
```

Go to the URL `http://localhost:8080` in a web browser to see the function app running. 


## 4. Publish to Docker Hub
Before you can push an image, you must sign in to Docker Hub using the `docker login` command. Replace `<docker-id>` with your account name and type in your password into the console at the prompt.
```bash
docker login --username <docker-id>
```
After you've signed in, push the image to Docker Hub by using the `docker push` command.
```bash
docker push <docker-id>/mydockerimage:v1.0.0
```
Now, you can use this image as the deployment source for a new function app in Azure.

## 5. Deploy to Azure
A function app hosts the execution of your functions. Create a function app from the Docker Hub image by using the `az functionapp create` command. 

Follow the instructione here:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-function-linux-custom-image#create-and-deploy-the-custom-image
 

# Docs 

To find more documentation

- Open `./docs/index.html` in your browser
- Navigate to [azure-functions-python-worker](https://github.com/Azure/azure-functions-python-worker)


# Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
