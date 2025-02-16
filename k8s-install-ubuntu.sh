sudo hostnamectl set-hostname amd1
sudo vi /etc/hosts

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl status docker

##
# container
#
sudo sh -c "containerd config default > /etc/containerd/config.toml"
sudo vi /etc/containerd/config.toml

# SystemdCgroup = true
# sandbox_image = "registry.k8s.io/pause:3.10"
sudo systemctl restart containerd

# 获取最新版本号（例如 v0.3.9）
CRI_DOCKERD_VERSION=$(curl -s https://api.github.com/repos/Mirantis/cri-dockerd/releases/latest | grep 'tag_name' | cut -d '"' -f 4)

# 下载并解压
wget https://github.com/Mirantis/cri-dockerd/releases/download/${CRI_DOCKERD_VERSION}/cri-dockerd-${CRI_DOCKERD_VERSION#v}.amd64.tgz
tar xvf cri-dockerd-${CRI_DOCKERD_VERSION#v}.amd64.tgz

# 移动二进制文件到系统路径
sudo mv cri-dockerd/cri-dockerd /usr/local/bin/

# 下载服务文件
wget https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.service
wget https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.socket

# 移动服务文件到 systemd 目录
sudo mv cri-docker.service cri-docker.socket /etc/systemd/system/

# 修改服务文件中的 ExecStart 路径（确保与二进制路径一致）
sudo sed -i 's|/usr/bin/cri-dockerd|/usr/local/bin/cri-dockerd|g' /etc/systemd/system/cri-docker.service

# 重新加载 systemd 配置
sudo systemctl daemon-reload

sudo systemctl enable cri-docker.service cri-docker.socket
sudo systemctl start cri-docker.service

systemctl status cri-docker.service


sudo apt-get update
# apt-transport-https 可能是一个虚拟包（dummy package）；如果是的话，你可以跳过安装这个包
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
# 如果 `/etc/apt/keyrings` 目录不存在，则应在 curl 命令之前创建它，请阅读下面的注释。
# sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# 此操作会覆盖 /etc/apt/sources.list.d/kubernetes.list 中现存的所有配置。
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

sudo kubeadm init --cri-socket=unix:///var/run/cri-dockerd.sock --pod-network-cidr=192.168.0.0/16
sudo kubeadm init --pod-network-cidr=192.168.0.0/16

# 安装 k8s 后，会修改防火墙配置，导致防火墙失效，此时要重启 docker 解决
sudo systemctl restart docker

# 清理集群
sudo kubeadm reset --cri-socket=unix:///var/run/cri-dockerd.sock
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X

