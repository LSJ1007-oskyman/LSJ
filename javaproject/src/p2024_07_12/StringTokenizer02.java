package p2024_07_12;

import java.util.StringTokenizer;

public class StringTokenizer02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String source1 = "한국 미국 태국 중국 이란";
		StringTokenizer st1 =new StringTokenizer(source1, " ");
		while(st1.hasMoreTokens()) {
			System.out.println("st1.token:"+st1.nextToken());
		}
		System.out.println();
		
		String source2 = "푸들,삽살개,풍산개,진돗개";
		StringTokenizer st2 =new StringTokenizer(source2, ",");
		while(st2.hasMoreTokens()) {
			System.out.println("st2.token:"+st2.nextToken());
		}
		System.out.println();
		
		StringTokenizer st3 =new StringTokenizer(source2, ",",true);
		while(st3.hasMoreTokens()) {
			System.out.println("st3.token:"+st3.nextToken());
		}		
	}//end of main
}//end of class
