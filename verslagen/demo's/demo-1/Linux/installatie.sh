#!/bin/bash
# Automatiseren software-installatie

#Functions
print_header() {
    echo -e "\e[1;33m*************************************************"
    echo -e "$1"
    echo -e "*************************************************\e[0m"
}

# Bijwerken van de lijst met beschikbare applicaties
print_header "Bijwerken lijst beschikbare applicaties"
sudo apt -y update

# Algemene applicaties installeren
print_header "Algemene applicaties"
sudo apt -y install git

# Applicaties voor verschillende vakken
print_header "Software voor System Engineering Lab"
sudo apt -y install filezilla virtualbox
sudo snap install mysql-workbench-community

# Applicaties die niet beschikbaar zijn via apt maar via snap
print_header "Extra applicaties (via Snap)"
echo "Installeer Visual Studio Code en GitKraken via snap:"
sudo snap install --classic code
sudo snap install --classic gitkraken

# Optionele applicaties
print_header "Optionele applicaties"
read -p "Wil je de optionele applicaties installeren? (ja/nee): " choice
if [ "$choice" = "ja" ]; then
    sudo apt -y install htop # Voor systeemmonitoring
    sudo apt -y install neofetch # Voor het weergeven van systeeminformatie
    echo "Optionele applicaties zijn geïnstalleerd."
else
    echo "Optionele applicaties worden niet geïnstalleerd."
fi

read -p "Druk op Enter om af te sluiten"

