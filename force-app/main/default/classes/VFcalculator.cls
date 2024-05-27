public class VFcalculator {
    public integer num1{set;get;}
    public integer num2{set;get;}
    public integer Value{set;get;}
    
    public void Addition(){
        Value = num1+num2;
    }
    public void Subtraction(){
        Value = num1-num2;
    }
    public void Multiplication(){
        Value = num1*num2;
    }
    public void Division(){
        Value = num1/num2;
    }
}