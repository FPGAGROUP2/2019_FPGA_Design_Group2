/*It's owned by Jia-Jun Hu.E24056352*/
/*Quick_Sort_sup_ver.*/
#include <iostream>
#include <fstream> 
using namespace std;
void swap(int *a, int *b)//triangular change
{
    int change = *a;
    *a = *b;
    *b = change;
}
void Insertion_Sort(int *arr, int size)
{
    for (int i = 1; i < size; i++) 
	{
        int key = arr[i];//store the key
        int j = i - 1;
        while (key < arr[j] && j >= 0)//compare the keys, until find equal or smaller
		{
            arr[j+1] = arr[j];
            j--;
        }
        arr[j+1] = key;//insert the key into the right position
    }
}

int Partition(int *arr, int start, int end)//It's the most difficult part in this code.
{
    int pivot = arr[end];
    int the_most_right_of_left_parts = start -1;
    for (int the_most_left_of_right_parts = start; the_most_left_of_right_parts < end; the_most_left_of_right_parts++) 
	{
        if (arr[the_most_left_of_right_parts] < pivot) 
		{
            the_most_right_of_left_parts++;
            swap(&arr[the_most_right_of_left_parts], &arr[the_most_left_of_right_parts]);
        }
    }
    the_most_right_of_left_parts++;//the_most_right_of_left_parts changes into the partition's position
    swap(&arr[the_most_right_of_left_parts], &arr[end]);//partition's left are smaller, and right are larger.  
    return the_most_right_of_left_parts;//return the partition's position in order to tell the recursion how to partition.
}

void Quick_Sort(int *arr, int start, int end)
{
    if (start < end&&(end-start)>20) //when start==end it'll stop, and the number '20' is changeable when the input number is changing.
	{
        int pivot = Partition(arr, start, end);//find the pivot and don't move it anymore.
        Quick_Sort(arr, start, pivot - 1);
        Quick_Sort(arr, pivot + 1, end);
    }
    else if(start < end)
    {
    	//	int temp_insertion[end-start+1];
    	//	for(int j=start;j<=end;j++)
    	//	temp_insertion[j]=arr[j];
    		
    	Insertion_Sort(arr, end-start+1);
    	
    	//	for(int j=start;j<=end;j++)
    	//	arr[j]=temp_insertion[j];
	}
}

int main() 
{

	int number_of_keys = 20 ;//set the number of keys an integer.
	int count_number_of_keys = 0;
	
	/*		read in		*/
	int input[number_of_keys];//set the unsorted array in the input file as input[].
	while(count_number_of_keys<20)
	{
		int in;
		cout << "Please enter an integer" <<endl;
		cin >> in;
		input[count_number_of_keys] = in;//keep the keys into the input[]
		count_number_of_keys++;
	}
	
	
	
	Quick_Sort(input,0,number_of_keys-1);
	
	
	/*		print output		*/
	cout << "\\\\\\\\\\\\\\\\\\" <<endl;
	for(int i=0 ; i < number_of_keys; i++)
	{
        cout << input[i] << endl;
        //cout<<input[i]<<endl;
    }
    
	/*		print output			*/
	
	return 0;
	
}
