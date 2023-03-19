public class AnimalLocator {
    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        String animalName = '';
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        HttpResponse res = http.send(req);
        if(res.getStatusCode() == 200){
        	JsonOutput result = (JsonOutput) JSON.deserialize(res.getBody(), JsonOutput.class);
            animalName = result.animal.name;
        }
        return animalName;
    }
    
    public class Animal{
        public Integer id;
        public String name;
        public String eats;
        public String says;
    }
    public class JsonOutput{
        public Animal animal;
    }
}