# Parking system infrastructure
Run the app (https://github.com/mrkhlo/parking-system-app) on local k8s cluster.

**Prerequisites:**
- Maven
- Docker
- Kubernetes (e.g., Docker Desktop, Minikube)
- Helm
- App microservice docker images are generated from the main app
    ```bash
    git clone https://github.com/mrkhlo/parking-system-app
    mvn clean install
    ```  

**Setup steps:**
1. **Clone the repo**
     ```bash
    git clone https://github.com/mrkhlo/parking-system-infrastructure
    ```    

2. **Deploy the local Kafka cluster with Zookeeper and Schema Registry:**

    ```bash
    helm install kafka helm/cp-helm-charts --version 0.6.0
    ```

    Wait for all the pods to start successfully.

3. **Deploy Kafka Client Pod:**

    ```bash
    kubectl apply -f kafka-client.yml
    ```

    Wait for the pod to start successfully.

4. **Enter Kafka Client Pod and Initialize Topics:**

    ```bash
    kubectl cp ./create-ps-topics.sh default/kafka-client:/home/appuser
    kubectl exec -it kafka-client /bin/bash
    sh create-ps-topics.sh kafka-cp-zookeeper-headless
    ```

5. **Deploy Postgres Database:**

    ```bash
    kubectl apply -f postgres-deployment.yml
    ```

6. **Deploy Parking System Application:**

    ```bash
    kubectl apply -f application-deployment-local.yml
  
