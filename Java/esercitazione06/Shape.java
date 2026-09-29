import java.util.Objects;

public abstract class Shape implements Scalable, Drawable {
    
    private String color;
    private boolean filled;

    public Shape() {
        this.color = "black";
        this.filled = false;
    }
 
    public Shape(String color, boolean filled) {
        this.color = color;
        this.filled = filled;
    }

    public String getColor(){
        return color;
    }

    public void setColor(String color){
        this.color = color;
    }

    public boolean isFilled(){
        return filled;
    }

    public void setFilled(boolean filled){
        this.filled = filled;
    }

    public abstract double getArea();
    public abstract double getPerimeter();

    @Override
    public String toString(){
        return "Color: " + color 
        + " | Filled: " + (filled ? "Yes" : "No") + ".";
    }

    @Override
    public void draw(){
        System.out.println("Drawing: " + toString());
    }

    @Override
    public boolean equals(Object o){
        if (this == o){
            return true;
        }

        if (o == null || getClass() != o.getClass()){
            return false;
        }

        Shape shape = (Shape) o;
        return this.filled == shape.filled && Objects.equals(this.color, shape.color);
    }

    @Override
    public int hashCode(){
        return Objects.hash(color, filled);
    }

}
