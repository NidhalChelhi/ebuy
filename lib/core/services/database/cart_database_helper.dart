import 'package:ebuy/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:ebuy/constants.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'Cart.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE $tableCartProducts (
          $columnPid TEXT NOT NULL,
          $columnName TEXT NOT NULL,
          $columnImage TEXT NOT NULL,
          $columnFavourite INTEGER NOT NULL,
          $columnColor TEXT NOT NULL,
          $columnSize TEXT NOT NULL,
          $columnPrice TEXT NOT NULL,
          $columnQuantity INTEGER NOT NULL)
      ''');
    });
  }

  Future<List<CartProductModel>> getCartProducts() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCartProducts);
    List<CartProductModel> cartProducts = maps.isNotEmpty
        ? maps
            .map((cartProduct) => CartProductModel.fromJson(cartProduct))
            .toList()
        : [];

    return cartProducts;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.insert(
      tableCartProducts,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  updateProduct(CartProductModel model) async {
    var dbClient = await database;

    return await dbClient.update(
      tableCartProducts,
      model.toJson(),
      where: '$columnPid = ?',
      whereArgs: [model.pid],
    );
  }

  deleteProduct(CartProductModel model) async {
    var dbClient = await database;

    return await dbClient.rawDelete(
        "DELETE FROM $tableCartProducts WHERE $columnPid =? and $columnColor=? and $columnSize=? ",
        [model.pid, model.color, model.size]);
  }
}
