package Test;

import java.util.Scanner;
import search.Linear;

public class Main {
public static void main(String[] Args) {
	int n;
	System.out.println("enter the size of transaction array");
	Scanner sc=new Scanner(System.in);
	n=sc.nextInt();
	int[] transactions=new int[n];
	
	System.out.println("enter the values of array");
	for(int i=0;i<n;i++) {
		transactions[i]=sc.nextInt();
	}

	int sumArray[]=new int[n],sum=0;
	for(int i=0;i<n;i++) {
		sum=sum+transactions[i];
		sumArray[i]=sum;
	}
	
	System.out.println("enter the total no of targets that needs to be achieved");
	n=sc.nextInt();
	while(n>0) {
		
		System.out.println("enter the value of target");
		int target=sc.nextInt();
		
		Linear ls=new Linear();
		ls.linearSearch(sumArray, target);
		n--;
	}
	
	
	sc.close();
}
	
	
}
