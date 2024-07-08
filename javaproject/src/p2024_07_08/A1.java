package p2024_07_08;

import java.util.Scanner;

public class A1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int[] s= new int[5];
		Scanner sc = new Scanner(System.in);
		
		int max, min;
		max =s[0];
		min =s[0];
		
		for(int i=0; i<s.length;i++)
		{
			s[i] = sc.nextInt();
			if(i==0)
			{
				max =s[i];
				min =s[i];
			}
			else
			{
				max = Math.max(max, s[i]);
				min = Math.min(min, s[i]);
			}
		}
		
		System.out.println("max: "+max);
		System.out.println("min: "+min);
		

	}

}
