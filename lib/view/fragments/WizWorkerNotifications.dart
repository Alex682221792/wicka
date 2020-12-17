import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmello/model/DropdownItem.dart';
import 'package:kmello/model/ServicePrice.dart';
import 'package:kmello/resources/styles/text-styles.dart';
import 'package:kmello/resources/values/strings.dart';
import 'package:kmello/view/widgets/BasicActions.dart';
import 'package:kmello/view/widgets/DropDownBottomList.dart';
import 'package:kmello/view/widgets/ServiceRow.dart';

class WizWorkerNotifications extends StatefulWidget {
  double height = 0.0;
  VoidCallback postContinue;

  WizWorkerNotifications({this.height, this.postContinue});

  @override
  WizWorkerNotificationsState createState() => new WizWorkerNotificationsState(
      height: this.height, postContinue: postContinue);
}

class WizWorkerNotificationsState extends State<WizWorkerNotifications> {
  double height = 0.0;
  VoidCallback postContinue;
  // final LoginController _loginController = Get.put(LoginController());
  List<DropdownItem> items = [
    DropdownItem(id: "a", description: "opcion a"),
    DropdownItem(id: "b", description: "opcion b"),
    DropdownItem(id: "c", description: "opcion bec")
  ];

  List<DropdownItem> selectedItems = [];
  List<ServicePrice> servicesList = [];
  List<ServiceRow> servicesWidgetsList = [];

  WizWorkerNotificationsState({this.height, this.postContinue});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Opacity(
                opacity: 0.75,
                child: Image.asset(
                  "assets/step_1.png",
                  height: 150.0,
                  width: 150.0,
                )),
            right: 10.0,
            bottom: 10.0),
        SizedBox(height: this.height),
        SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  Text(Strings.notificationsStep,
                      style: TextStyles.sectionTitleStyle),
                  SizedBox(height: 30),
                  DropDownBottomList(
                    label: Strings.selectService,
                    options: items,
                    onSelectItem: (DropdownItem item) {
                      this.addService(item);
                    },
                  ),
                  Container(
                      height: 200.0,
                      child: ListView(
                        key: Key(servicesWidgetsList.length.toString()),
                        children: servicesWidgetsList,
                      )),
                  BasicActionsButton(onStepContinue: () {
                    this.postContinue();
                  })
                ])))
      ],
    );
  }

  void addService(DropdownItem item) {
    var srvPrice =
        ServicePrice(id: item.id, name: item.description, price: 0.0);
    this.servicesList.add(srvPrice);
    setState(() {
      var numberRow = servicesWidgetsList.length;
      servicesWidgetsList.add(ServiceRow(
          background: numberRow % 2 == 0 ? Colors.white : Colors.transparent,
          showPrice: false,
          servicePrice: srvPrice,
          onDeleteItem: removeService));
    });
  }

  void removeService(String idItem) {
    setState(() {
      servicesWidgetsList
          .removeWhere((element) => element.servicePrice.id == idItem);
      var i = 0;
      servicesWidgetsList.forEach((element) {
        element.background = i % 2 == 0 ? Colors.white : Colors.transparent;
        i++;
      });
      servicesList.removeWhere((element) => element.id == idItem);
    });
  }
}
