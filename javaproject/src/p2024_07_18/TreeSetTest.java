package p2024_07_18;

import java.util.Set;
import java.util.TreeSet;

public class TreeSetTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		TreeSet
//		데이터를 오름차순으로 정렬해서 저장하고 출력하는 기능을 제공한다.
		
//		오름차순 						내림차순
//---------------------------------------------------------------		
//	숫자:작은 숫자부터 큰숫자로 정렬       큰숫자부터 작은 숫자순으로 정렬
//	문자:사전 정렬 ex)a,b,c...		   사전 역순 정렬: ex)z,y,x...

		TreeSet hs = new TreeSet();
		
		if(hs.add("korea")) {
			System.out.println("첫번째 korea 추가 성공");
		}else {
			System.out.println("첫번째 korea 추가 실패");
		}
		
		if(hs.add("japan")) {
			System.out.println("japan 추가 성공");
		}else {
			System.out.println("japan 추가 실패");
		}
		
		if(hs.add("america")) {
			System.out.println("america 추가 성공");
		}else {
			System.out.println("america 추가 실패");
		}
		
		if(hs.add("britain")) {
			System.out.println("britain 추가 성공");
		}else {
			System.out.println("britain 추가 실패");
		}
		
		if(hs.add("korea")) {
			System.out.println("두번째 korea 추가 성공");
		}else {
			System.out.println("두번째 korea 추가 실패");
		}
		
		System.out.println(hs);
		
	}

}
