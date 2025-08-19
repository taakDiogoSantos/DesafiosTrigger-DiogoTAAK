List<Task> tarefas = new List<Task>();
List<Case> casesToInsert = [SELECT Id FROM Case WHERE Status = 'closed'];

      Task task = new Task();
      task.Subject = 'Novo Teste Task ' + 0;
      task.Status = 'Not Started';
      task.Priority = 'Normal';
      task.WhatId = '500aj00001C0C4zAAF';
      tarefas.add(task);

      Task task1 = new Task();
      task1.Subject = 'Novo Teste Task ' + 1;
      task1.Status = 'Not Started';
      task1.Priority = 'Normal';
      task1.WhatId = '500aj00001Arh2pAAB';
      tarefas.add(task1);
    

    Database.insert (tarefas, false);