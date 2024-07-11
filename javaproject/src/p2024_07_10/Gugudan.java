package p2024_07_10;

class makeGugudan{
	public void makeGugudan(){
		int[][] gugu= new int[8][9];
		for(int i=0;i<8;i++)
		{
			for(int j=0; j<9;j++)
			{
				gugu[i][j]=(i+2)*(j+1);
			}
		}
		for(int i=0;i<8;i++)
		{
			for(int j=0; j<9;j++)
			{
				System.out.print(gugu[i][j]+"\t");
			}
			System.out.println("");
		}
		
	}
}

public class Gugudan {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		makeGugudan g= new makeGugudan(); 
		g.makeGugudan();
	}

}
