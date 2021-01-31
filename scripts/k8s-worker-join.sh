
# Wait for k8s master to be ready
sleep 120

# Authentication with service account
export GOOGLE_APPLICATION_CREDENTIALS=/etc/demoaccount.json
gcloud auth activate-service-account --key-file=/etc/demoaccount.json

# Join the worker node with master
gsutil cat gs://${bucket}/token.sh | sh