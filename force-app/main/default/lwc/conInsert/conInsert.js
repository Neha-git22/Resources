import { LightningElement, track, api, wire} from 'lwc';
import con from '@salesforce/apex/CreateCon.CreateContact';
import acc from '@salesforce/apex/CreateCon.GetAccRecords';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ConInsert extends LightningElement {
    @track FirstName='';
    @track LastName='';
    @track PhNumber='';
    @track Bdate='';
    @track options=[];
    @track accname;
    slectedAcc='select an Account';


    FnameInput(event){
        this.FirstName=event.target.value;
    }
    LnameInput(event){
        this.LastName=event.target.value;
    }
    phnoInput(event){
        this.PhNumber=event.target.value;
    }
    dateInput(event){
        this.Bdate=event.target.value;
    
    }

    @wire(acc)
    AccIdNames({ error, data }) {
        if (data) {
            this.options = data.map(account => ({
                label: account.Name,
                value: account.Id
            }));
            //this.accountOptions.unshift({ label: 'Select an Account', value: '' });

        } else if (error) {
            console.error('Error loading Account Names:', error);
        }
    }

    handleClick() {
        con({
            nameF: this.FirstName, nameL: this.LastName, Phnum: this.PhNumber, Bdate:this.Bdate
        })
            .then(() => {
                const event = new ShowToastEvent({
                    title: 'inserted contact',
                    message: 'Contact inserted successfully',
                    variant: 'success',
                });
                this.dispatchEvent(event);
            })
            .catch(error => {
                console.error(error.body.message);
            });
        }
    
}