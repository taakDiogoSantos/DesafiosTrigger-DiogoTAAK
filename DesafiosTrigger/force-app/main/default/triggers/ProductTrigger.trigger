trigger ProductTrigger on Product2 (after insert) {
 if(Trigger.isAfter && Trigger.isInsert)
    ProductTriggerHandler.CreatePriceBookEntry(Trigger.New);
}