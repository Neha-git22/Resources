import { LightningElement, track } from 'lwc';

export default class StringRev extends LightningElement {
    @track inputString = '';
    @track revString = '';
    @track result = '';

    handleInputChange(event) {
        this.inputString = event.target.value;
        //textarea.value='';
    }
    reverseClick(event){
        this.revString = this.inputString.split('').reverse().join('');
    }
    palindromeClick(event){
        //const sanitizedString = this.inputString.toLowerCase().replace(/[^a-z0-9]/g, '');
        //onst revString = sanitizedString.split('').reverse().join('');
        if(this.revString===this.inputString){
            this.result = 'it is Palindrome';
        }
        else{
            this.result = 'it is not Palindrome';
    }
}
}


//this.revString.localeCompare(this.inputString)>0