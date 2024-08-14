import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class sqlData{

  Database? _db;
  Future<Database?> get db async{
    if(_db==null){
      _db=await initialDb();
      return _db ;
    }
    else{
      return _db;
    }
  }

  initialDb() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath , "bank.db");
    Database mydb = await openDatabase(path ,onCreate: _onCreate , version: 9, onUpgrade: _onUpgrade );
    return mydb;
  }



  _onUpgrade(Database db, int oldversion , int newversion )async{
    await db.execute('''
    ALTER TABLE `customers` ADD COLUMN email TEXT ''');
    await db.execute('''
    ALTER TABLE `customers` ADD COLUMN phone TEXT ''');
    await db.execute('''
    CREATE TABLE "transfer"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fromcustomer" Text,
    "tocustomer" TEXT, 
    "balance" REAL
    
    ) ''');
    print("Data updated *************************");
  }

  _onCreate(Database db , int version )async{
    await db.execute('''
    CREATE TABLE "customers"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" Text,
    "balance" REAL
    )
    ''');
    print("Data created*************************");

  }

  selectData(String sql )async{
    Database? mydb=await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }
  insertData(String sql )async{
    Database? mydb=await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql )async{
    Database? mydb=await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql )async{
    Database? mydb=await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }


}