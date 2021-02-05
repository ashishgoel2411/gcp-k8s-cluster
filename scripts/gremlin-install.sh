# Create a demo user
UPATH=/home/${user_name}
useradd -m -p $(openssl passwd -crypt ${user_pass}) -s /bin/bash -G sudo ${user_name}

# Install Helm
sleep 30
sudo -H -u ${user_name} bash -c 'curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3'
sudo -H -u ${user_name} bash -c 'chmod 700 get_helm.sh'
sudo -H -u ${user_name} bash -c 'sh get_helm.sh'

# Add the Gremlin Helm Chart
sudo -H -u ${user_name} bash -c 'helm repo add gremlin https://helm.gremlin.com'

# Create a namespace for the Gremlin Kubernetes client
sudo -H -u ${user_name} bash -c 'kubectl create namespace gremlin'

# Install the Gremlin client on worker node
sudo -H -u ${user_name} bash -c 'helm install gremlin gremlin/gremlin --namespace gremlin --set gremlin.secret.managed=true --set gremlin.secret.type=secret --set gremlin.secret.teamID=${GREMLIN_TEAM_ID} --set gremlin.secret.teamSecret=${GREMLIN_TEAM_SECRET}'


