public class ClickButtonController {
    
    public static void Redirect(){
        //String clID='M4N2PB0MRFCV0Q71E0GVOPTWCOW1WDIN';
        //String clSEC='HNJIDDG0VTQERUZBIBD6BQW86YHLIZNEOQOJZTFEVM2DZ3J9SEATAJCZWYM34QNY';
        //String red='login.salesforce.com';
        //PageReference redirectPage = new PageReference('https://app.clickup.com/api?client_id='+clID+'&redirect_uri='+red);
        //redirectPage.setRedirect(true);
        //redirectPage.getParameters().put('param', 'value');
        // Get the current page URL
        String currentPageUrl = ApexPages.currentPage().getUrl();
        
        // Redirect to the desired URL
        System.debug(currentPageUrl);
        
        // You can also pass parameters to the redirected page
        
        
        
    }

}