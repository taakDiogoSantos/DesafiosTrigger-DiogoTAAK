public with sharing class TaskTriggerHandler {
    public TaskTriggerHandler() {

    }

    public static void CaseAlreadyHaveTask(Task tarefa) {
            //verifica se a tarefa ja tem um caso relacionado
            List<Task> tarefas = [SELECT Id FROM Task WHERE WhatId = :tarefa.WhatId AND Id != :tarefa.Id];
            if(tarefas.size() > 0) {
                tarefa.addError('Já existe uma tarefa em aberto neste caso, verifique a mesma: ');
            }
    }
}