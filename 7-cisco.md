| **Toestel** | **Interface** | **Subnetnr.** | **IPv4-adres** | **Subnetmask** | **IPv4-adres default gateway** |
| ----------- | ------------- | ------------- | -------------- | -------------- | ------------------------------ |
| PC1         | NIC           | 0             | 5.36.56.10     | 255.255.254.0  | 5.36.56.1                      |
| PC2         | NIC           | 0             | 5.36.56.11     | 255.255.254.0  | 5.36.56.1                      |
| PC3         | NIC           | 1             | 5.36.58.10     | 255.255.254.0  | 5.36.56.1                      |
| PC4         | NIC           | 1             | 5.36.58.11     | 255.255.254.0  | 5.36.56.1                      |
| SW1         | VLAN 1        | 0             | 5.36.56.254    | 255.255.254.   | 5.36.56.1                      |
| SW2         | VLAN 1        | 1             | 5.36.58.254    | 255.255.254.0  | 5.36.56.1                      |
| R1          | G0/0/0        | 0             | 5.36.56.1      | 255.255.254.0  | n.v.t.                         |
| R1          | G0/0/1        | 1             | 5.36.58.1      | 255.255.254.0  | n.v.t.                         |
