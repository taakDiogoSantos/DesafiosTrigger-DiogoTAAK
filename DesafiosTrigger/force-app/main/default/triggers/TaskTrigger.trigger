trigger TaskTrigger on Task (before insert) {
    
    if(trigger.isBefore && trigger.isInsert){
        //Chama o handler que verifica se ja exoste tarefa para o caso]
        TaskTriggerHandler.CaseAlreadyHaveTask(Trigger.new);        
    }
        
}
    
