import 'package:flutter/material.dart';

class CollapsingScaffold extends StatefulWidget {
  const CollapsingScaffold({
    required this.title,
    this.firstTab,
    this.firstBody,
    this.secondTab,
    this.secondBody,
    this.bottomBar,
    required this.backgroundImage,
  });

  final String title;
  final String? firstTab;
  final Widget? firstBody;
  final String? secondTab;
  final Widget? secondBody;
  final Widget? bottomBar;
  final IconData? backgroundImage;

  @override
  _CollapsingScaffoldState createState() => _CollapsingScaffoldState();
}

class _CollapsingScaffoldState extends State<CollapsingScaffold>
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color.fromRGBO(152, 17, 109, 1),
              Color.fromRGBO(178, 39, 108, 1),
            ]),
          ),
          child: Icon(widget.backgroundImage),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.bottomBar,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    background: _buildProfileTopBanner()),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        child: Text(
                          widget.firstTab!,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Tab(
                        child: Text(
                          widget.secondTab!,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: false,
              ),
            ];
          },
          body: TabBarView(
            // physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              widget.firstBody!,
              widget.secondBody!,
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
