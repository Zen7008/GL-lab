package services;

public class Transaction {

	public void count(int arr[], int amount){
		int end=arr.length-1;
		int count[]=new int[arr.length];
		for(int i=0;i<count.length;i++)
			count[i]=0;	
		
		while(amount>=arr[0]&&end>=0) {
			if(arr[end]<=amount){
				count[end]++;
				amount=amount-arr[end];
			}
			else
				end--;
		}
		
		System.out.println("\nYour payment approach in order to give min no of notes will be ");
		for(int i=count.length-1;i>=0;i--)
		{
			if(count[i]!=0)
			System.out.println(arr[i]+":"+count[i]);
		}
		if(amount!=0)
			System.out.print("cannot pay "+amount);
	}
}
