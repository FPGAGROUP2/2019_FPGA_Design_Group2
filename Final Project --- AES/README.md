# HW5
## Group 2
### 組員學號: E24056352、E24056904、E24051904
## cmd設定
* 1: 加法 (A+B)
* 2: 減法 (A-B)
* 3: 乘法 (A*B)
* 4: 轉置 (A<sup>T</sup>)
* 5: 行列式 (det(A))
## 結果
### Matrix A
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/MatrixA.JPG)
### Matrix B
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/MatrixB.JPG)
### 加法
結果有誤，請看討論<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/result%20for%20cmd%3D1.png)
### 減法
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/result%20for%20cmd%3D2.png)
### 乘法
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/result%20for%20cmd%3D3.png)
### 轉置
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/result%20for%20cmd%3D4.png)
### 行列式
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/result%20for%20cmd%3D5.png)
### 支援負數
#### Ex.1
將matrix B變為<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/negative_MatrixB.JPG)<br/>
<br/>
再做乘法，結果為<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/negative%20result%20for%20cmd%3D3.png)<br/>
#### Ex.2
將matrix A變為<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/negative_MatrixA.JPG)<br/>
<br/>
再取行列式值，結果為<br/>
![images](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab05/img/negative%20result%20for%20cmd%3D5.png)<br/>
## 討論
在本次作業的結果中，發現除了加法外，其他計算結果均正確，因計算結果皆由processor產生，controller(matrix_ctrl)只負責將答案寫回bram，在其他答案正確的情況下，很明顯不是controller的問題；為了檢測processor是否正確，特別寫testbench測試，發現功能正常，因此懷疑是Vivado或FGPA的錯誤。
<br/>
(測試檔和測試結果均在test資料夾中)
