# 將IP Program 1 ~ Program 5組裝在一起後所得到的Block Diagram

IP introduction

Program1
依序輸入8個4bit(0至15)的數值後，將資料傳入PL端運算後，再由PS端抓取資料後顯示。

Program2
對有號數進行 +、-、* 功能的運算器
在PS端宣告有號數即可，因2補數在硬體上運算與無號數無異。

Program3
在PS端依序傳入格視為char(8bit)的資料，並透過以下迴圈函式運算。

hash=5381;

while(*ptr++){

hash = ((hash << 5) + hash) + c ; 

}

Program4
利用exclusive or(XOR)計算8個輸入在二進位表示法中，1的個數為奇數或偶數。

Program5
將前次作業的PWN led contriller的input改由PS端輸入。

# result

Program1

![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab04/img/Program1.PNG)

Program2

Program3

![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab04/img/Program3.PNG)

Program4

![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab04/img/Program4.PNG)

Program5

此題須從FPGA上才能顯示結果。
