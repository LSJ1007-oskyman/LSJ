package p2024_07_05;

public class Continue03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		for(int i=1; i<=100; i++)
		{
			if(i%5 != 0) continue;
			System.out.println("5의배수: "+i);
		}

	}

}
