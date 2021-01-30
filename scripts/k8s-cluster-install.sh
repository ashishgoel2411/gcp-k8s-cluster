
# Initialize cluster with master node
kubeadm init --kubernetes-version=${version} --pod-network-cidr ${pod_cidr} --service-cidr=${service_cidr} >> /var/log/kubeadm-init.log
# Deploy kube network
KUBECONFIG=/etc/kubernetes/admin.conf kubectl apply -f ${cni_provider}  >> /var/log/kubeadm-init.log
# Remove taint from master
KUBECONFIG=/etc/kubernetes/admin.conf kubectl taint nodes --all node-role.kubernetes.io/master-  >> /var/log/kubeadm-init.log
# Print finish
echo ======Cluster Deployed, now execute --as sudo-- join command \(listed above\) on worker node========= >> /var/log/kubeadm-init.log
sleep 10

# Generate the token
kubeadm token create --print-join-command >> /var/log/token.sh

# print service account
echo $SVC_ACCOUNT_KEY
echo "done 1"
sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/demoaccount.json'
echo "done 2"

# Authentication
export GOOGLE_APPLICATION_CREDENTIALS=/etc/demoaccount.json
gcloud auth activate-service-account --key-file=/etc/demoaccount.json

# Copy the token file into bucket
gsutil cp /var/log/token.sh gs://${bucket}/

# Create a demo user and start using cluster
UPATH=/home/${user_name}
useradd -m -p $(openssl passwd -crypt ${user_pass}) -s /bin/bash -G sudo ${user_name}

sudo -H -u ${user_name} bash -c 'mkdir -p $HOME/.kube'
cp -i /etc/kubernetes/admin.conf $UPATH/.kube/config
chown ${user_name}: $UPATH/.kube/config
