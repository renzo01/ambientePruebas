public class AnimalsCallouts {
    public static HttpResponse makeGetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setHeader('Content-Type', 'application/json;charset=utf-8');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        //verify status code
        if(response.getStatusCode() == 200){
            //Cast response
            Map<String,Object> results =(Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            //Cast the values in the 'animals' key list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Recived the following animals');
            for(Object animal: animals){
                System.debug(animal);
            }
        }
        return response;
    }
    public static HttpResponse makePostCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=utf-8');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() != 201){
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        }else{
            System.debug(response.getBody());
        }
        return response;
    }
}