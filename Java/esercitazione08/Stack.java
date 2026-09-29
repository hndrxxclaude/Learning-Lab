import java.util.LinkedList;
import java.util.Objects;

public class Stack {
    
    private static final int MAX_SIZE = 100;
    private LinkedList<String> stack;

    public Stack(){
        stack = new LinkedList<>();
    }

    public boolean isEmpty(){
        return stack.isEmpty();
    }

    public boolean isFull(){
        return stack.size() >= MAX_SIZE;
    }

    public int size(){
        return stack.size();
    }

    public void push(String s){
        if (isFull()){
            throw new IllegalStateException("Stack is full. Cannot push.");
        }
        stack.add(s);
    }

    public String pop(){
        if(isEmpty()){
            throw new IllegalStateException("Stack is empty. Cannot pop.");
        }
        return stack.removeFirst();
    }

    @Override
    public String toString(){
        if (isEmpty()){
            return "Stack[empty]";
        }
        StringBuilder sb = new StringBuilder("Stack[top -> ");
        for (int i = 0; i < stack.size(); i++){
            sb.append("\"").append(stack.get(i)).append("\"");
            if (i < stack.size() - 1){
                sb.append(", ");
            }
        }
        sb.append(" <- bottom]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object o){
        if (this == o){
            return true;
        }
        if (o == null || getClass() != o.getClass()){
            return false;
        }
        Stack other = (Stack) o;
        return Objects.equals(this.stack, other.stack);
    }

    @Override 
    public int hashCode(){
        return Objects.hash(stack);
    }

}
