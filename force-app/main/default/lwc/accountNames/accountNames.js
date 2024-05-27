import { LightningElement, track, wire } from 'lwc';
import getaccounts from '@salesforce/apex/accountR.getAccRecords';
import editaccounts from '@salesforce/apex/accountR.editAcc';

export default class AccountNames extends LightningElement {
    @track records = []; 
    columns = []; 
    totalRecords = 0; 
    pageSize=5; 
    totalPages; 
    pageNumber = 1;     
    @track recordsToDisplay = []; 
    @track editval;
    
    get bDisableFirst(){
        return this.pageNumber == 1;
    }
    get bDisableLast(){
        return this.pageNumber == this.totalPages;
    }

    get options() {
        return [
            { label: 5, value: 5 },
            { label: 10, value: 10 },
            { label: 20, value: 20 },
        ];
    }
    
    
    connectedCallback(){
        
        this.columns = [
            { label:'Account Name', fieldName:'Name',editable:'true'},
            { label:'Phone Number', fieldName:'Phone',editable:'true'},
            { label:'Email Id', fieldName:'Email__c',editable:'true'},
            { label:'Rating', fieldName:'Rating',editable:'true'}
        ];
        
        getaccounts()
            .then((data) => {
                if (data != null) {
                    //console.log('data= ' + JSON.stringify(data));
                    this.records = data;
                    //this.options=[5,10,20];
                    this.totalRecords = data.length;                  
                    this.pageSize =5; 
                    this.pagination();  
                }
            })
            .catch((error) => {
                console.log('error while fetch acc');
            });
    }

    handleSave(event){
        this.editval = event.detail.draftValues;
        //console.log(this.editval[0].Name);
        editaccounts({i:this.editval[0].Id, N:this.editval[0].Name, P:this.editval[0].Phone, E:this.editval[0].Email__c, R:this.editval[0].Rating})
            .then( ()=> {
              console.log('edited');
            })
            .catch((error) => {
                console.log('error while fetch acc');
            });
    }

    handleTableclick(event){
        console.log('helakdhfi');
    }

    handleSize(event){
        this.pageSize = event.detail.value;
        this.pagination();

    }
    
    previousPage() {
        this.pageNumber = this.pageNumber - 1;
        this.pagination();
    }
    nextPage() {
        this.pageNumber = this.pageNumber + 1;
        this.pagination();
    }
    firstPage() {
        this.pageNumber = 1;
        this.pagination();
    }
    lastPage() {
        this.pageNumber = this.totalPages;
        this.pagination();
    }
    
    pagination() {
        this.recordsToDisplay = [];
        
        this.totalPages = Math.ceil(this.totalRecords / this.pageSize);
         
        if (this.pageNumber <= 1) {
            this.pageNumber = 1;
        } else if (this.pageNumber >= this.totalPages) {
            this.pageNumber = this.totalPages;
        }
        
        for (let i = (this.pageNumber - 1) * this.pageSize; i < this.pageNumber * this.pageSize; i++) {
            if (i === this.totalRecords) {
                break;
            }
            this.recordsToDisplay.push(this.records[i]);
            
        }
        //console.log(recordsToDisplay[1]);
    }
}