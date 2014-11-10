public class Test{

    public static void main(String[]args){
	SuperArray a = new SuperArray();
	SuperArray b = new SuperArray(3);
	System.out.println(a.toString());
	System.out.println(b.toString());
	System.out.println(a.size());
	System.out.println(b.size());
	a.resize(5);
	System.out.println(a.toString());
	a.add("Yubin");
	System.out.println(a.toString());

    }

}
