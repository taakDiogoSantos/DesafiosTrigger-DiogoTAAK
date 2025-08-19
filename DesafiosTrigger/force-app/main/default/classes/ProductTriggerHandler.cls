public with sharing class ProductTriggerHandler {
    public ProductTriggerHandler () {}
    public static void CreatePriceBookEntry(List<Product2> newProducts) {
        List<Pricebook2> StandardPricebook = [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];
        List<PricebookEntry> newPriceBookEntries = new List<PricebookEntry>();
        for(Product2 iProduto : newProducts) {
            //Cria price book para valor em real
            PricebookEntry newPriceBookEntryBRL = new PricebookEntry();
            newPriceBookEntryBRL.Pricebook2Id = StandardPricebook[0].Id;
            newPriceBookEntryBRL.Product2Id = iProduto.Id;
            newPriceBookEntryBRL.UnitPrice = 0;
            newPriceBookEntryBRL.currencyIsoCode = 'BRL';
            newPriceBookEntries.add(newPriceBookEntryBRL);

            //Cria pricebook entry para valor e dolar
            PricebookEntry newPriceBookEntryUSD = new PricebookEntry();
            newPriceBookEntryUSD.Pricebook2Id = StandardPricebook[0].Id;
            newPriceBookEntryUSD.Product2Id = iProduto.Id;
            newPriceBookEntryUSD.UnitPrice = 0;
            newPriceBookEntryUSD.currencyIsoCode = 'USD';
            newPriceBookEntries.add(newPriceBookEntryUSD);

        }

        Database.insert(newPriceBookEntries, false);
    }
}