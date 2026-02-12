import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/ui/widgets/actions/BlaButton.dart';

class Blabuttontestscreen extends StatelessWidget{
  const Blabuttontestscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("button testing"),),
    body:Column(
      children: [
        Blabutton(text: "Request to book", type: ButtonType.primary, icon: Icons.message, onPressed: ()=>print("muy muy")),
        const SizedBox(height: 30,),
        Blabutton(text: "Request to book", type: ButtonType.secondary, icon: Icons.message, onPressed: ()=>print("muy muy")),
      ],
    ) ,);
  }
}