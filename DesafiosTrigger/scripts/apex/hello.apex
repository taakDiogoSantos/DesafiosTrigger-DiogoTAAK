SObject[] novasTasks = new SObject[]{};
Case[] allCases = [SELECT Id FROM Case];
    for (Integer i = 0; i < allCases.size(); ++i){
        Task novaTask = new Task(Subject='Teste!',WhatId=allCases[i].Id);
        novasTasks.add(novaTask);
    }
Database.insert (novasTasks, false);