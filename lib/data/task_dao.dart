import 'package:primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

import '../components/task.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
}

save(Task tarefa) async {}
Future<List<Task>> findAll() async {
  print("acessando o find all");

  final Database bancoDeDados = await getDatabase();
  final List<Map<String, dynamic>> result =
      await bancoDeDados.query(TaskDao._tablename);

  print('Encontrado seguintes dados: $result');

  return toList(result);
}

List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
  print('Convertendo o toList');
  final List<Task> tarefas = [];

  for (Map<String, dynamic> linha in mapaDeTarefas) {
    final Task tarefa = Task(linha[TaskDao._name], linha[TaskDao._image],
        linha[TaskDao._difficulty]);
    tarefas.add(tarefa);
  }
  print('Lista de Tarefas: $tarefas');
  return tarefas;
}

Future<List<Task>> find(String nomeDaTarefa) async {
  print('Acessando o find');

  final Database bancoDeDados = await getDatabase();
  final List<Map<String, dynamic>> result = await bancoDeDados.query(
    TaskDao._tablename,
    where: '$TaskDao._name = ?',
    whereArgs: [nomeDaTarefa],
  );

  print('Tarefa encontrada: $toList(result)');
  return toList(result);
}

delete(String nomeDaTarefa) async {}
