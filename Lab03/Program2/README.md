Program2
=========================

![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab03/img/hash_funtion%E6%B5%81%E7%A8%8B%E5%9C%96.PNG)

while迴圈的週期由delay決定，在讀取switch後，在GUI上顯示對應學號和雜湊值，為避免在GUI上不斷重複顯示相同資料，利用sw_status控制，在switch改變時，sw_status相對應改變，若在下次進入while迴圈時，switch未改變，即不會重複顯示同組switch的資料。
