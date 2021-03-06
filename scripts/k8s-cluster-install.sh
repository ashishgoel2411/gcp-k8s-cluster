
# Initialize k8s cluster with master
kubeadm init --kubernetes-version=${version} --pod-network-cidr ${pod_cidr} --service-cidr=${service_cidr} >> /var/log/kubeadm-init.log

# Deploy kube network
KUBECONFIG=/etc/kubernetes/admin.conf kubectl apply -f ${cni_provider}  >> /var/log/kubeadm-init.log

# Remove taint from master
KUBECONFIG=/etc/kubernetes/admin.conf kubectl taint nodes --all node-role.kubernetes.io/master-  >> /var/log/kubeadm-init.log

# Print cluster deployed
echo ======Cluster Deployed, now execute --as sudo-- join command \(listed above\) on worker node========= >> /var/log/kubeadm-init.log
sleep 10

# Generate the token
kubeadm token create --print-join-command >> /etc/token.sh

# Get the service account
echo ${SVC_ACCOUNT_KEY} | base64 -d > /etc/demoaccount.json

# Authentication
export GOOGLE_APPLICATION_CREDENTIALS=/etc/demoaccount.json
gcloud auth activate-service-account --key-file=/etc/demoaccount.json

# Copy the token file into google cloud bucket named "k8s-token-bucket"
gsutil cp /etc/token.sh gs://${token_bucket}/

# Create a demo user
UPATH=/home/${user_name}
useradd -m -p $(openssl passwd -crypt ${user_pass}) -s /bin/bash -G sudo ${user_name}

# Start using cluster
sudo -H -u ${user_name} bash -c 'mkdir -p $HOME/.kube'
cp -i /etc/kubernetes/admin.conf $UPATH/.kube/config
chown ${user_name}: $UPATH/.kube/config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service ssh restart
