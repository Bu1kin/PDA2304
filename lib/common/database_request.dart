abstract class DataBaseRequest {

  static String deleteTable(String table) => 'drop table $table';

  static const String tableRole = 'Role_';
  static const String tableUser = 'User_';
  static const String tableCar = 'Car';
  static const String tableColor = 'Color';
  static const String tableType = 'Type_';
  static const String tableBrand = 'Brand';
  static const String tableModel = 'Model';
  static const String tableKPPType = 'KPPType';
  static const String tableCountry = 'Country';

  static const List<String> tableList = [
    tableRole,
    tableUser,
    tableCar,
    tableColor,
    tableType,
    tableBrand,
    tableModel,
    tableKPPType,
    tableCountry,
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUser,
    _createTableCar,
    _createTableColor,
    _createTableType,
    _createTableBrand,
    _createTableModel,
    _createTableKPPType,
    _createTableCountry,
  ];

      static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"name_role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

      /// Запрос для создания таблицы User
      static const String _createTableUser =
      'CREATE TABLE "$tableUser" ("id" INTEGER, "login" TEXT NOT NULL UNIQUE, "password" TEXT NOT NULL, "FIO" TEXT not null, "photo" BLOB not null, "id_role" INTEGER, FOREIGN KEY("id_role") REFERENCES "Role_"("id") ON DELETE CASCADE,PRIMARY KEY("id"))';

      static const String _createTableColor =
      'CREATE TABLE "$tableColor" ("id" INTEGER, "name_color" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

      static const String _createTableType =
      'CREATE TABLE "$tableType" ("id" INTEGER, "name_type" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

      static const String _createTableBrand =
      'CREATE TABLE "$tableBrand" ("id" INTEGER, "name_brand" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

      static const String _createTableModel =
      'CREATE TABLE "$tableModel" ("id" INTEGER, "name_model" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

      static const String _createTableKPPType =
      'CREATE TABLE "$tableKPPType" ("id" INTEGER, "name_kpp_type" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

      static const String _createTableCountry =
      'CREATE TABLE "$tableCountry" ("id" INTEGER, "name_country" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

      static const String _createTableCar =
      'CREATE TABLE "$tableCar" ("id" INTEGER, "id_color" INTEGER, "id_type" INTEGER, "id_brand" INTEGER, "id_model" INTEGER, "id_kpp_type" INTEGER, "id_country" INTEGER, "id_user" INTEGER, "weight" TEXT NOT NULL, "mileage" TEXT NOT NULL, "capacity" TEXT NOT NULL, FOREIGN KEY("id_color") REFERENCES "Color"("id") ON DELETE CASCADE, FOREIGN KEY("id_type") REFERENCES "Type_"("id") ON DELETE CASCADE, FOREIGN KEY("id_brand") REFERENCES "Brand"("id") ON DELETE CASCADE, FOREIGN KEY("id_model") REFERENCES "Model"("id") ON DELETE CASCADE, FOREIGN KEY("id_kpp_type") REFERENCES "KPPType"("id") ON DELETE CASCADE, FOREIGN KEY("id_country") REFERENCES "Country"("id") ON DELETE CASCADE, FOREIGN KEY("id_user") REFERENCES "User_"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT))';
}