import 'package:flutter/material.dart';
import 'package:state_management_demo/inherited_widgets/color_inherited_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color color = Colors.red;

  void onColorChange() {
    setState(() {
      color = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorWidget(
      color: color,
      onColorChange: onColorChange,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Inherited Widget Demo",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              ColorCardWidget(key: UniqueKey()),
              ElevatedButton(
                onPressed: () => onColorChange(),
                child: const Text("Change Color"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorCardWidget extends StatelessWidget {
  const ColorCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorWidget.of(context)!.color,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 500,
      width: 500,
    );
  }
}
