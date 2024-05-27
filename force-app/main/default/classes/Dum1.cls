public class Dum1 {
    // ClickUp OAuth 2.0 parameters
    private static final String CLIENT_ID = 'M4N2PB0MRFCV0Q71E0GVOPTWCOW1WDIN';
    private static final String CLIENT_SECRET = 'HNJIDDG0VTQERUZBIBD6BQW86YHLIZNEOQOJZTFEVM2DZ3J9SEATAJCZWYM34QNY';
    private static final String REDIRECT_URI = 'https://login.salesforce.com'; // Replace with your Salesforce callback URL
    
    // ClickUp OAuth endpoints
    private static final String AUTHORIZATION_URL = 'https://app.clickup.com/api';
    private static final String TOKEN_ENDPOINT = 'https://api.clickup.com/api/v2/oauth/token';

    // Method to initiate ClickUp OAuth authorization flow
    public PageReference initiateAuthorization() {
        String authorizationUrl = AUTHORIZATION_URL +
                                  '?client_id=' + CLIENT_ID +
                                  '&redirect_uri=' + EncodingUtil.urlEncode(REDIRECT_URI, 'UTF-8') +
                                  '&response_type=code';
        
        // Redirect to ClickUp authorization URL
        PageReference authPage = new PageReference(authorizationUrl);
        authPage.setRedirect(true);
        return authPage;
    }

    // Method to exchange authorization code for access token
    public static void exchangeAuthorizationCode(String authorizationCode) {
        // Construct the request body for token exchange
        String requestBody = 'client_id=' + CLIENT_ID +
                             '&client_secret=' + CLIENT_SECRET +
                             '&code=' + authorizationCode +
                             '&grant_type=authorization_code' +
                             '&redirect_uri=' + EncodingUtil.urlEncode(REDIRECT_URI, 'UTF-8');
        
        // Make a POST request to the ClickUp token endpoint
        HttpRequest request = new HttpRequest();
        request.setEndpoint(TOKEN_ENDPOINT);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setBody(requestBody);
        
        // Send the request
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        // Handle the response
        if (response.getStatusCode() == 200) {
            Map<String, Object> tokenResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            
            // Extract access token from the response
            String accessToken = (String) tokenResponse.get('access_token');
            
            // You can now use this access token to make authenticated requests to ClickUp API
            System.debug('Access Token: ' + accessToken);
        } else {
            System.debug('Error: Failed to exchange authorization code for access token. Status code: ' + response.getStatusCode() + ', Response: ' + response.getBody());
        }
    }
}