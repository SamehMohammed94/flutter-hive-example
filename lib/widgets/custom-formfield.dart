import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String title;
  final int maxLen;
  final String suffexText;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final bool withprefix;
  final bool withsuffex;
  final bool isPassword;
  final bool mulitLine;
  final Function validator;
  final Function onChange;

  const CustomTextField(
      {Key key,
      this.controller,
      this.hint,
      this.mulitLine: false,
      this.keyboardType,
      this.prefixIcon,
      this.withprefix: false,
      this.withsuffex: true,
      this.suffexText,
      this.validator,
      this.maxLen,
      this.isPassword: false,
      this.title,
      this.onChange})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title == null
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      // fontWeight: FontWeight.w600
                    ),
                  )),
          Container(
            // height: 55,
            child: TextFormField(
              onChanged: widget.onChange,
              minLines: widget.mulitLine ? 5 : 1,
              maxLines: widget.mulitLine ? null : 1,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              validator: widget.validator,
              controller: widget.controller,
              maxLength: widget.maxLen ?? null,
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword ? _obsecureText : false,
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  fontSize: 15.0,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: new BorderSide(color: Colors.grey[300])),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.red)),
                hintText: widget.hint,
                hintStyle: TextStyle(fontSize: 16.0, color: Color(0xffD6D6D6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
