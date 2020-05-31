import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

import '../widgets/ProductsGrid.dart';

enum FilterOptions { Favourite, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavourite = false;

  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.All) {
                    _showOnlyFavourite = false;
                  } else {
                    _showOnlyFavourite = true;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text("Only Favourite"),
                        value: FilterOptions.Favourite),
                    PopupMenuItem(
                        child: Text("Show All"), value: FilterOptions.All),
                  ])
        ],
      ),
      body: ProductsGrid(_showOnlyFavourite),
    );
  }
}
