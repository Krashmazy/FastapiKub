# helm
if ! which helm > /dev/null; then
  echo -e "\n==============================================================================\n"
  echo "installing helm"
  echo -e "\n==============================================================================\n"
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  chmod 700 get_helm.sh
  ./get_helm.sh
else
  echo -e "\n==============================================================================\n"
  echo "helm already installed"
  echo -e "\n==============================================================================\n"
fi