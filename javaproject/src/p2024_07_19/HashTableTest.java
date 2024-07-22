package p2024_07_19;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Map;

public class HashTableTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 업캐스팅(자동 형변환)
		// 1. 업캐스팅이 되면 참조 가능한 영역의 축소가 일어난다.
		// 2. 업캐스팅이 되면 부모가 상속해준 메소드만 접근할 수 있다.
		Map h = new Hashtable();			// 업캐스팅
		Hashtable ht = new Hashtable();
		
		//put(Object key, Object key)		// 업캐스팅(자동 형변환)
		ht.put("딸기", "StrawBerry");
		ht.put("사과", "Apple");
		ht.put("포도", "Grapes");
		
// 방법1. key를 알고 있는 경우
		// Object  get(Object key)
		// Object obj = ht.get("포도");
		String val = (String)ht.get("포도");	// 다운캐스팅(강제 형변환)
		if(val != null) {
			System.out.println("포도:"+ val);
		}		
		String s = (String)ht.get("딸기");
		String a = (String)ht.get("사과");
				
		
// 방법2. key를 모르는 경우		
		 // 열거형(Enumeration): 딸기, 사과, 포도
		 Enumeration Enum = ht.keys();   //Map의 모든 key를 구해온다.
		 while(Enum.hasMoreElements()) { // 가져올 key가 있으면 true리턴
			String k = (String)Enum.nextElement(); // k="딸기"
			String v = (String)ht.get(k);          // v="StrawBerry"
			
			System.out.println(k+" : "+v);
		 }	
		
	}

}
