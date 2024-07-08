package p2024_07_08;

public class ArrayEx06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int[] score = {95, 71, 84, 93, 87};
		
		int sum =0;
		for(int i=0; i<score.length; i++)
		{
			sum += score[i];
		}
		System.out.println("총합: "+sum);
		
		int sum1=0;
		for(int s : score)
			sum1 +=s;
		System.out.println("총합; "+sum1);
		
	}

}
