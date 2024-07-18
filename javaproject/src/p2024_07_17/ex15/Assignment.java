package p2024_07_17.ex15;

import java.util.Arrays;

public class Assignment {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] num = new int[6];
		
		for(int i=0; i<6; i++)
		{
			
			int cnt=0;
			num[i] = ((int)(Math.random()*45)+1);
			
			while(cnt != i)
			{
				if(num[cnt]==num[i])
				{
					i--;
					break;
				}
				cnt++;
			}
		}
		
		Arrays.sort(num);
		
		for(int i=0; i<6; i++)
		{
			System.out.println(num[i]);
		}
		
	}

}
