import 'package:flutter/material.dart';
import 'package:myapp/ui/theme/theme.dart';

enum ButtonType { primary, secondary }

class Blabutton extends StatelessWidget {
  final String text;
  final ButtonType type;
  final IconData? icon;
  final VoidCallback? onPressed;

  const Blabutton({
    super.key,
    required this.text,
    required this.type,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // set background color with buttontype
    Color backgroundColor = type == ButtonType.primary
        ? BlaColors.primary
        : BlaColors.backgroundAccent;
            // set border style color with buttontype
    BorderSide borderStyle = type == ButtonType.primary
        ? BorderSide.none
        : BorderSide(color: BlaColors.greyLight);
         // set text color style  with buttontype
    Color textColor = type == ButtonType.primary
        ? BlaColors.white
        : BlaColors.primary;
         // set icon style color with buttontype
    Color iconColor = type == ButtonType.primary
        ? BlaColors.white
        : BlaColors.primary;
         // set text style  with buttontype
    Text textStyle = Text(
      text,
      style: BlaTextStyles.button.copyWith(color: textColor),
    );
    //create lable
    Widget content = icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20,color: iconColor,),
              const SizedBox(width: BlaSpacings.s),
              textStyle,
            ],
          )
        : textStyle;
        // create button and put lable in Column
    Widget blaButton = OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: BlaSpacings.m),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BlaSpacings.radius)
        )
      ),
      child: content,
    );
    return SizedBox(
  width: double.infinity,
  child: blaButton,);
  }
}
