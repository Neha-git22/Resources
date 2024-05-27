public class WeatherController {
    public string CityName{get;set;}
    public string weatherResponseJSON{get;set;}
    
    //Define the variable to show the value on vf 
    public string humidityValue{get;set;}
    public string pressureValue{get;set;}
    public string feelsLikeTemp{get;set;}
    public string minTemp{get;set;}
    public string maxTemp{get;set;}
    public string AvgTemp{get;set;}
    
    public void GetWeatherDetails()
    {
        // Prepare the required input.
        //string endpointURL = System.Label.WeatherMapEndPoint + CityName + '&appid='+ System.Label.WeatherMapApplicationKey;
        string endpointURL ='https://api.openweathermap.org/data/2.5/weather?q='+CityName+'&appid='+System.Label.WeatherMapApplicationKey;
        system.debug('endpointURL'+endpointURL);
        Http wHttp =new Http();
        
        HttpRequest weatherRequest =new Httprequest();
        weatherRequest.setEndpoint(endpointURL);
        weatherRequest.setMethod('GET');
        weatherRequest.setTimeout(60000);
        
        HttpResponse weatherResponse = wHttp.send(weatherRequest);
        
        weatherResponseJSON = weatherResponse.getBody();
        system.debug('weatherResponseJSON:'+weatherResponseJSON);
        
    
    
    JSONParser wParser = JSON.createParser(weatherResponse.getBody());
    Map<double, string> detailMap = new Map<double, string>();
    
    string label = null;
    double version = null;
    while (wParser.nextToken() != null) {
        
        if (wParser.getCurrentToken() == JSONToken.FIELD_NAME){
            switch on wParser.getText() {
                when 'label' {
                    // Advance to the label value.
                    wParser.nextToken();
                    label = wParser.getText();
                }
                when 'version' {
                    // Advance to the version value.
                    wParser.nextToken();
                    version = Double.valueOf(wParser.getText());
                }
            }
        }
        
        if(version != null && String.isNotEmpty(label)) {
            detailMap.put(version, label);
            version = null;
            label = null; 
        }
    }
    system.debug('Release with Rainbow logo = ' +
                 detailMap);
}
}