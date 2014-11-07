import java.util.Random; 
public abstract class Adventurer{
    //variables
    private String name;
    private int HP, STR, INT, DEX;
    private Random r = new Random(); 
    private Random hit = new Random(); 

    /*
    public Adventurer(){
	this("Lester");
    }

    public Adventurer(String s){
	setName(s);
	setHP(20);
	setSTR(15);
	setINT(12);
	setDEX(10); 
    }
    */

    public String getStats(){
	return name + " HP" +  getHP() + " STR" + getSTR() + " INT" +  getINT() + " DEX" +  getDEX();

    }

    //attack 
    abstract void attack(Adventurer target);
  
    abstract void specialAttack(Adventurer target);

    abstract void rest();

    // set and get methods 
    public void setName(String n){
	name = n;
    }

    public void setHP(int h){
	HP = h;
    }

    public String getName(){
	return name;
    }

    public int getHP(){
	return HP;
    }

    public void setSTR(int s){
	STR = s;
    }

    public int getSTR(){
	return STR;
    }

    public void setDEX(int d){
	DEX = d;
    }

    public int getDEX(){
	return DEX;
    }

    public void setINT(int i){
	INT = i;
    }

    public int getINT(){
	return INT;
    }


}
