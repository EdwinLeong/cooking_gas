import 'package:cooking_gas/component/general_scaffold.dart';
import 'package:cooking_gas/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ShopDetail extends StatefulWidget {
  const ShopDetail({Key? key, this.detail}) : super(key: key);
  final Detail? detail;
  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController textController = TextEditingController();
  int _itemCount = 0;

  @override
  void initState() {
    super.initState();

    textController.text = 0.toString();
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

  Widget addValue() {
    return Row(
      children: [
        _itemCount != 0
            ? new IconButton(
                icon: new Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    _itemCount--;
                    textController.text = "${_itemCount.toString()}";
                  });
                })
            : new Container(),
        Container(
          width: 200,
          child: TextField(
            style: const TextStyle(color: Colors.black),
            controller: textController,
            onChanged: (value) {
              textController.text = value;
            },
            enableInteractiveSelection: false,
            // maxLength: 5,
            maxLines: 1,
            keyboardType: TextInputType.number,
            // onChanged: _bloc.setOMNo,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              hintText: 'Or enter a value',
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              ),
              counterText: '',
              filled: true,
              fillColor: Colors.grey[200],
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
        IconButton(
            icon: new Icon(Icons.add),
            onPressed: () {
              setState(() {
                _itemCount++;
                textController.text = "${_itemCount.toString()}";
              });
            })
      ],
    );
  }

  Widget lendImg() {
    return SvgPicture.asset(
      'assets/gas_img.svg',
      width: 40,
      height: 40,
    );
  }

  Widget sellValue() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              color: Colors.green,
              child: Container(
                height: 200,
                child: Row(
                  children: [
                    lendImg(),
                    Column(
                      children: [
                        Text('hello'),
                        Text('bye'),
                      ],
                    )
                  ],
                ),
              ));
        });
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
                  child: Text(
                    'Sell',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                // second tab [you can add an icon using the icon property]
                Tab(
                  child: Text(
                    'Lend',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
            Flexible(
              child: TabBarView(
                // physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  addValue(),
                  sellValue(),
                  // NumberInputWithIncrementDecrement()
                ],
                controller: _tabController,
              ),
            ),
          ],
        ));
  }
}

// class ListTileItem extends StatefulWidget {
//   @override
//   _ListTileItemState createState() => new _ListTileItemState();
// }

// class _ListTileItemState extends State<ListTileItem> {
//   int _itemCount = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         _itemCount != 0
//             ? new IconButton(
//                 icon: new Icon(Icons.remove),
//                 onPressed: () => setState(() => {_itemCount--}),
//               )
//             : new Container(),
//         new Text(_itemCount.toString()),
//         new IconButton(
//             icon: new Icon(Icons.add),
//             onPressed: () => setState(() => _itemCount++))
//       ],
//     );
//   }
// }

class NumberInputWithIncrementDecrement extends StatefulWidget {
  @override
  _NumberInputWithIncrementDecrementState createState() =>
      _NumberInputWithIncrementDecrementState();
}

class _NumberInputWithIncrementDecrementState
    extends State<NumberInputWithIncrementDecrement> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "0"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Field increment decrement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: 60.0,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Colors.blueGrey,
                width: 2.0,
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    controller: _controller,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: true,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                Container(
                  height: 38.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 18.0,
                          ),
                          onTap: () {
                            int currentValue = int.parse(_controller.text);
                            setState(() {
                              currentValue++;
                              _controller.text = (currentValue)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 18.0,
                        ),
                        onTap: () {
                          int currentValue = int.parse(_controller.text);
                          setState(() {
                            print("Setting state");
                            currentValue--;
                            _controller.text =
                                (currentValue > 0 ? currentValue : 0)
                                    .toString(); // decrementing value
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
