public class Square extends Rectangle{
    
    public Square(double side){
        super(side, side);
    }

    public Square(String color, boolean filled, double side){
        super(color, filled, side, side);
    }

    public double getSide(){
        return getWidth();
    }

    public void setSide(double side){
        if (side <= 0){
            throw new IllegalArgumentException("Side must be greater than 0.");
        }
        setWidth(side);
        setLength(side);
    }

    @Override
    public String toString(){
        return "Square | " + super.toString().replace("Rectangle | ", "");
    }
}
