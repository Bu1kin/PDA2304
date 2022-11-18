import 'dart:io';
import 'package:flutter_application_1/common/database_request.dart';
import 'package:flutter_application_1/data/model/user.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../data/model/role.dart';


class DataBaseHelper{

  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database dataBase;
  late final Database _sqfdb;
  final int _version = 1;

  Future<void> init() async{
    _appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory.path, 'carmarket.db');

    if(Platform.isLinux || Platform.isWindows || Platform.isMacOS){
      sqfliteFfiInit();
      _sqfdb = await databaseFactoryFfi.openDatabase(
        _pathDB,
        options: OpenDatabaseOptions(
          onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
          version: _version,
          onCreate: (db, version) async {
            await onCreateTable(db);
          }
        )
      );
    }
    else{
      dataBase = await openDatabase(
        _pathDB,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
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
    await onInitTable(db);
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('select name from sqlite_master');

    for(var table in DataBaseRequest.tableList){
      if(tables.contains(table)){
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    
    for (var i = 0; i < DataBaseRequest.tableList.length; i++){
      await db.execute(DataBaseRequest.tableCreateList[i]);
    }
  }

  Future<void> onInitTable(Database db) async {
    //try{
      db.insert(DataBaseRequest.tableRole, Role(name_role: 'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(name_role: 'Пользователь').toMap());

      db.insert(DataBaseRequest.tableUser, User(login: 'admin', password: 'admin', FIO: 'Админов Админ Админович', id_role: RoleEnum.admin).toMap());

      print("12312312312312313123");
    //} on DatabaseException catch(e){}
  }

  Future<void> onDropDataBase(Database db) async {
    try{
      await db.close();
      
      for(var i = 0; i < DataBaseRequest.tableList.length; i++){
        await db.delete(DataBaseRequest.tableList[i]);
      }
    } on DatabaseException catch(e){}
  }
}