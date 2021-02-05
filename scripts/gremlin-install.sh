# Install Helm
sleep 30
curl -fsSL -o  $HOME/get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700  $HOME/get_helm.sh
$HOME/get_helm.sh

# Add the Gremlin Helm Chart
sudo -H -u ${user_name} bash -c 'helm repo add gremlin https://helm.gremlin.com'

# Create a namespace for the Gremlin Kubernetes client
sudo -H -u ${user_name} bash -c 'kubectl create namespace gremlin'

# Install the Gremlin client on worker node
sudo -H -u ${user_name} bash -c 'helm install gremlin gremlin/gremlin --namespace gremlin --set gremlin.secret.managed=true --set gremlin.secret.type=secret --set gremlin.secret.teamID=${GREMLIN_TEAM_ID} --set gremlin.secret.teamSecret=${GREMLIN_TEAM_SECRET}'


