package p2024_07_09;

public class Arr03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] score =new int [5][3];
		score[0][0] =85;
		score[0][1] =60;
		score[0][2] =70;
		score[1][0] =90;
		score[1][1] =95;
		score[1][2] =80;
		score[2][0] =75;
		score[2][1] =80;
		score[2][2] =100;
		score[3][0] =80;
		score[3][1] =70;
		score[3][2] =95;
		score[4][0] =100;
		score[4][1] =65;
		score[4][2] =80;
		
		for(int row =0;row<5; row++)
		{
			for(int col =0; col<3; col++)
			{
				System.out.print(" "+score[row][col]);
			}
			System.out.println("");
		}

	}

}
