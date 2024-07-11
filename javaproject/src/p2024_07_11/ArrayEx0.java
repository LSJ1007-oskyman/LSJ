
package p2024_07_11;

public class ArrayEx0 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int[][] s = new int[8][9];  // 8행  9열
		
		// 구구단 세로로 한줄로 출력
//		for(int dan=0; dan<=7; dan++){				// 행
//			System.out.println("["+(dan+2)+"단]");
//			for(int i=0; i<=8; i++){				// 열
//				s[dan][i] = (dan+2)*(i+1);
//				
//				System.out.println((dan+2)+"*"+(i+1)+"="+s[dan][i]);
//			}
//			System.out.println("");
//		}	

		
		// 구구단을 각 단별로 출력
		for(int dan=0; dan<=7; dan++){				// 행
			for(int i=0; i<=8; i++){				// 열
				s[dan][i] = (dan+2)*(i+1);				
			}
		}		
		for(int dan=2; dan<=9; dan++)
			System.out.print("["+dan+"단]\t");
		System.out.println("");
		for(int i=0; i<=8; i++){	
			for(int dan=0; dan<=7; dan++){				
				System.out.print((dan+2)+"*"+(i+1)+"="+s[dan][i]+"\t");
			}
			System.out.println("");
		}		
		
				
	}

}
