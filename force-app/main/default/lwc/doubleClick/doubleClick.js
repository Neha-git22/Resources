import { LightningElement,track } from 'lwc';
import saveAcc from '@salesforce/apex/accountR.saveAccounts';
import getAcc from '@salesforce/apex/accountR.getAccRecords';

export default class DoubleClick extends LightningElement {
  
  @track isEdited = false;
  @track toggleSaveLabel = 'Save';
  @track records = [];

  handleNameChange(event) {
    let element = this.records.find(ele  => ele.Id === event.target.dataset.id);
    element.Name = event.target.value;
    this.records = [...this.records];
    console.log(JSON.stringify(this.records));
  }

  handlePhoneChange(event){
    let element = this.records.find(ele  => ele.Id === event.target.dataset.id);
    element.Phone = event.target.value;
    this.records = [...this.records];
    console.log(JSON.stringify(this.records));

  }

  handleEmailChange(event){
    let element = this.records.find(ele  => ele.Id === event.target.dataset.id);
    element.Email__c = event.target.value;
    this.records = [...this.records];
    console.log(JSON.stringify(this.records));

  }

  handleSave() {
    this.toggleSaveLabel = 'Saving...'
    let toSaveList = this.records;
    toSaveList.forEach((element, index) => {
        if(element.Name === ''){
            toSaveList.splice(index, 1);
        }
    });

    this.records = toSaveList;
    saveAcc({records : toSaveList})
    .then(() => {
        this.toggleSaveLabel = 'Saved';
        
        this.dispatchEvent(
            new ShowToastEvent({
                title : 'Success',
                message : 'records saved successfuly',
                variant : 'success',
            }),
        )
        this.getAccountRecords();
        this.isEdited = false;
        this.error = undefined;
    })
    .catch(error => {
        this.error = error;
        this.record = undefined;
        console.log("Error in Save call back:", this.error);
    })
    .finally(() => {
        setTimeout(() => {
            this.toggleSaveLabel = 'Save';
        }, 3000);
    });
}

  connectedCallback() {
    this.getAccountRecords();
  }

getAccountRecords() {
    getAcc()
    .then((result) => {
      if (result != null) {
        console.log('RESULT--> ' + JSON.stringify(result));
        this.record = result;
        this.records = this.record;
        this.error = undefined;
          }
        })
        
        .catch(error => {
            this.error = error;
            this.record = undefined;
        });
}

onDoubleClickEdit() {
    this.isEdited = true;
}

handleCancel() {
    this.isEdited = false;
  }
}