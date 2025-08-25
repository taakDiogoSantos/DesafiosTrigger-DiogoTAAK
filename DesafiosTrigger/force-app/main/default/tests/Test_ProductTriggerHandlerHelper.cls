@isTest(SeeAllData = true)
public  class Test_ProductTriggerHandlerHelper {
    @isTest(SeeAllData = true)
    static void createTestPricebookEntry() {
        //creating a new product list
        List<Product2> listaProduto = new List<Product2>();
        
        Product2 testProduct = new Product2(Name = 'Test Product');
        insert testProduct;

        


        //creating a new Pricebook Entry
        Test.startTest();
       
        Test.stopTest();
        
        // Verify that the PricebookEntry was created
        List<PricebookEntry> pricebookEntries = [SELECT Id, Product2Id, Pricebook2Id FROM PricebookEntry];
        System.assertEquals(2, pricebookEntries.size());
    }
}