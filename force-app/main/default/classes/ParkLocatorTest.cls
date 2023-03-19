@isTest
public class ParkLocatorTest {
	 @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String x = 'Yellowstone';
        List<String> result = ParkLocator.country(x);
        string resultstring = string.join(result,',');
        System.assertEquals('USA', resultstring); 
    }
}