package p2024_07_19;

import java.util.Date;
import java.util.Stack;

public class StackTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Stack s = new Stack();
		System.out.println(s.empty());
		
		//stack에 값을 넣음
		s.push("gemeni");
		Date d = new Date();
		s.push(d);
		s.push(new Integer(10));
		s.push("johnharu");
		
		//stack의 값을 출력
		System.out.println(s.empty());
		System.out.println(s.peek());
		System.out.println(s.pop());
		System.out.println(s.pop());
		System.out.println(s.pop());
		System.out.println(s.pop());
		System.out.println(s.empty());
	}

}
