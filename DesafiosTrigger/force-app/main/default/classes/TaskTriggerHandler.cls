public with sharing class TaskTriggerHandler {
    public static void CaseAlreadyHaveTask(List<Task> tarefaToInsert) {
            //verifica se a tarefa ja tem um caso relacionado
            List<Task> TarefasComCase = [SELECT WhatId, Subject FROM Task WHERE WhatId != null AND What.Type = 'Case'];
            Map<String,Task> mapTarefasComCase = new Map<String,Task>();
            for(Task ITarefasComCase : TarefasComCase) {
                if(!mapTarefasComCase.containsKey(ITarefasComCase.WhatId)) {
                    mapTarefasComCase.put(ITarefasComCase.WhatId, ITarefasComCase);
                }
            }
            for(Task tarefa : tarefaToInsert) {
                    if(mapTarefasComCase.containsKey(tarefa.WhatId)) {
                        tarefa.addError('Já existe uma tarefa em aberto neste caso, verifique a mesma: ' + mapTarefasComCase.get(tarefa.WhatId).Subject);             
            } 
        }
    }
}