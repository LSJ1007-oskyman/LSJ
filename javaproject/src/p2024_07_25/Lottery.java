package p2024_07_25;

import java.util.Set;
import java.util.TreeSet;

public class Lottery {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Set<Integer> ts = new TreeSet<>();
		
		for(int i=0; i<6;i++)
		{
			if(!ts.add((int)(Math.random()*45+1))) {
				i--;
			};
		}
		
		System.out.println(ts);

	}

}
