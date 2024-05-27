import { LightningElement, track, api, wire} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import accinsert from '@salesforce/apex/CreateAcc.accCreate';
import coninsert from '@salesforce/apex/CreateAcc.conCreate';

export default class CreateRender extends LightningElement {
    @track Name;
    @track Email;
    @track AccId;
    @track bool=false;
    @track Lname;
    @track phno;

    NameInput(event){
        this.Name=event.target.value;

    }
    EmailInput(event){
        this.Email=event.target.value;
    }

    handleClickAcc(event){
        accinsert({
            name: this.Name, email: this.Email
        })
            .then((result) => {
                const event = new ShowToastEvent({
                    title: 'inserted account',
                    message: 'Account inserted successfully',
                    variant: 'success'
                });
                this.dispatchEvent(event);
                this.AccId=result;
            })
            .catch(error => {
                console.error('error');
            });
    }

    Rendernext(event){
        this.bool=true;
    }

    LNameInput(event){
        this.Lname=event.target.value;
    }

    PhnInput(event){
        this.phno=event.target.value;
    }

    handleClickCon(event){
        coninsert({
            Lastname: this.Lname, phone: this.phno, account:this.AccId
        })
            .then((result) => {
                const event = new ShowToastEvent({
                    title: 'inserted contact',
                    message: 'contact inserted successfully',
                    variant: 'success'
                });
                this.dispatchEvent(event);
                console.log(result);
            })
            .catch(error => {
                console.error('error');
            });
    }

}