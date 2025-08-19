@isTest
public class TaskTriggerHandler_Test {
    @isTest
    static void testCaseAlreadyHaveTask() {
        // Create a case
        Case testCase = new Case(Subject = 'Test Case');
        insert testCase;

        // Create a task related to the case
        Task existingTask = new Task(WhatId = testCase.Id, Subject = 'Existing Task');
        insert existingTask;

        // Create a new task that should trigger the error
        Task newTask = new Task(WhatId = testCase.Id, Subject = 'New Task');

        // Call the method to check for existing tasks
        Test.startTest();
        List<Task> tasksToInsert = new List<Task>{newTask};
        TaskTriggerHandler.CaseAlreadyHaveTask(tasksToInsert);
        Test.stopTest();

        // Verify that an error was added to the new task
        System.assertEquals(1, tasksToInsert.size());
        System.assertEquals('Já existe uma tarefa em aberto neste caso, verifique a mesma: Existing Task', tasksToInsert[0].getErrors()[0].getMessage());
    }
}