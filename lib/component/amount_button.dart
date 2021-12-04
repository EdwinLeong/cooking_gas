import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountButton extends StatefulWidget {
  @override
  _AmountButtonState createState() => _AmountButtonState();
}

class _AmountButtonState extends State<AmountButton> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "0"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 30,
        // foregroundDecoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(5.0),
        //   border: Border.all(
        //     color: Colors.blueGrey,
        //     width: 2.0,
        //   ),
        // ),
        child: Row(
          children: [
            InkWell(
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
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
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
            ),
            InkWell(
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
          ],
        ),
      ),
    );
  }
}
