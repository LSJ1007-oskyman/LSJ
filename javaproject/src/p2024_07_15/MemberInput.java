package p2024_07_15;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


// MemberInfo같은 클래스를 DTO라고 부른다(Data Transfer Object)->받은데이터를 메모리상에 저장하는 클래스를 말한다.
class MemberInfo{
	private String name ;
	private int age;
	private String email;
	private String address ;
	
	
	public void setName(String name)
	{
		this.name = name;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	
	public void setAge(int age)
	{
		this.age = age;
	}
	
	public String getName()
	{
		return this.name;
	}
	public String getEmail()
	{
		return this.email;
	}
	public String getAddress()
	{
		return this.address;
	}
	
	public int getAge()
	{
		return this.age;
	}
	
}
public class MemberInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		List<MemberInfo> l = new ArrayList<>();//회원 정보객체를 담는 리스트
		
		while(true) {
			System.out.println("회원정보를 입력하세요 \t 끝내시려면 q를 입력하세요");
			System.out.println("이름");
			String name = sc.nextLine();
			if(name.equals("q")) break;//q눌렀을 때 while문 탈출
			System.out.println("나이");
			int age = sc.nextInt();
			sc.nextLine();
			System.out.println("이메일");
			String email = sc.nextLine();
			System.out.println("주소");
			String address = sc.nextLine();
			MemberInfo mi = new MemberInfo();
			mi.setName(name);
			mi.setEmail(email);
			mi.setAddress(address);
			mi.setAge(age);
			l.add(mi);
		}
		
		for(int i=0;i<l.size();i++)
		{
			System.out.println("----------------------------------------------------");
			System.out.println("회원"+(i+1)+"의 "+"name: "+l.get(i).getName());
			System.out.println("회원"+(i+1)+"의 "+"age: "+l.get(i).getAge());
			System.out.println("회원"+(i+1)+"의 "+"email: "+l.get(i).getEmail());
			System.out.println("회원"+(i+1)+"의 "+"address: "+l.get(i).getAddress());
		}
		System.out.println("----------------------------------------------------");
		System.out.println("실행 끝");
	}//end of main

}//end of class