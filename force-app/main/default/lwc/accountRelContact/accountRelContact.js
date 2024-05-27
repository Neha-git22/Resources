import { LightningElement, track, api, wire} from 'lwc';
import acc from '@salesforce/apex/AccIds.getAccIds';
import con from '@salesforce/apex/AccIds.getRelCon';

export default class AccountRelContact extends LightningElement {
    @track accountOptions =[];
    @track  valuesel;
    @track  tabledata1=[];
    @track  tabledata2=[];
    @track columns = [
        { label: 'Related Account Id', fieldName:'AccountId'},
        { label: 'Contact Name', fieldName:'LastName'},
        { label: 'Phone Number', fieldName:'Phone'}
    ];
    @track bool=false;
    @track bool1=false;

    handleAccInput(event){
        this.valuesel=event.target.value;
        con({ Accid : this.valuesel })
        .then( result =>{
            this.tabledata1 = result;
            this.conList = result;
        })
        .catch( error =>{
            window.alert("error:"+error)
        })    

    }
    @wire(acc)
    AccIdNames({ error, data }) {
        if (data) {
            this.accountOptions = data.map(account => ({
                label: account.Name,
                value: account.Id
            }));
            this.accountOptions.unshift({ label: 'Select an Account', value: '' });

        } else if (error) {
            console.error('Error loading Account Names:', error);
        }
    }

    
    handleDataT(event){
        this.bool=true;
           
    }

    handleCustomT(event){
        this.bool1=true;
    }

}