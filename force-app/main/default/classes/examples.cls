@isTest
public with sharing class examples {
    @IsTest
    static void methodName(){
        FakeProd product = new FakeProd();
        product.name = 'PlayStation 5';
        product.sku = '1215124312231';
        product.tipo = 'Electrodomestico';

        Boolean result = false;

        List<String> tiposPermitidos = new List<String>{'Electrodomestico','gaming'};

        Test.startTest();
        if (tiposPermitidos.contains(product.tipo)) {
            result = true;
        }
        Test.stopTest();
        system.assertEquals(true, result);
    }


    public with sharing class FakeProd {
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public String sku {get;set;}
        @AuraEnabled
        public String tipo {get;set;}
    }
}