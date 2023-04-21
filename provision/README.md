# Requirements for VM to join AAD
- We need to also enable the Managed Identity (SystemAssigned) from IaC. That extension alone doesn't fully enable AAD login on the Azure VM, the MI is also required.
- https://1337.uk/articles/azure-devops-terraform-secure-vm-domain-join
