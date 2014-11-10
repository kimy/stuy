public class SuperArray{

    private Object[] Objects;
    private int Size;

    public SuperArray(){
	this(10);

    }

    public SuperArray(int size){
	Size = size;
	this.Objects = new Object[size];
    }

    public String toString() {
	String s = "[ ";
	for (int i = 0; i < this.Objects.length; ++i) {
	    s += this.Objects[i] + ", ";
	}
	s += "]";
	return s;
    }
    public int size(){
	return this.Size;
    }

    public void resize(int newSize){
	Object[] a = new Object[newSize];
	for (int i=0;i<Size;i++){
	    a[i] = Objects[i];
	}

	Object[]sArray =new Object[newSize];
	for (int i=0;i<Size;i++){
	    sArray[i]=a[i];
	}
	setArray(sArray);
	setLength(newSize);
    }

    public void setArray(Object[] a){
	this.Objects = a;
    }

    public void setLength(int size){
	this.Size = size;
    }

    public void add(Object e){
	setLength(Size + 1);
	resize(Size);
	Objects[Size - 1] = e;
    }

   

}
