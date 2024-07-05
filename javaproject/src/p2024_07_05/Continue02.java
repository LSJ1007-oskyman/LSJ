package p2024_07_05;

public class Continue02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		for(int i=1; i<=100; i++)
		{
			if(i%2 == 1) continue;
			System.out.println("짝수: "+i);
		}
	}

}
