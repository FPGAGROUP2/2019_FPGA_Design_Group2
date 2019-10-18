Program3
============================
#Insertion_sort flow chart
============================
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab03/img/insertion_sort.png)

#Quick_sort flow chart
============================
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab03/img/quick_sort.png)

#Quick_sort with Insertion_sort flow chart(本次實驗採用此排序法)
============================
![image](https://github.com/FPGAGROUP2/2019_FPGA_Design_Group2/blob/master/Lab03/img/quick_sort_with_insertion_sort.png)
#Time Complexity 
============================
# Insertion Sort
Best case:O(1)  <br />
Worst case:O(n^2)  <br />
Average case:O(n^2)  <br />
### Best case 是在幾乎已經排好的情況下，Insertion sort會有好處，而Worst case 是在排序反過來的情況下，會有O(n^2)的糟糕情況
# Quick sort
Best case:O(nlogn)<br />
## Worst case:O(n^2)
## Average case:O(nlogn)
## Quick sort 則是在Average case 會比較穩定

所以結合兩者，以Quick sort為基底，在排序數量比較低的情況下，再用Insertion sort解掉。

