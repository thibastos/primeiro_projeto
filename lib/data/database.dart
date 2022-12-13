import 'package:path/path.dart';
import 'package:primeiro_projeto/components/task.dart';
import 'package:primeiro_projeto/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    version: 1,
  );
}

save(Task tarefa) async {}
Future<List<Task>> findAll() async {}
Future<List<Task>> find(String nomeDaTarefa) async {}
delete(String nomeDaTarefa) async {}