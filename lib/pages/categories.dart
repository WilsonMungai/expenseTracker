import 'package:flutter/material.dart';
import '../types/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Categories extends StatefulWidget {
  // Categories({required Key key}) : super(key: key);
  const Categories({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // create some values
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  late TextEditingController _textController;

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: ("Initial Text"));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text(
            "Categories",
            style: TextStyle(color: Colors.white),
          ),
          leading: CupertinoNavigationBarBackButton(),
          backgroundColor: Colors.black,
        ),
        child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            // decoration: BoxDecoration(
            //     color: const Color.fromARGB(255, 28, 28, 30),
            //     borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  // Expanded adds spacer between column and row
                  Expanded(
                    child: CupertinoFormSection.insetGrouped(
                      children: [
                        ...List.generate(
                            5,
                            ((index) => GestureDetector(
                                  onTap: () {
                                    switch (index) {
                                      // push view
                                      case 0:
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Categories()),
                                        );
                                        break;
                                      // call alert when erase data
                                      case 1:
                                      // action
                                    }
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 16, 16, 16),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 28, 28, 30),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: CupertinoFormRow(
                                            prefix:
                                                const Text("Category name "),
                                            helper: null,
                                            child: Container()),
                                      )),
                                ))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: ((context) => AlertDialog(
                                      title:
                                          const Text('Pick a  category color'),
                                      backgroundColor: Colors.blueGrey,
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: pickerColor,
                                          onColorChanged: changeColor,
                                        ),
                                        // Use Material color picker:
                                        //
                                        // child: MaterialPicker(
                                        //   pickerColor: pickerColor,
                                        //   onColorChanged: changeColor,
                                        //   showLabel: true, // only on portrait mode
                                        // ),
                                        //
                                        // Use Block color picker:
                                        //
                                        // child: BlockPicker(
                                        //   pickerColor: currentColor,
                                        //   onColorChanged: changeColor,
                                        // ),
                                        //
                                        // child: MultipleChoiceBlockPicker(
                                        //   pickerColors: currentColors,
                                        //   onColorsChanged: changeColors,
                                        // ),
                                      ),
                                      actions: <Widget>[
                                        CupertinoButton(
                                          child: const Text('Got it'),
                                          onPressed: () {
                                            // setState(() =>
                                            //     currentColor = pickerColor);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    )),
                              );
                            },
                            // Circular button
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: pickerColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                      strokeAlign: StrokeAlign.outside)),
                            )),
                        Expanded(
                            child: CupertinoTextField(
                          controller: _textController,
                        )),
                        const Text("b")
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
