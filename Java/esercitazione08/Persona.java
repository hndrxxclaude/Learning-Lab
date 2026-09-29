import java.util.Objects;

public abstract class Persona {
    
    private String name;
    private int age;

    public Persona(String name, int age){
        if (name == null || name.isBlank()){
            throw new IllegalArgumentException("Invalid: insert a name.");
        }
        if (age < 0){
            throw new IllegalArgumentException("Invalid argument: age must be greater than or equal to 0.");
        }
        this.name = name;
        this.age = age;
    }

    public String getName(){
        return name;
    }

    public int getAge(){
        return age;
    }

    public void setName(String name){
        if (name == null || name.isBlank()){
            throw new IllegalArgumentException("Invalid: insert a name.");
        }
        this.name = name;
    }

    public void setAge(int age){
        if(age < 0){
            throw new IllegalArgumentException("Invalid argument: age must be greater than or equal to 0.");
        }
        this.age = age;
    }

    @Override
    public String toString(){
        return "Name: " + name + " | Age: " + age;
    }

    @Override
    public boolean equals(Object o){
        if (this == o){
            return true;
        }
        if (o == null || getClass() != o.getClass()){
            return false;
        }
        Persona other = (Persona) o;
        return Objects.equals(name, other.name) && age == other.age;
    }

    @Override
    public int hashCode(){
        return Objects.hash(name, age);
    }
}
