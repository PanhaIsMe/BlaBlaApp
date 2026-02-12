import 'package:flutter/material.dart';
import 'package:myapp/ui/theme/theme.dart';

class RidePrefFormInput extends StatelessWidget {
  final VoidCallback onclick;
  final String text;
  final IconData mainIcon;
  final bool initText;
  final IconData? subIcon;
  final VoidCallback? onSubIconClick;
  const RidePrefFormInput({
    super.key,
    required this.onclick,
    required this.text,
    required this.mainIcon,
    this.initText = false,
    this.subIcon,
    this.onSubIconClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(mainIcon, size: 20),
      title: initText
          ? Text(text, style: BlaTextStyles.button.copyWith(color: BlaColors.textNormal))
          : Text(text, style: BlaTextStyles.button.copyWith(color: BlaColors.textNormal)),
    onTap: () => onclick,
    trailing: GestureDetector(child: Icon(subIcon,size: 20,),onTap: () => onSubIconClick,),
    );
  }
}
