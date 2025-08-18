trigger TaskTrigger on Task (before insert) {
    
    //Chama o handler que verifica se ja exoste tarefa para o caso]
    if(trigger.isBefore && trigger.isInsert){
        for(Task iTask : Trigger.new){
            TaskTriggerHandler.CaseAlreadyHaveTask(iTask);        
        }
        
    }
    
}