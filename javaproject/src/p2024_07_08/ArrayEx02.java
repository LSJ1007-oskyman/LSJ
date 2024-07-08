package p2024_07_08;

public class ArrayEx02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] score = {83,90,87};
		System.out.println("score[0]:"+score[0]);
		System.out.println("score[1]:"+score[1]);
		System.out.println("score[2]:"+score[2]);
		
		int sum=0;
		for(int i=0; i<score.length; i++)
		{
			sum +=score[i];
		}
		
		System.out.println("총점:"+sum);
		
		double avg = (double)sum/3.0;
		System.out.println("평균:"+avg);
		
		System.out.printf("평균: %.2f",avg);
	}

}
