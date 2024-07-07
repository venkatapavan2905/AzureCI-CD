# AzureCI-CD
Azure DevOps CI-CD Project with microservices

![image](https://github.com/venkatapavan2905/AzureCI-CD/assets/138016465/1e643c4a-cc6f-4876-9c2d-508e1907e4d1)


Five Microservices are:
1. Vote - Python
2. Result - NodeJs
3. Redis - Cache
4. Worker - .Net
5. DB - Postgres

Service Used in Azure DevOps and Azure:
1. Azure Repos
2. Azure Pipelines
3. Azure Virtual Machine
4. Azure Container Registry
5. Azure Kubernetes Services

Argo CD is a GitOps tool that is used to automate application deployment on Azure Kubernetes Services.

WorkFlow:

           
                   commits                   CI Pipeline                                Shell Script                 Update 
       Developer ------------> Azure Repos ---------------> Azure Container Registry ------------------>  ArgoCD  --------------> Azure Kubernetes Cluster
                     code                     Trigger                                     updation                    Cluster


a. Developer commits code to respective service from his local to remote repo i.e, to Azure Repo.

b. Individual CI-CD pipeline are configured for services.

c. Pipeline gets trigerred after a push to the repo.

d. Build starts running to containerize the application or service.

e. Containerized Image is pushed to the Azure Container Registry.

f. Shell Script in the 'Update' stage of the pipeline updates the deployment.yml file.

g. ArgoCD picks up the change in the repository of K8-Manifests and deploys the new updated pod in the cluster following the GitOps Approach.


Pipeline Stages:
1. Build - build the image from the Dockerfile.
2. Push - push the image to the container registry.
3. Update - update the deployment file manifests with updated image tag.


Since ACR is a private repository below secret is used to avoid the ImagePullBackoff errors during deployment. Personal Access Token is used in case of Azure Repos for ArgoCD to connect.

        kubectl create secret docker-registry <secret-name> --namespace <namespace> --docker-server=<registry_name> --docker-username= --docker-password=


-->Azure Virtual Machine is deployed and downloaded a agent on to the vm and execute ./run.sh file to keep it online.

--> Appropriate ports are opened in Virtual Machine Scale Sets (VMSS) where worker node of Kubernetes is deployed.

![Azure_CI Pipelines](https://github.com/venkatapavan2905/AzureCI-CD/assets/138016465/5747b318-23f0-4e53-963c-d89eb13fe625)


                                                  Azure Pipeline



![ArgoCD](https://github.com/venkatapavan2905/AzureCI-CD/assets/138016465/f4110b9b-fd4a-456e-87aa-5a5e3d3a0677)


                                                 Cluster in ArgoCD

  ![Cluster](https://github.com/venkatapavan2905/AzureCI-CD/assets/138016465/9a116fbf-5861-4140-9ceb-970a36284064)


                                                     CLI output

![Screenshot 2024-07-06 225817](https://github.com/venkatapavan2905/AzureCI-CD/assets/138016465/cd1abe65-bbb8-4a9f-ba85-557ef5789208)


                                                    Vote Pod


![Screenshot 2024-07-06 225742](https://github.com/venkatapavan2905/AzureCI-CD/assets/138016465/b3abd630-09b6-43f7-95cf-aef9876255bc)


                                                   Result Pod




