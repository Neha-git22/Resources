import { LightningElement } from 'lwc';

export default class Lwcfirstproject extends LightningElement {
    num1;
    num2;

    result=0;

    input1(event){
        this.num1=event.detail.value;
    }

    input2(event){
        this.num2=event.detail.value;
    }

    Add(event){
        this.result=parseInt(this.num1)+parseInt(this.num2);

    }

    Subtract(event){
        this.result=parseInt(this.num1)-parseInt(this.num2);

    }

    Divide(event){
        this.result=parseInt(this.num1)/parseInt(this.num2);

    }

    Multiply(event){
        this.result=parseInt(this.num1)*parseInt(this.num2);

    }

    Modulo(event){
        this.result=parseInt(this.num1)%parseInt(this.num2);

    }

}