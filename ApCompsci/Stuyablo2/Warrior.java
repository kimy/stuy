import java.util.Random; 

public class Warrior extends Adventurer{

    private int rage;
    private Random r = new Random(); 
    private Random hit = new Random();

    public Warrior(){
	this("Ralph"); 
    }

    public Warrior(String n){
	setName(n);
	setHP(30); 
	setRage(0);
	setSTR(20);
	setINT(10);
	setDEX(13);
    }

    public Warrior(String n, int STR, int INT, int DEX){
	setName(n);
	setHP(20);
	setRage(0);
	setSTR(STR);
	setINT(INT);
	setDEX(DEX);
    }


 //attack 
    public void attack(Adventurer target){
	int damage = r.nextInt(this.getSTR() / 2);
	int x = this.getSTR() + this.getDEX(); 
	int hitChance = hit.nextInt(x);
	    if (2 * hitChance > 50){
	    target.setHP(target.getHP() - damage);
	    this.setRage(this.getRage() + damage); 
	    System.out.println(this.getName() + " attacked " + target.getName() + " for " + damage + " points...");
	}else{
	    System.out.println(this.getName() + " attacked  " +
			       target.getName() + " and missed ");  
	}
    }
  
    public void specialAttack(Adventurer target) {
	int damage = r.nextInt(this.getSTR());
	int x = (2 * this.getSTR()) + this.getINT() + this.getDEX(); 
	int hitChance = hit.nextInt(x);
	if (2 * hitChance > (80 - this.getDEX() - this.getRage())){
	    target.setHP(target.getHP() - damage);
	    this.setRage(this.getRage() + (damage));
	    System.out.println(this.getName() + " manhandled " + target.getName() + " and did " + damage + " points of damage...");
	} else {
	    System.out.println(this.getName() + " tried to pick up " + target.getName() + " but dropped " + target.getName()  + " then ...");
	    attack(target);  
	}
    }

    public void rest(){
	int regain = r.nextInt(8);
	this.setHP(this.getHP() + regain);
	System.out.println("Regains " + regain + " HP points");
    }

    public String getStats(){
	return "[Warrior]" + super.getStats() + " RAGE" + getRage(); 
    }

    //rage
    public void setRage(int r){
	rage = r;
    }
    
    public int getRage(){
	return rage; 
    }


}

