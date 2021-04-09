import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:flutter_qr_reader/models/scan_model.dart';
export 'package:flutter_qr_reader/models/scan_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE SCANS(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      },
    );
  }

  Future<int> nuevoScanRaw(ScanModel scan) async {
    final id = scan.id;
    final tipo = scan.tipo;
    final valor = scan.valor;

    final db = await database;
    final res = await db.rawInsert('''
      INSERT INTO Scans(id, tipo, valor)
      VALUES ($id, '$tipo', '$valor')
    ''');
    return res;
  }

  Future<int> nuevoScan(ScanModel scan) async {
    final db = await database;
    final res = await db.insert('Scans', scan.toJson());
    return res;
  }
}
