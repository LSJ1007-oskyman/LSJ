package p2024_07_08;

public class ArrayEx05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] scores= new int[]{83,90,87};
		
		int sum = add(scores);
		
		System.out.println("총합: "+sum);

	}
	
	public static int add(int[] scores) {
		int sum =0;
		for(int i=0;i<scores.length;i++)
		{
			sum+=scores[i];
		}
		
		return sum;
	}

}
