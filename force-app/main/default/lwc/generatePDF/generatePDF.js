import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { loadScript } from 'lightning/platformResourceLoader';
//import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import getaccounts from '@salesforce/apex/Generate.getRecords';
import jsPDF from '@salesforce/resourceUrl/LWCgenerated';

export default class GeneratePDF extends NavigationMixin(LightningElement){
    Date1=new Date();
    Date2=new Date();
    records=[];
    
    
	//headers = this.createHeaders(["Id","Name","Phone"]);

	//jsPDFInitialized = false;

    // renderedCallback(){
    //     if (!this.jsPDFInitialized) {
	// 		this.jsPDFInitialized = true;
	// 		loadScript(this, jsPDF)
	// 			.then(() => {
	// 				console.log('jsPDF library loaded successfully');
	// 			})
	// 			.catch((error) => {
	// 				console.error('Error loading jsPDF library', error);
	// 			});
	// 	}
    //     // console.log(this.contact.data);
    //     //loadScript(this, JS_PDF ).then(() => {});
    //     // if (this.jsPdfInitialized) {
    //     //     return;
    //     // }
    //     // this.jsPdfInitialized = true;
        
	// 	//Promise.all(loadScript(this,JS_PDF));
		
    // }

    // Generate(rec){
        
    //     // const { jsPDF } = window.jspdf;
    //     // const doc = new jsPDF();
    //     // console.log("hee");
    //     // doc.text("Account Data", 20, 20);
    //     // doc.table(rec, 30, 30);
    //     // doc.save("generatedPDF.pdf");
    //     // this[NavigationMixin.Navigate]({
    //     //     type: 'standard__webPage',
    //     //     attributes: {
    //     //         url: '/apex/vf page name'
    //     //     }
    //     // })
    //     if (this.jsPDFInitialized) {
	// 		// Make sure to correctly reference the loaded jsPDF library.
	// 		const doc = new window.jspdf.jsPDF();

	// 		// Add content to the PDF.
	// 		doc.text('Account Data', 10, 10);
    //         console.log('lineeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    //         doc.table(30, 30, JSON.stringify(this.records), this.headers, { autosize:true 
    //         });
	// 		// Save the PDF.
	// 		doc.save('generated_pdf.pdf');
	// 	} else {
	// 		console.error('jsPDF library not initialized');
	// 	}

    // }

	handleClick(event){
		getaccounts({D1:this.Date1 ,D2:this.Date2})
            .then((data) => {
                if (data != null) {
					
                    this.records = data.map(rec =>({
                    label: rec.Id,
                    value: rec.Name
                }));
                    console.log(this.records);
                    
                }
            })
            .catch((error) => {
                console.log('error while fetch acc');
            });

            const url = `/apex/lwcpdf?id=${data.label}&name=${data.value}`;
        
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: url
            }
        });
	}

    // createHeaders(keys) {
    //     var result = [];
    //     for (var i = 0; i < keys.length; i += 1) {
    //         result.push({
    //            id: keys[i],
    //            name: keys[i],
    //            prompt: keys[i],
    //            width: 65,
    //            align: "center",
    //            padding: 0
    //        });
    //    }
    //     return result;
    //    }

    handleDate1(event){
       this.Date1=event.target.Date;
    }

    handleDate2(event){
        this.Date2=event.target.Date;
    }

}