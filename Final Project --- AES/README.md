# Final Project --- AES

## Group 2
### 組員學號: E24056352、E24056904、E24051904


## AES步驟
* AddRoundKey
* SubBytes
* ShiftRows
* MixColumns


## 各步驟意義

### AddRoundKey
將當前資料與key XOR並產生新的key
<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/AddRoundKey.png)
### SubBytes
將每一個Byte經過一個switch box以得到新的值
<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/SubBytes.png)
### ShiftRows
將每一個row依上到下的順序，依序往左循環移位0, 1, 2, 3個Bytes
<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/ShiftRows.png)
### MixColumns
將每一個column都透過同一個4\*4的矩陣變換
<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/MixColumns.png)
<br/>
Forward MixColumns Matrix
<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/matrix_ForwardMixColumns.png)
<br/>
Inverse MixColumns Matrix
<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/matrix_InverseMixColumns.png)


## AES加密順序

### First Round
* AddRoundKey
### General Round (9 times)
* SubBytes
* ShiftRows
* MixColumns
* AddRoundKey
### Final Round
* SubBytes
* ShiftRows
* AddRoundKey
### AES解密
與加密的順序完全相反，且把每個步驟都換成反函數(如: *AddRoundKey* 變成 *AddRoundKey<sup>-1</sup>*)


## AES FSM/Architecture of encryption/decryption

### AES cipher
Finite State Machine
<br/>
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/AES_cipher_fsm.png)
<br/>
Architecture
<br/>
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/AES_cipher_arch.png)
### AES encryption
Finite State Machine
<br/>
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/AES_encryption_fsm.png)
<br/>
Architecture
<br/>
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/AES_encryption_arch.png)
### AES decryption
Finite State Machine
<br/>
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/AES_decryption_fsm.png)
<br/>
Architecture
<br/>
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Final%20Project%20---%20AES/image/AES_decryption_arch.png)

