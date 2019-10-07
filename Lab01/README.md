Lab01

Group2

組員學號：E24056352、E24056904、E24051904

設計說明

系統利用state和n_state來描述，在時脈為posedge clk的點上，令state<=n_state，而當state變動時，將state作為參數，控制n_state、LED和rgb LED的值。
因此在時序上不會重疊，導致電路無法實現。

Problem1

Lab01的blinky.xdc中，產生週期為8ns的clk訊號，將訊號頻率除以12500000後，變為clk_div訊號。

Problem2

如果沒有加入此檔案，FPGA上的clk將無法正常運作。
