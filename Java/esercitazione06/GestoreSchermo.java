import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;
import java.util.Iterator;

public class GestoreSchermo {
    
    private List<Shape> shapes;

    public GestoreSchermo(){
        shapes = new ArrayList<>();
    }

    public List<Shape> getShapes(){
        return shapes;
    }

    public void addShape(Shape shape){
        shapes.add(shape);
    }

    public void removeShape(Shape shape){
        shapes.remove(shape);
    }

    public void drawAll(){
        for (Shape shape : shapes){
            shape.draw();
        }
    }

    public void scaleAll(double factor){
        for (Shape shape : shapes){
            shape.scale(factor);
        }
    }

    private static double readDouble(Scanner sc, String prompt){
        while (true){
            System.out.println(prompt);
            try {
                return sc.nextDouble();
            } catch (InputMismatchException e) {
                System.out.println(" [Error] Invalid Format: please enter a decimal number.");
                sc.nextLine();
            }
        }
    }

    private static boolean readBoolean(Scanner sc, String prompt){
        while (true) {
            System.out.println(prompt);
            try {
                return sc.nextBoolean();
            } catch (InputMismatchException e){
                System.out.println(" [Error] Invalid input: please type 'true' or 'false'.");
                sc.nextLine();
            }
        }
    }


    public static void main(String[] args){

        GestoreSchermo gestore = new GestoreSchermo();
        Scanner sc = new Scanner(System.in);

        do{
            System.out.println("add, remove, draw, scale, exit: ");
            String command = sc.next();
            switch(command){
                case "add" -> {
                    System.out.println("Select shape type (circle, rectangle, square): ");
                    String shapeType = sc.next();
                    try {
                        switch(shapeType){
                        
                            case "circle" -> {
                                double radius = readDouble(sc, "radius: ");
                                System.out.println("color: ");
                                String color = sc.next();
                                boolean filled = readBoolean(sc, "filled (true / false): ");
                                gestore.addShape(new Circle(color, filled, radius));
                                System.out.println("Circle added.");
                            }
                            
                            case "rectangle" -> {
                                double length = readDouble(sc, "length: ");
                                double width = readDouble(sc, "width: ");
                                System.out.println("color: ");
                                String color = sc.next();
                                boolean filled = readBoolean(sc, "filled (true / false): ");
                                gestore.addShape(new Rectangle(color, filled, width, length));  
                                System.out.println("Rectangle added.");
                            }

                            case "square" -> {
                                double side = readDouble(sc, "side: ");
                                System.out.println("color: ");
                                String color = sc.next();
                                boolean filled = readBoolean(sc, "filled (true / false): ");
                                gestore.addShape(new Square(color, filled, side));  
                                System.out.println("Square added.");
                            }

                            default -> System.out.println("Invalid shape type.");
                        }
                    } catch (IllegalArgumentException e){
                        System.out.println(" [Error] Invalid Argument: " + e.getMessage());
                        System.out.println("Shape was NOT added");
                    } 
                }

                case "remove" -> {
                    if (gestore.getShapes().isEmpty()){
                        System.out.println("No shapes to remove.");
                        break;
                    }

                    Iterator<Shape> iteratore = gestore.getShapes().iterator();
                    while (iteratore.hasNext()){
                        Shape shape = iteratore.next();
                        System.out.println("Remove " + shape + "? (y / n): ");
                        if (sc.next().equals("y")){
                            iteratore.remove();
                            System.out.println("Shape removed.");
                        }
                    }
                }

                case "draw" -> {
                    if (gestore.getShapes().isEmpty()){
                        System.out.println("No shapes to draw.");
                        break;
                    } else {
                        gestore.drawAll();
                    }
                }

                case "scale" -> {
                    try {
                        double factor = readDouble(sc, "Scaling factor: ");
                        gestore.scaleAll(factor);
                        System.out.println("All shapes scaled by factor " + factor + ".");
                    } catch (IllegalArgumentException e){
                        System.out.println(" [Error] Invalid argument: " + e.getMessage());
                    }
                }

                case "exit" -> {
                    System.out.println("Exiting the program...");
                    sc.close();
                    return;
                }

                default -> System.out.println("Unsupported command.");
            }
        } while (true);
    }
}
