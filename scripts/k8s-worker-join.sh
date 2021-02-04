
# Wait for k8s master to be ready
sleep 120

# Get the service account
echo ${SVC_ACCOUNT_KEY} | base64 -d > /etc/demoaccount.json

# Authentication
export GOOGLE_APPLICATION_CREDENTIALS=/etc/demoaccount.json
gcloud auth activate-service-account --key-file=/etc/demoaccount.json

# Join the worker node with master
gsutil cat gs://${token_bucket}/token.sh | sh

# Create a demo user
UPATH=/home/${user_name}
useradd -m -p $(openssl passwd -crypt ${user_pass}) -s /bin/bash -G sudo ${user_name}

# Create a namespace for the Gremlin Kubernetes client
sudo -H -u ${user_name} bash -c 'kubectl create namespace gremlin'

# Install the Gremlin client on worker node
sudo -H -u ${user_name} bash -c 'helm install gremlin gremlin/gremlin --namespace gremlin --set gremlin.secret.managed=true --set gremlin.secret.type=secret --set gremlin.secret.teamID=${GREMLIN_TEAM_ID} --set gremlin.secret.teamSecret=${GREMLIN_TEAM_SECRET}'
