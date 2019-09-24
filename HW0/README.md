Lab00
===============================
# Group2
組員學號：E24056352、E24056904、E24051904
===============================
模擬結果截圖
===============================
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/HW0/img/result.jpg)
===============================
波形截圖
===============================
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/HW0/img/waveform1.jpg)
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/HW0/img/waveform2.jpg)
===============================
FSM
===============================
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/HW0/img/FSM_LAB00.PNG)
===============================
設計說明
===============================
設定一個變動的點(x, y)，利用移動這個點來掃過所有在直角三角形中的點，因為在掃的過程中，起點一定是(x1, y1) ，且第二點與第三點就足以建構所有的邊界條件，所以在nt=1時，直接將值寫入(x, y)，不再特別儲存，然後再依序將第二點與第三點存入(x2, y2), (x3, y3)中，接著在S_FIND這個state中，每個cycle都讓(xo, yo)儲存(x, y)的值，再利用document中給的公式，判斷po的值，然後(x, y)由下而上、由左而右依序掃到(x3, y3)即完成動作。
