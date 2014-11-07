import java.util.Random; 

public class Wizard extends Adventurer{

    private int mana;
    private Random r = new Random();
    private Random hit = new Random(); 

    //constructor
    public Wizard(){
	this("Merlin"); 
    }

    public Wizard(String n){
	setName(n);
	setHP(20); 
	setMana(20);
	setSTR(11);
	setINT(20);
	setDEX(12);
    }
    public Wizard(String n, int STR, int INT, int DEX){
	setName(n);
	setHP(20);
	setMana(20);
	setSTR(STR);
	setINT(INT);
	setDEX(DEX);
    }


    //attack 
    public void attack(Adventurer target){
	int damage = r.nextInt(this.getSTR() / 2);
	int x = this.getINT() + this.getDEX(); 
	int hitChance = hit.nextInt(x);
	if (2 * hitChance > 50){
	    target.setHP(target.getHP() - damage);
	    System.out.println(this.getName() + " pokes " + target.getName() + " with a stick for " + damage + " points...");
	}else{
	    System.out.println(this.getName() + " attacked " +
			       target.getName() + " and missed... ");  
	}
    }
  
    public void specialAttack(Adventurer target) {
	int damage = r.nextInt(this.getINT());
	int x = this.getSTR() + (2 *  this.getINT()) + this.getDEX(); 
	int hitChance = hit.nextInt(x);
	if ((2 * hitChance > (80 - getDEX())) && this.getMana() > 10) {
	    target.setHP(target.getHP() - damage);
	    this.setMana(this.getMana() - 10); 
	    System.out.println(this.getName() + " sends an orbe of destruction towards  " + target.getName() + " and did " + damage + " points of damage...");
	} else {
	    System.out.println(this.getName() + " tried to hit " + target.getName() + " but missed..." + " then ...");
	    attack(target);  
	}
    }

    public void rest(){
	int regainHP = r.nextInt(8);
        int regainMana = r.nextInt(8);
        this.setHP(this.getHP() + regainHP);
	this.setMana(this.getMana() + regainMana);
	System.out.println("Regained " + regainHP + " HP points and " +regainMana +" Mana");
    }

    public String getStats(){
	return "[Wizard]" + super.getStats() + " MANA" + getMana();
    }

    //set methods
    public void setMana(int m){
	mana = m;
    }

    //get method
    public int getMana(){
	return mana;
    }




}
