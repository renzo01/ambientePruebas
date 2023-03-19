@isTest
public class AnimalLocatorTest {
    @isTest static void AnimalLocatorMock(){
        Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
        String response = AnimalLocator.getAnimalNameById(1);
        String expected = 'chicken';
        System.assertEquals(expected, response);
    }
}