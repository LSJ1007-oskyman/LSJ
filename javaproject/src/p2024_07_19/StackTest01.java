package p2024_07_19;

import java.util.Stack;

public class StackTest01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Stack myStack = new Stack();
		myStack.push("1-자바");
		myStack.push("2-C++");
		myStack.push("3-API");
		myStack.push("4-MFC");
		
		while(!myStack.isEmpty()) {
			System.out.println(myStack.pop());
		}

	}//end of main

}//end of class
