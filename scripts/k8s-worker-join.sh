
# Wait for master to be ready
sleep 120

# Authentication
export GOOGLE_APPLICATION_CREDENTIALS=/etc/demoaccount.json
gcloud auth activate-service-account --key-file=/etc/demoaccount.json

# Executing the token file into bucket
gsutil cat gs://${bucket}/token.sh | sh