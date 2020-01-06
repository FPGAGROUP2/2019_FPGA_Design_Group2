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
### SubBytes
將每一個Byte經過一個switch box以得到新的值
### ShiftRows
將每一個row依上到下的順序，依序往左循環移位0, 1, 2, 3個Bytes
### MixColumns
將每一個column都透過同一個4\*4的矩陣變換


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

