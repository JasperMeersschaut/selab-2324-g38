#!/bin/bash
# Automatiseren software-installatie

# Bijwerken van de lijst met beschikbare applicaties
echo -e "\e[1;33m*************************************************"
echo -e "Bijwerken lijst beschikbare applicaties"
echo -e "*************************************************\e[0m"
sudo apt -y update

# Algemene applicaties installeren
echo -e "\e[1;33m*************************************************"
echo -e "Algemene applicaties"
echo -e "*************************************************\e[0m"
sudo apt -y install git

# Applicaties voor verschillende vakken
echo -e "\e[1;33m*************************************************"
echo -e "Software voor System Engineering Lab"
echo -e "*************************************************\e[0m"
sudo apt -y install filezilla virtualbox
sudo snap install mysql-workbench-community

# Applicaties die niet beschikbaar zijn via apt maar via snap
echo -e "\e[1;33m*************************************************"
echo -e "Extra applicaties (via Snap)"
echo -e "*************************************************\e[0m"
echo "Installeer Visual Studio Code en GitKraken via snap:"
sudo snap install --classic code
sudo snap install --classic gitkraken

# Optionele applicaties
echo -e "\e[1;33m*************************************************"
echo -e "Optionele applicaties"
echo -e "*************************************************\e[0m"
read -p "Wil je de optionele applicaties installeren? (ja/nee): " choice
if [ "$choice" = "ja" ]; then
    sudo apt -y install htop # Voor systeemmonitoring
    sudo apt -y install neofetch # Voor het weergeven van systeeminformatie
    echo "Optionele applicaties zijn geïnstalleerd."
else
    echo "Optionele applicaties worden niet geïnstalleerd."
fi

read -p "Druk op Enter om af te sluiten"

