import java.util.Random;
import java.util.Scanner;

public class Game2{

    public static void out(String s){
	System.out.println(s);
    }

    public static void main(String[]args){
	Scanner in = new Scanner(System.in);
	out("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Welcome to Stuyablo!!!!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	out("");
	pause(500);
	Adventurer[] players = createParty();
	pause(1000);
	out("");
	Adventurer opponent = createOpponent();
	pause(2000);
	combat(players, opponent);
    }

    public static Adventurer createAdventurer(){
	Scanner in = new Scanner(System.in);

	Adventurer player = null;

	//Name
	out("Please Create an Adventurer Name"); 
	String playerName = "";
	playerName = in.nextLine();
	pause(300);
	//Asking player
	out("Select a class!");
	out("A. Warrior");
	out("B. Wizard");
	out("C. Rogue");
	pause(300);
	String choice = "";
	choice = in.nextLine();

	//Applying Choices
	if(choice.equals("A")){
	    player = new Warrior(playerName);
	    out ("Welcome Warrior " + playerName + "!");
	}else{
	    if(choice.equals("B")){
		    player = new Wizard(playerName);
		    out ("Welcome Wizard " + playerName + "!");
		}else{
		    if(choice.equals("C")){
			    player = new Rogue(playerName);
			    out("Welcome Rogue " + playerName + "!");
			}
		}
	}

	pause(300);
	AllocateStats(player);
	out("");
	return player;
			
    }

    public static void AllocateStats(Adventurer player){
	Scanner in = new Scanner(System.in);
	
	out ("Allocate your stats! You have 40 points!");


	int s = 0;
	int i = 0;
	int d = 0;
	while(!((s + i + d) == 40)){
	out("STR:");
	s = in.nextInt();	
	
	out("INT:");
	i = in.nextInt();
	
	out("DEX:");
	d = in.nextInt();
	if(!((s + i + d) == 40)){
	    out("Try again those stats don't add up!");
	}
	out("");
	}

	player.setSTR(s + 1);
	player.setINT(i + 1);
	player.setDEX(d + 1);
	out("");
	out("Allocation complete!");	
	out(player.getStats());

    }

    public static Adventurer createOpponent(){
	Random r = new Random();
	Adventurer opponent = null;

	int choice = r.nextInt(3);
	if(choice == 0){
	    opponent = new Warrior("BOSS");
	    opponent.setHP(50);
	    out("Your opponent, Warrior " + opponent.getName() + ", has appeared!");
	}else{
	    if(choice == 1){
		opponent = new Wizard("BOSS");
		opponent.setHP(50); 
		out ("Your opponent, Wizard " + opponent.getName() + ", has appeared!");
	    }else{
		if(choice == 2){
		    opponent = new Rogue("BOSS"); 
		    opponent.setHP(50);
		    out ("Your opponent, Rogue " + opponent.getName() + ", has appeared!"); 
		}
	    }
	}
	pause(300);
	out("");
	out("Opponent:");
	out(opponent.getStats());
	return opponent;

    }

    public static Adventurer[] createParty(){
	Scanner in = new Scanner(System.in);
	Adventurer[] party;

	out("Create A Party");
	out("A. My Own");
	out("B. Default Party");

	String choice = "";

	choice = in.nextLine();
	if(choice.equals("A")){
		out("There are three people in your party!");

		party = new Adventurer[3];
		for(int i = 0; i < party.length; i++){
		    pause(300);
		    party[i] = createAdventurer();
		}
	    }else{
	    pause(300);
		party = defaultParty();
	    }
	out("");
	out(getStatistics(party));
	return party;
    }

    public static Adventurer[] defaultParty(){
	Adventurer[] party;
	party = new Adventurer[3];
	party[0] = new Warrior();
	party[1] = new Wizard();
	party[2] = new Rogue();
	return party;
    }

    public static String getStatistics(Adventurer[] party){
	String s = "";
	s = "Your Party: \n" + "0:" + 
	    party[0].getStats() + "\n" + "1:" + 
	    party[1].getStats() + "\n" + "2:" +
	    party[2].getStats();
	return s;
   }

    public static void combat(Adventurer[] party, Adventurer opponent){
	Scanner in = new Scanner(System.in);
	
	while(isPartyAlive(party) && isAlive(opponent)){
	    out("");
	    out("***********************************************YOUR TURN*******************************************************");
	    out("");
	    out("It is your turn to attack!");
	    out(getStatistics(party));
	    out("");
	    out("Enter the number of the player you want to attack with");

	    pause(500);
	    
	    int choice = 0;
	    while(isDead(party[choice])){
		choice = in.nextInt();
		if(isDead(party[choice])){
		    out("Try again! That Adventurer is Dead");
		}else{
		    break;
		}
	    }
	    
	    choice = in.nextInt();

	    pause(700);
	    
	    playerCombat(party[choice], opponent);
	 
	    out("");
	    out("");
	    out("Round Stats");
	    out(getStatistics(party));
	    out("");
	    out("Opponent: \n" + opponent.getStats());

	    pause(2000);

	    if(isAlive(opponent)){
	    out("");
	    out("**********************************************OPPONENT TURN***************************************************");
	    out("");
	    opponentCombat(opponent, party);
	   
	    pause(700);
	    out("");
	    out("");
	    out("Round Stats");
	    out(getStatistics(party));
	    out("");
	    out("Opponent: \n" + opponent.getStats());
	    pause(3000);
	    }else{
		break;
	    }
	}
	
	if(!isPartyAlive(party)){
	    out("");
	    out("You Lose!");
	}else{
	    out("");
	    out("You Win!");
	}

    }

    public static void playerCombat(Adventurer player, Adventurer opponent){
	Scanner in = new Scanner(System.in);

	out("You are now attacking with " + player.getName() + "!");
	out("What would you like to do?");
	out("A. Attack");
	out("B. Special Attack");
	out("C. Surrender");
	out("D. Rest");
	
	String choice = "";
	while(!choice.equals("A") && !choice.equals("B") && !choice.equals("C") && !choice.equals("D")){
	    choice = in.nextLine();
	    if(!choice.equals("A") && !choice.equals("B") && !choice.equals("C") && !choice.equals("D")){	 
		out("Invalid Choice");
	    }
	}

	pause(800);
	out("");
	if(choice.equals("A")){
	    player.attack(opponent);
	}else{
	    if(choice.equals("B")){
		    player.specialAttack(opponent);
		}else{
		    if(choice.equals("C")){
			player.setHP(0);
		    }else{
			if(choice.equals("D")){
				player.rest();
			    }
		    }
	    }
	}
    }
		

    public static void opponentCombat(Adventurer opponent, Adventurer[] party){
	Random r = new Random();
    
	out("Now it is " + opponent.getName() + "'s turn to attack!");
	pause(2000);
	out("");
	Adventurer target = null;
	target = Target(party);

	boolean attack = r.nextBoolean();

	if(attack){
	    opponent.specialAttack(target);
	}else{
	    opponent.attack(target);
	}

    }

    public static Adventurer Target(Adventurer[] party){

	Adventurer biggest = null;

	if(party[0].getHP() > party[1].getHP()){
	    if(party[2].getHP() >= party[0].getHP()){
		biggest = party[2];
	    }else{
		biggest = party[0];
		    }
	}else{
	    if(party[1].getHP() >= party[2].getHP()){
		biggest = party[1];
	    }else{
		biggest = party[2];
	    }
	}
	return biggest;
    }

    public static boolean isAlive(Adventurer a){
	if(a.getHP() > 0){
	    return true;
	}else{
	    return false;
	}
    }

    public static boolean isDead(Adventurer a){
	if(a.getHP() <= 0){
	    return true;
	}else{
	    return false;
	}
    }

    public static boolean isPartyAlive(Adventurer[] party){
	boolean[] status = new boolean[3];
	for(int i = 0; i < party.length; i++){
	    status[i] = isAlive(party[i]);
	}
	return status[0] || status[1] || status[2];
    }
    
    //help from Alvin Lin
    public static void pause (int ms) {
	try {
	    Thread.sleep(ms);
	} catch (Exception e) {}
    }
}
