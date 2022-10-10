package Test;

import java.util.Scanner;

import services.MergeSort;
import services.Transaction;

public class TestAlgo3 {

	public static void main(String Args[]) {
		
		Scanner sc= new Scanner(System.in);
		int n;
		System.out.println("enter the numbers of currency denominations  ");
		n=sc.nextInt();
		System.out.println("enter the currency denominations value");
		
		int deno[]=new int[n];
		for(int i=0;i<n;i++) {
			deno[i]=sc.nextInt();
		}
		
		MergeSort ms=new MergeSort();
		ms.sort(deno,0,n-1);

		
		Transaction t=new Transaction();
		
		System.out.println("enter the amount you want to pay ");
		int amount=sc.nextInt();
		t.count(deno, amount);
		
		sc.close();
	}
}
