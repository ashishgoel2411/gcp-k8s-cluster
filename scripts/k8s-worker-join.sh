# Wait for k8s master to be ready
sleep 120

# Get the service account
echo ${SVC_ACCOUNT_KEY} | base64 -d > /etc/demoaccount.json

# Authentication
export GOOGLE_APPLICATION_CREDENTIALS=/etc/demoaccount.json
gcloud auth activate-service-account --key-file=/etc/demoaccount.json

# Join the worker node with master
gsutil cat gs://${token_bucket}/token.sh | sh