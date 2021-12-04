import 'package:cooking_gas/component/amount_button.dart';
import 'package:cooking_gas/component/collapsing_scaffold.dart';
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

class _ShopDetailState extends State<ShopDetail> {
  Widget lendImg() {
    return SvgPicture.asset(
      'assets/gas_img.svg',
      width: 50,
      height: 50,
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          ),
          child: Text(
            'Display Amount',
            textAlign: TextAlign.center,
            style: TextStyle(
              // Color.fromRGBO(152, 17, 109, 1),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CollapsingScaffold(
      title: 'Store List',
      backgroundImage: widget.detail!.image,
      bottomBar: BottomAppBar(child: _buildBottomBar()),
      firstTab: 'Sell',
      secondTab: 'Lead',
      secondBody: Center(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  color: Colors.green,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(
                        children: [
                          lendImg(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('24 KG Gas'),
                                  Text(
                                    'RM 20',
                                  ),
                                  // AmountButton(),
                                  Flex(
                                    direction: Axis.horizontal,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      AmountButton(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      ),
      firstBody: Center(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  color: Colors.green,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(
                        children: [
                          lendImg(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('24 KG Gas'),
                                  Text(
                                    'RM 20',
                                  ),
                                  // AmountButton(),
                                  Flex(
                                    direction: Axis.horizontal,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      AmountButton(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      ),
    );
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: Colors.blueGrey,
              width: 2.0,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  child: Icon(
                    Icons.remove,
                    size: 18.0,
                  ),
                  onTap: () {
                    int currentValue = int.parse(_controller.text);
                    setState(() {
                      print("Setting state");
                      currentValue--;
                      _controller.text = (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                    });
                  },
                ),
              ),
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
              Expanded(
                flex: 2,
                child: InkWell(
                  child: Icon(
                    Icons.add,
                    size: 18.0,
                  ),
                  onTap: () {
                    int currentValue = int.parse(_controller.text);
                    setState(() {
                      currentValue++;
                      _controller.text =
                          (currentValue).toString(); // incrementing value
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
