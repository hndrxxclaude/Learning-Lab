import java.util.Objects;

public class Rectangle extends Shape {
    
    private double width;
    private double length;

    public Rectangle(double width, double length){
        super();
        if (width <= 0){
            throw new IllegalArgumentException("Width must be greater than 0.");
        }
        if (length <= 0){
            throw new IllegalArgumentException("Length must be greater than 0.");
        }
        this.width = width;
        this.length = length;
    }

    public Rectangle(String color, boolean filled, double width, double length){
        super(color, filled);
        if (width <= 0){
            throw new IllegalArgumentException("Width must be greater than 0.");
        }
        if (length <= 0){
            throw new IllegalArgumentException("Length must be greater than 0.");
        }
        this.width = width;
        this.length = length;
    }

    public double getWidth(){
        return width;
    }

    public void setWidth(double w){
        if (w <= 0){
            throw new IllegalArgumentException("Width must be greater than 0.");
        }
        this.width = w;
    }

    public double getLength(){
        return length;
    }

    public void setLength(double l){
        if (l <= 0){
            throw new IllegalArgumentException("Length must be greater than 0.");
        }
        this.length = l;
    }

    @Override
    public double getArea(){
        return width * length;
    }

    @Override
    public double getPerimeter(){
        return 2 * (width + length);
    }

    @Override
    public String toString(){
        return "Rectangle | " + super.toString()
        + " | Width: " + width
        + " | Length: " + length 
        + " | Area: " + String.format("%.2f", getArea())
        + " | Perimeter: " + String.format("%.2f", getPerimeter());
    }

    @Override
    public void scale(double factor){
        if (factor <= 0){
            throw new IllegalArgumentException("Scaling factor must be greater than 0.");
        }
        this.width *= factor;
        this.length *= factor;
    }

    @Override
    public boolean equals(Object o){
        
        if (!super.equals(o)){
            return false;
        }

        if (o instanceof Rectangle rectangle){
            return Double.compare(this.length, rectangle.length) == 0 && Double.compare(this.width, rectangle.width) == 0;
        }

        return false;
    }

    @Override
    public int hashCode(){
        return Objects.hash(super.hashCode(), width, length);
    }
}
