import java.util.Objects;

public class Circle extends Shape {
    
    private double radius;

    public Circle(double radius){
        super();
        if (radius <= 0){
            throw new IllegalArgumentException("The radius of a circle has to be greater than 0.");
        }        
        this.radius = radius;
    }

    public Circle(String color, boolean filled, double radius){
        super(color, filled);

        if (radius <= 0){
            throw new IllegalArgumentException("The radius of a circle must be greater than 0.");
        }

        this.radius = radius;
    }

    public double getRadius(){
        return radius;
    }

    public void setRadius(double radius){
        if (radius <= 0){
            throw new IllegalArgumentException("The radius of a circle must be greater than 0.");
        }
        this.radius = radius;
    }

    @Override
    public double getArea(){
        return Math.PI * radius * radius;
    }

    @Override
    public double getPerimeter(){
        return 2 * Math.PI * radius;
    }

    @Override
    public String toString(){
        return "Circlew | " + super.toString() 
        + " | Radius: " + radius + ".";
    }

    @Override
    public void scale(double factor){
        if (factor <= 0){
            throw new IllegalArgumentException("Scaling factor must be greater than 0.");
        }
        this.radius *= factor;
    }

    @Override
    public boolean equals(Object o){
        
        if(!super.equals(o)){
            return false;
        }

        if(o instanceof Circle circle){
            return Double.compare(this.radius, circle.radius) == 0;
        }

        return false;
    }

    @Override
    public int hashCode(){
        return Objects.hash(super.hashCode(), radius);
    }
}
