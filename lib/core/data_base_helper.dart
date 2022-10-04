import 'dart:io';
import 'package:flutter_application_1/common/database_request.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DataBaseHelper{

  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database dataBase;
  final int _version = 1;

  Future<void> init() async{
    _appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'booksstore.db');

    if(Platform.isLinux || Platform.isWindows || Platform.isMacOS){

    }
    else{
      dataBase = await openDatabase(
        _pathDB,
        version: _version,
        onCreate: (db, version) async {
          await onCreateTable(db);
        },
      );
    }
  }


  Future<void> onCreateTable(Database db)async{
    for(var i = 0; i < DataBaseRequest.tableList.length; i++){
      await db.execute(DataBaseRequest.tableCreateList[i]);
    }
  }
}