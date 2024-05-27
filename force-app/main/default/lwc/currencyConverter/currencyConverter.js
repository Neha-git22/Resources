import { LightningElement,track } from 'lwc';
import ExcAPI from '@salesforce/apex/CurrencyClass.ConvertExchangeAPI';

export default class CurrencyConverter extends LightningElement {

  sourceCurrency = '';
  targetCurrency = '';
  amount = '';
  @track output;

  get options() {
    return [
        { label: 'US Dollar', value: 'USD' },
        { label: 'Great Britian Pound', value: 'GBP' },
        { label: 'Indian Rupee', value: 'INR' }
    ];
  }

  handleSourceChange(event) {
    this.sourceCurrency = event.detail.value;
  }

  handleTargetChange(event) {
    this.targetCurrency = event.detail.value;
  }

  handleAmountChange(event) {
    this.amount = event.detail.value;
  }
  
  handleConvert(event) {
    ExcAPI({SC:this.sourceCurrency, 
              TC:this.targetCurrency, 
              amt: this.amount}).then(data => {
        this.output = data;
    })
  }
    
}