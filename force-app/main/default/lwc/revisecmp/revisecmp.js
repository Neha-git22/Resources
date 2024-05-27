import { LightningElement ,track} from 'lwc';

export default class Revisecmp extends LightningElement {

    @track Name='Amudapuram Neha';
    @track txt='';
    @track show='';
    
    getInp(event){
        this.txt=event.target.value;
    }
    handleClick(event){
        this.show=this.txt;
    }

    handleClickL(event){
        let A='Let A';
        this.show=A;
        console.log(A);
    }
    
    handleClickC(event){
        const B='new';
        //B=this.txt;
        console.log(B);
    }

    handleClickV(event){
        var C=this.txt;
        console.log(C);
    }


}