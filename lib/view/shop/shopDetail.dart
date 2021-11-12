import 'package:cooking_gas/component/general_scaffold.dart';
import 'package:cooking_gas/component/list.dart';
import 'package:flutter/material.dart';

class ShopDetail extends StatefulWidget {
  const ShopDetail({Key? key, this.detail}) : super(key: key);
  final Detail? detail;
  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget _buildProfileTopBanner() {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 4.5,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color.fromRGBO(152, 17, 109, 1),
              Color.fromRGBO(178, 39, 108, 1),
            ]),
          ),
          child: Icon(widget.detail!.image),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        title: widget.detail!.title,
        child: Column(
          children: [
            _buildProfileTopBanner(),
            TabBar(
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  text: 'processing',
                ),
                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'complete',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                // physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[Text('hello'), Text('bye')],
                controller: _tabController,
              ),
            ),
          ],
        ));
  }
}
