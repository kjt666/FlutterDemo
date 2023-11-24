import 'package:flutter/material.dart';
import 'package:flutter_app/third/provider/models/cart.dart';
import 'package:flutter_app/third/provider/models/catalog.dart';
import 'package:flutter_app/third/provider/screens/cart.dart';
import 'package:provider/provider.dart';

class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MyListItem(index),
            ),
          )
        ],
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Catalog", style: Theme.of(context).textTheme.displayLarge),
      floating: true,
      actions: [
        IconButton(
            onPressed: () => Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new MyCart(),
                )),
            icon: const Icon(Icons.shopping_cart))
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton(this.item);

  @override
  Widget build(BuildContext context) {
    //context.select（）方法将允许您监听对模型的*部分*的更改。您定义了一个函数来“选择”（即返回）您感兴趣的部分，
    //除非模型的特定部分发生更改，否则提供程序包不会重建此小部件。
    //这可以显著提高性能。
    var isInCart = context.select<CartModel, bool>(
      // 在这里，我们只关心[物品]是否在购物车内。
      (cart) => cart.items.contains(item),
    );
    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              //如果商品不在购物车中，我们会让用户添加它。
              //我们在这里使用context.read（），因为每当用户点击按钮时都会执行回调。换句话说，它是在build方法之外执行的。
              var cart = context.read<CartModel>();
              cart.add(item);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child: isInCart
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    //在这里，我们只对[索引]中的项目感兴趣。我们不在乎任何其他变化。
    var item = context
        .select<CatalogModel, Item>((catalog) => catalog.getByPosition(index));
    var textTheme = Theme.of(context).textTheme.titleLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(color: item.color),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                item.name,
                style: textTheme,
              ),
            ),
            const SizedBox(width: 24),
            _AddButton(item),
          ],
        ),
      ),
    );
  }
}
