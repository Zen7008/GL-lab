package search;

public class Linear {

	public void linearSearch(int arr[], int target) {
		int i=0;
		while(arr[i]<target&&i<(arr.length-1)) {
			i++;
		}
		
		if(arr[i]>=target)
		System.out.println("Target achieved after "+(i+1)+" transactions ");
		else 
			System.out.println("target not acheived");
	}
}
