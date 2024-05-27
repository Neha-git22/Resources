public class VFlwcgenerate {
    
    public String di { get; set; }
    public String name { get; set; }

    public VFlwcgenerate() {
        // Retrieve parameters from URL
        di = ApexPages.currentPage().getParameters().get('label');
        name = ApexPages.currentPage().getParameters().get('value');
    }

}