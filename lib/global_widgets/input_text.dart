import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class InputText extends StatefulWidget {
  final Widget? prefixIcon;
  final String Function(String)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? labelText;

  const InputText({
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.labelText,
  });
  @override
  InputTextState createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  String _errorText = '';
  bool? _obscureText;
 

  String get errorText => _errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;

   }

 
  void _validate(String text) {
   _errorText = widget.validator!(text);
   setState(() {});
   if (_errorText == '') {
      widget.onChanged!(text);
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        style:  TextStyle(color: Colors.white),
        onChanged: _validate,
        obscureText: _obscureText!,
        onSubmitted: widget.onSubmitted,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        
        decoration: InputDecoration(
          errorText: _errorText==''?null:_errorText,
          labelStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          labelText: widget.labelText,
          enabledBorder:  UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
        ),
      ),
    );
  }
}
