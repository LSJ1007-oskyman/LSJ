package p2024_07_05;

public class Assignment {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num=0;
		for(int i =0 ; i<=9; i++)
		{
			if(i == 0)
			{
				for(int j=2; j<=9; j++)
				{
					System.out.print("["+j+"단]\t");
				}
				System.out.println();
			}
			
			else
			{
				for(int j=2; j<=9; j++)
				{
					System.out.print(j+"*"+i+"="+(j*i)+"\t");
				}
				System.out.println();
			}
		}

	}

}
