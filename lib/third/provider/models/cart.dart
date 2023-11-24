import 'package:flutter/foundation.dart';
import 'package:flutter_app/third/provider/models/catalog.dart';

class CartModel extends ChangeNotifier{
  /// The private field backing [catalog].
  /// 支持[目录]的专用字段。
  late CatalogModel _catalog;

  /// Internal, private state of the cart. Stores the ids of each item.
  /// 购物车的内部私有状态。存储每个项目的ID。
  final List<int> _itemIds = [];

  /// The current catalog. Used to construct items from numeric ids.
  /// 当前目录。用于从数字ID构造项。
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    //通知侦听器，以防新目录提供的信息与前一目录不同。例如，某个项目的可用性可能已更改。
    notifyListeners();
  }

  /// List of items in the cart.
  ///购物车中的项目列表。
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  /// The current total price of all items.
  /// 当前所有项目的总价。
  int get totalPrice => items.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  /// 将[项目]添加到购物车。这是从外部修改购物车的唯一方法。
  void add(Item item){
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that depend on it.
    // 这一行告诉[Model]它应该重建依赖它的小部件。
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    // Don't forget to tell dependent widgets to rebuild _every time_ you change the model.
    // 不要忘记告诉依赖的小部件在每次更改模型时重新构建。
    notifyListeners();
  }
}