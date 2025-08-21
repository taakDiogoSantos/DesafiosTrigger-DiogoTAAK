public with sharing class ProductTriggerHelper {
    public static PricebookEntry createPricebookEntryDifCurrency(string moeda, Product2 product) {
        List<Pricebook2> StandardPricebook = [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];
        PricebookEntry newPriceBook = new PricebookEntry();       
        newPriceBook.IsActive = true;
        newPriceBook.Pricebook2Id = StandardPricebook[0].Id;
        newPriceBook.product2Id = product.Id;
        newPriceBook.UnitPrice = 0;
        newPriceBook.CurrencyIsoCode = moeda;
        insert newPriceBook;
        return newPriceBook;

    }
}