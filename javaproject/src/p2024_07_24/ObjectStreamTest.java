package p2024_07_24;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Date;

class PersonInformation implements Serializable{
	private String name;
	private int age;
	private String address;
	private String telephone;
	
	public PersonInformation(String name, int age, String address, String telephone){
		this.name = name;
		this.age = age;
		this.address = address;
		this.telephone = telephone;
	}
	
	public String getName() {
		return name;
	}
	
	public int getAge() {
		return age;
	}
	
	public String getAddress() {
		return address;
	}
	
	public String getTelephone() {
		return telephone;
	}
}
public class ObjectStreamTest {
	PersonInformation gemini;
	PersonInformation johnharu;
	Date d;
	public ObjectStreamTest() {
		gemini = new PersonInformation("gemini",10,"seoul","02-321-3234");
		johnharu = new PersonInformation("johnharu",20,"seoul","02-473-4232");
		d = new Date();
	}
	
	public void writeObjectFile() {
		try {
			FileOutputStream fos = new FileOutputStream("person.dat");
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(gemini);
			oos.writeObject(johnharu);
			oos.writeObject(d);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public void readObjectFile() {
		
		try {
			FileInputStream fis = new FileInputStream("person.dat");
			ObjectInputStream ois = new ObjectInputStream(fis);
			Object o =null;
			while((o = ois.readObject()) !=null) {
				if( o instanceof PersonInformation) {
					System.out.println(((PersonInformation) o).getName()+  " : ");
					System.out.println(((PersonInformation) o).getAge()+  " : ");
					System.out.println(((PersonInformation) o).getAddress()+  " : ");
					System.out.println(((PersonInformation) o).getTelephone()+  " : ");
					System.out.println();
				}else {
					System.out.println(o.toString());
				}
			}
		}catch(Exception e) {
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ObjectStreamTest ost = new ObjectStreamTest();
		ost.writeObjectFile();
		ost.readObjectFile();
	}

}
