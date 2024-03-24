# setting permissions on existing k3s if any
echo -e "\n==============================================================================\n"
echo "setting permissions on existing k3s if any"
echo -e "\n==============================================================================\n"
sudo chmod 644 /etc/rancher/k3s/k3s.yaml

# cleaning previous installations
echo -e "\n==============================================================================\n"
echo "cleaning previous installations"
echo -e "\n==============================================================================\n"
sudo rm -rf /mnt/data*

# script in order to clear all k3s installation
if [ -f /usr/local/bin/k3s-uninstall.sh ]; then
  echo -e "\n==============================================================================\n"
  echo "found an existing version of k3s, removing it"
  echo -e "\n==============================================================================\n"
  /usr/local/bin/k3s-uninstall.sh
fi

echo -e "\n==============================================================================\n"
echo "installing k3s"
echo -e "\n==============================================================================\n"
curl -sfL https://get.k3s.io | K3S_TOKEN=SECRET sh -s - server --cluster-init
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
mkdir -p $HOME/.kube
sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config