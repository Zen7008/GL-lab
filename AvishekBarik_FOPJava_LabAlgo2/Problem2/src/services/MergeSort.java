package services;

public class MergeSort {

	public void Merge_(int arr[], int start, int mid, int end) {
		int leftSize=mid-start+1,rightSize=end-mid;
		
		
		int leftArray[]=new int[leftSize], rightArray[]=new int[rightSize];
		
		//copy
		for(int i=0;i<leftSize;i++) {
			leftArray[i]=arr[i+start];
		}
		for(int i=0;i<rightSize;i++) {
			rightArray[i]=arr[i+mid+1];
		}
		
		//merge
		int i=0,j=0;
		while(i<leftArray.length&&j<rightArray.length) {
			
			if(leftArray[i]<=rightArray[j]) {
				arr[start+i+j]=leftArray[i];
				i++;					
			}
			else {
				arr[start+i+j]=rightArray[j];
				j++;
			}
		}
		
		
			for(int k=i;k<leftArray.length;k++)
				arr[start+j+k]=leftArray[k];
			
			for(int k=j;k<rightArray.length;k++) 
				arr[start+i+k]=rightArray[k];
	}
	
	///////////////////////////
public void sort(int[] arr,int start,int end) {
	
		int mid=(start+end)/2;
		if(start<end) {
			
			sort(arr, start, mid);
			sort(arr, mid+1, end);
			Merge_(arr,start,mid,end);

			
		}
	}
	
}