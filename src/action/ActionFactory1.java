package action;

public class ActionFactory1 {
	private static ActionFactory1 instance = new ActionFactory1();
	private ActionFactory1() {}
	public static ActionFactory1 getInstance() {
		return instance;
	}
	public Action getAction(String command) {
			Action action = null;
			switch(command) {
//			case "minus": action = new MinusAction(); break;
//			case "multiply": action = new MultiplyAction(); break;
//			case "divide": action = new DivideAction(); break;
//			case "result": action = new ResultAction(); break;
			}
			return action;
		}
}
