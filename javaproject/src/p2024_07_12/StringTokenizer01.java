package p2024_07_12;

import java.util.StringTokenizer;

public class StringTokenizer01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//토큰 : 구분구호(#)로 분리된 문자
		StringTokenizer str = new StringTokenizer("이순신#을지문덕#강감찬#광개토대왕","#");
		/*
		 * System.out.println(str.nextToken()); 
		 * System.out.println(str.nextToken());
		 * System.out.println(str.nextToken()); 
		 * System.out.println(str.nextToken());
		 * System.out.println(str.nextToken());
		 */
		
		int cnt = str.countTokens();
		System.out.println("파싱할 문자열의 총개수 -> "+cnt);
		
		System.out.println(str.nextToken());
		while(str.hasMoreTokens()) {
			System.out.println(str.nextToken());			
		}
	}//end of main

}//end of class
