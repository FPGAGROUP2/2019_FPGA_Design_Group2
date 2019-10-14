Lab02
===============================
# Program2
# Group2

設計說明（方塊圖輔助說明）
===============================
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab02/img/block_diagram.png)
如上圖所示，clk會經由一個除頻器餵給PWM，這是控制亮甚麼顏色的訊號，有七個state來循環，
而clk，又會直接餵給RGB_LED，這是要〝騙〞眼睛的，所以clk快一些。
可以想成PWM是控制部分，而RGB_LED是讓燈亮的功能。
我們的顏色是有再調過的，所以RGB值是實驗出來的，Bonus也是和此相同RGB值。
路徑
===============================
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab02/img/Path_and_blockdiagram.png)
