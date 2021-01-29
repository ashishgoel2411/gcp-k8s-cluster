# (Install Docker CE)
## Set up the repository:
### Install packages to allow apt to use a repository over HTTPS
apt-get update -y && sudo apt-get install -y \
apt-transport-https ca-certificates curl software-properties-common gnupg2 vim strace binutils psmisc lsof
# Add Docker's official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key --keyring /etc/apt/trusted.gpg.d/docker.gpg add -
# Add the Docker apt repository:
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
# Add key for Falco
curl -s https://falco.org/repo/falcosecurity-3672BA8F.asc | apt-key add -
echo "deb https://dl.bintray.com/falcosecurity/deb stable main" | tee -a /etc/apt/sources.list.d/falcosecurity.list

# Install Docker CE
apt-get update && sudo apt-get install -y \
linux-headers-$(uname -r) \
containerd.io=1.2.13-2 \
docker-ce=5:19.03.11~3-0~ubuntu-$(lsb_release -cs) \
docker-ce-cli=5:19.03.11~3-0~ubuntu-$(lsb_release -cs)
cat <<EOF | sudo tee /etc/docker/daemon.json
{
    "exec-opts": ["native.cgroupdriver=systemd"],
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "100m"
        },
    "storage-driver": "overlay2"
}
EOF
# Create /etc/systemd/system/docker.service.d
mkdir -p /etc/systemd/system/docker.service.d
# Restart Docker
systemctl daemon-reload
systemctl restart docker
systemctl enable docker
# Install kubelet kubeadm falco etcdctl and kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update -y
apt-get install -y kubelet=${version}-00 kubeadm=${version}-00 kubectl=${version}-00 etcd-client falco
apt-mark hold kubelet kubeadm kubectl
systemctl enable kubelet && systemctl start kubelet
# Start and enable falco
systemctl enable falco && systemctl start falco

# install trivy
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy

# Install kube-bench
curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.3.1/kube-bench_0.3.1_linux_amd64.deb -o kube-bench_0.3.1_linux_amd64.deb
sudo apt install ./kube-bench_0.3.1_linux_amd64.deb -f

#Service account
cat <<EOF | sudo tee /etc/demoaccount.json
{
    "type": "service_account",
    "project_id": "stoked-genius-302113",
    "private_key_id": "471d273f90a8371852bd02e3f2c75880fa981245",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDYO8LJfVBmYLv2\n4pFPk69r7P6FwRm3EcQ0mFeO6Z9MPlifmGXCrJymx7EwTJLycGppWstjTdUogsrF\nV+Y4ugqCOurSu3VIYOJTawhUnNt+Yx9IT9WJkqy7NFo3Pjcyoe1FxB1kmAjLEGmz\nPiwDOg2FmzlidSDSbKwX0hnK7Gell18XIgw8lC1HlWYz01yaf2FxTUaCF4hPouHG\n1NeIE3g2T/eeFFUoaO7RsB9H/gdP5IbyhNXklJVbq02wpOfFtoK2U95J8NoQGX9n\ni/HE7xJZgNcrrQ/X/yGEzfgPv/mEZCiQ0JX3zAOD/dAo9vDLU+e54nhxzKpeDZxe\nmQn18gtXAgMBAAECggEAZl4UXzM2RuFw2vZz+IpgN+XgsQ2z0NlWW9frS7sKMRwq\n9JM/SaRSHRrYpZb60k+p8OqM8xw714vj1v0//ocExpaB6PXaFkPXocpADV6dAv6G\nJsO0wgZwQ8gLFbAcjZnfLHIlwCPBtfC1OagrSfPHxwKvbg8pVLUh270ZfNniT5+1\nEMd1Kb25IA2rO9vLKhEseKHRi0aOUh+ybN5LhbyVcBGIJT+ObeKjManSS2IJFtCS\npvEBJpVxY4p+C7/SOcEojfAfv/m5fOFNt7Ta+L7gmp2D6tcess+7andY4mmTIf4H\n4HpHn9jRJvmh0zN968w56fF0pVXipskEC9qulPDBcQKBgQDwUjr7jSbLLPhOBabp\n0W1HL+D5X7+8ERLjgx79nShbdMkEYJUVIVxk37Hz4qDTqcMrkKD+40v7yGhe1IAH\n0KMMRVENGyRKATh1XkIR9VQ6LXgiPgmlcBvpav0gAkk0npjTthc1u+D7/DDWNsUk\nEtrlMu6P+mrFkgXVXFq30FqpfQKBgQDmVzlc0SJXFQ/0zajmc3yvt+g3LVUpKcT6\nP/Efzfj27WYTacqrEORdBgjldz/0r4oVuvBuK1wKMftAIbgCauhOfzKHHqXNo8GU\ntpMKMS8jrJX6e4Q2sC44XP2FYMv1K59SKQrt6/HBDQigIj0DEYjJ1ySAoJ4C/Zsi\nzcbS//SAYwKBgA29ddfaCyTErnGviwqFSc0vJJq9abXz9/OAFK6FZMBN3gxdBUkO\n/jxaOc9q3q0bYKhF/Z51GmwL2kPJvIQ13oyeDfNE4P9GMJctS3PBZg5peRvkFiMa\nVM40qsJAvzS9+JjqKUuOMV/W3Gfy+7SDS3adQdyDgcVIAwNe42TtCbH1AoGBAM3I\no1DO7nUKNiUpD3pDNuPt06Jn96s8y+Qe+BbH92LzmLxDSXMnNj39RDltHlBF+4GK\nb36dci8RlDwpY7GVPVHTxZp9wPdFE47+xcLXShv+9ka/ztDk+YYVXdGpNs4kWMQY\nMtF4d5VXRZt6uzNgmOpqMQxRcpmNZOnlGXosfY2tAoGBAMXqXPVPu+P3Sm/ZJXrG\nqh0ckTi9p0CBEsNTaSzxCtvQMSxhNzX17/0zpobXw/IDV3qTOUhDihRWRfl6A8lM\nugSFpF7KodYg2HYzAldsNBBc3LyFsiMJ9LX5o9L2IYOLTYpcqHz6jlu+8wH2qDl0\nqbSIDkDZO7UfPzLlw+1e5+oO\n-----END PRIVATE KEY-----\n",
    "client_email": "demoaccount@stoked-genius-302113.iam.gserviceaccount.com",
    "client_id": "111134476876590081663",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/demoaccount%40stoked-genius-302113.iam.gserviceaccount.com"
}
EOF