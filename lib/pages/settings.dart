import 'package:flutter/material.dart';
import '../types/widgets.dart';
import 'package:expensetracker/pages/categories.dart';
import 'package:flutter/cupertino.dart';

class Item {
  final String label;
  final bool isDestructive;

  // constrcutor
  const Item(this.label, this.isDestructive);
}

const items = [
  Item('Categories', false),
  Item('Erase All Data', true),
];

class Settings extends WidgetWithTitle {
  const Settings({super.key}) : super(title: "Settings");

  void handleEraseData() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      // color: Colors.green,
      child: Column(
        children: [
          Container(
              height: 150,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 28, 28, 30),
                  borderRadius: BorderRadius.circular(20)),
              child: CupertinoFormSection.insetGrouped(
                children: [
                  ...List.generate(
                      items.length,
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
                                  _showAlertDialog(context);
                              }
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 16),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 28, 28, 30),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: CupertinoFormRow(
                                    prefix: Text(
                                      items[index].label,
                                      style: TextStyle(
                                          color: items[index].isDestructive
                                              ? Colors.red
                                              : Colors.white),
                                    ),
                                    helper: null,
                                    child: items[index].isDestructive
                                        ? Container()
                                        : const Icon(
                                            Icons.keyboard_arrow_right_sharp),
                                  ),
                                )),
                          )))
                ],
              )),
          // const Text("Settings"),
        ],
        // height: double.maxFinite,
      ),
    );
  } // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('This action cannot be reversed!'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Erase Data'),
          ),
        ],
      ),
    );
  }

  // ListView(
  //   children: [
  //     ListTile(
  //         title: const Text("Categories"),
  //         trailing: const Icon(Icons.keyboard_arrow_right_sharp),
  //         onTap: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => const Categories()),
  //           );
  //         }),
  //     ListTile(
  //       title: const Text(
  //         "Erase all data",
  //         style: TextStyle(color: Colors.red),
  //       ),
  //       onTap: handleEraseData,
  //     ),
  //   ],
  // ),

  // showAlertDialog(BuildContext context) {
  //   // create alertdialog
  //   AlertDialog alert = const AlertDialog(
  //     title: Text("Simple Alert"),
  //     content: Text("This is an alert message"),
  //     actions: [
  //       // action
  //     ],
  //   );

  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return alert;
  //       });
  // }

}
