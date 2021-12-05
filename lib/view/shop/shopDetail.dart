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

  // Widget _buildBottomBar() {
  //   return BottomAppBar(
  //     child: Padding(
  //       padding: const EdgeInsets.all(10),
  //       child: OutlinedButton(
  //         style: OutlinedButton.styleFrom(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20.0)),
  //         ),
  //         child: Text(
  //           'Display Amount',
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             // Color.fromRGBO(152, 17, 109, 1),
  //             fontWeight: FontWeight.bold,
  //             fontSize: 15,
  //           ),
  //         ),
  //         onPressed: () {},
  //       ),
  //     ),
  //   );
  // }
  Widget _buildBottomBar() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
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

  Widget gasList() {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return CollapsingScaffold(
      title: 'Store List',
      backgroundImage: widget.detail!.image,
      bottomBar: _buildBottomBar(),
      firstTab: 'Sell',
      secondTab: 'Lead',
      firstBody: gasList(),
      secondBody: gasList(),
    );
  }
}
