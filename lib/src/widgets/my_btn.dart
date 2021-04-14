import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor, textColor;
  final bool fullWidth;
  final EdgeInsets padding;

  MyBtn(
      {Key key,
      @required this.label,
      this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.fullWidth = false,
      this.padding})
      : assert(label != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 30,
      padding: EdgeInsets
          .zero, //por naturaleza tiene un padding grande y se veria el color de fondo pero si se pone zero entonces solo mirara el hijo en este caso el container, pero el container se adapta al tamano del hijo en este aso un text, por esto se le da un padding al container que hace que el borde del container se separe del texto en cuestion.
      // color: Colors.blue,
      child: Container(
        width: fullWidth ? double.infinity : null,
        padding: this.padding ?? EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: this.textColor ?? Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5),
        ),
        decoration: BoxDecoration(
          color: this.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 10, offset: Offset(0, 5)),
          ],
        ),
      ),
      onPressed: () {
        FocusScope.of(context).unfocus();
        this.onPressed();
      },
    );
  }
}
