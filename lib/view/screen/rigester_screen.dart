import 'package:flutter/material.dart';
import 'package:iiii/view/widget/register_widget.dart';

class RigeterScreen extends StatelessWidget {
  const RigeterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(child: SingleChildScrollView(child: RigeterWidget(context))),
    );
  }
}
