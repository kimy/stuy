import java.util.Random; 

public class Rogue extends Adventurer{

    private int stamina; 
    private Random r = new Random();
    private Random hit = new Random();

    public Rogue(){
	this("Xavier"); 
    }

    public Rogue(String s){
	setName(s);
	setHP(20); 
	setStamina(20);
	setSTR(13);
	setINT(10);
	setDEX(20);
    }

    public Rogue(String n, int STR, int INT, int DEX){
	setName(n);
	setHP(20);
	setStamina(20);
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
	    System.out.println(this.getName() + " backstabs " + target.getName() + " for " + damage + " points...");
	}else{
	    System.out.println(this.getName() + " tried to backstab " +
			       target.getName() + " and tripped.. ");  
	}
    }
  
    public void specialAttack(Adventurer target) {
	int damage = r.nextInt(this.getSTR() + 2);
	int x = this.getSTR() + this.getINT() + this.getDEX(); 
	int hitChance = hit.nextInt(x);
	if ((2 * hitChance > (80 - this.getDEX())) && this.getStamina() > 10) {
	    target.setHP(target.getHP() - damage);
	    this.setStamina(this.getStamina() - 10); 
	    System.out.println(this.getName() + " sinister striked " + target.getName() + " and did " + damage + " points of damage...");
	} else {
	    System.out.println(this.getName() + " tried to strike " + target.getName() + " but missed..." + " then ...");
	    attack(target);  
	}
    }

    public void rest(){
	int regainHP = r.nextInt(8);
	int regainStamina = r.nextInt(8);
	this.setHP(this.getHP() + regainHP);
	this.setStamina(this.getStamina() + regainStamina);
	System.out.println("Regained " + regainHP + " HP points and " + regainStamina + " Stamina");
    }

    public String getStats(){
	return "[Rogue]" +  super.getStats() + " STAMINA" + getStamina(); 
    }

    public void setStamina(int a){
	stamina = a;
    }

    public int getStamina(){
	return stamina;
    }


}
