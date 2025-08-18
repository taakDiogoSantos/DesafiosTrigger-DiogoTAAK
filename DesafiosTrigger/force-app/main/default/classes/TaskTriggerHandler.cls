public with sharing class TaskTriggerHandler {
    public TaskTriggerHandler() {

    }

    public static void CaseAlreadyHaveTask(List<Task> tarefaToInsert) {
            //verifica se a tarefa ja tem um caso relacionado
            List<Task> tarefasTarefasComCase = [SELECT WhatId FROM Task WHERE WhatId != null AND What.Type = 'Case'];
            
            for(Task tarefa : tarefaToInsert) {
                for(Task iTarefaComCase : tarefasTarefasComCase) {
                    if(tarefa.WhatId == iTarefaComCase.WhatId) {
                        tarefa.addError('Já existe uma tarefa em aberto neste caso, verifique a mesma: ');                    
                    }
            }
             
        }
    }
}