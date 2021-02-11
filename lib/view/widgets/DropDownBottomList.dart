import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/model/DropdownItem.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/strings.dart';

class DropDownBottomList extends StatefulWidget {
  String label = "";
  List<DropdownItem> options = [];

  DropDownBottomList({this.label, this.options, this.onSelectItem});
  void Function(DropdownItem) onSelectItem;

  @override
  DropDownBottomListState createState() => new DropDownBottomListState(
      label: this.label,
      options: this.options,
      onSelectItem: this.onSelectItem);
}

class DropDownBottomListState extends State<DropDownBottomList> {
  String label = "";
  String chosenText = "";
  List<Widget> optionsWidget;
  List<DropdownItem> options = [];
  List<DropdownItem> filteredOptions = [];
  void Function(DropdownItem) onSelectItem;

  DropDownBottomListState({this.label, this.options, this.onSelectItem});

  @override
  Widget build(BuildContext context) {
    this.loadOptionWidget();
    return Container(
        child: GestureDetector(
            child: TextField(
              controller: TextEditingController(text: chosenText),
              enabled: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyles.textFieldStyle,
              cursorColor: Colores.primary,
              decoration:
                  Decorations.dropdownInputDecoration(label: this.label),
            ),
            onTap: () {
              showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  context: context,
                  backgroundColor: Colores.primaryBackground,
                  builder: (BuildContext context) {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width,
                            minHeight: MediaQuery.of(context).size.height,
                          ),
                          child: IntrinsicHeight(
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                color: Colors.transparent,
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(this.label,
                                            style: TextStyles.titleStyle),
                                        Divider(
                                          height: 2.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: TextField(
                                            autofocus: false,
                                            onChanged: (value) =>
                                                filterOptions(value),
                                            decoration: InputDecoration(
                                                labelText: "Buscar",
                                                suffixIcon: Icon(Icons.search)),
                                          ),
                                        ),
                                        ...optionsWidget
                                      ],
                                    ))),
                          ),
                        ),
                      ),
                    );
                  });
            }));
  }

  void filterOptions(String text) {
    if (text.isEmpty) {
      this.filteredOptions = this.options;
    } else {
      this.filteredOptions = this
          .options
          .where((element) =>
              element.description.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    this.loadOptionWidget();
  }

  void loadOptionWidget() {
    setState(() {
      if (optionsWidget == null) {
        this.filteredOptions = this.options;
      }
      this.optionsWidget = [];
      this.filteredOptions.forEach((option) {
        this.optionsWidget.add(GestureDetector(
            onTap: () {
              setState(() {
                this.chosenText = option.description;
                this.onSelectItem(option);
              });
              Navigator.pop(context);
            },
            child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.transparent,
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Text(option.description, style: TextStyles.normalStyle)
                ]))));
      });
    });
  }
}
