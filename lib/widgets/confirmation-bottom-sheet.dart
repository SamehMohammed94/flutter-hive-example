import 'package:flutter/material.dart';

class ConfirmedBottomSheet extends StatefulWidget {
  final String message;
  final String closeButtonTitle;
  final String secondButtonTitle;
  final String headerTitle;
  final Function secondButtonAction;
  final Color secondButtonTextColor;

  const ConfirmedBottomSheet(
      {Key key,
      @required this.message,
      @required this.closeButtonTitle,
      @required this.secondButtonTitle,
      @required this.headerTitle,
      @required this.secondButtonAction,
      this.secondButtonTextColor})
      : super(key: key);
  @override
  _ConfirmedBottomSheetState createState() => _ConfirmedBottomSheetState();
}

class _ConfirmedBottomSheetState extends State<ConfirmedBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // header
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                  widget.headerTitle,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    child: Icon(
                      Icons.close,
                      color: Colors.black87,
                    ),
                  ),
                )
              ],
            ),
          ),

          // message

          Container(
            child: Text(widget.message,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
          ),

          // buttons
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    child: RaisedButton(
                      onPressed: () {
                        widget.secondButtonAction();
                      },
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        "Close",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
