public class ProductTriggerHandler {
    public static void CreatePriceBookEntry(List<Product2> newProducts) {
        
        List<PricebookEntry> newPriceBookEntries = new List<PricebookEntry>();
        for(Product2 iProduto : newProducts) {
            //Cria price book para valor em real
            ProductTriggerHelper.createPricebookEntryDifCurrency('BRL' ,iProduto);
            
            //Cria pricebook entry para valor e dolar
            ProductTriggerHelper.createPricebookEntryDifCurrency('USD' ,iProduto);

        }
    }
}