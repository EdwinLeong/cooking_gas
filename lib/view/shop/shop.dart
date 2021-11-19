import 'package:cooking_gas/utils/list.dart';
import 'package:cooking_gas/view/shop/shopDetail.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          itemCount: stores.length,
          itemBuilder: (BuildContext context, int index) {
            return StoreList(stores[index]);
          },
        ),
      ),
    );
  }
}

class StoreList extends StatelessWidget {
  const StoreList(this.detail);
  final Detail detail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) {
              return ShopDetail(detail: detail);
            },
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        elevation: 3,
        child: Container(
          height: 100,
          child: Center(
            child: ListTile(
              leading: Icon(
                detail.image,
                size: 40,
              ),
              title: Text(detail.title),
              subtitle: Text(detail.subtitle),
            ),
          ),
        ),
      ),
    );
  }
}
