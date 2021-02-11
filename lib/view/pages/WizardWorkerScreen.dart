import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/resources/styles/gradients.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/view/fragments/WizWorkerFinancial.dart';
import 'package:wicka/view/fragments/WizWorkerIntroduction.dart';
import 'package:wicka/view/fragments/WizWorkerLocation.dart';
import 'package:wicka/view/fragments/WizWorkerNotifications.dart';
import 'package:wicka/view/fragments/WizWorkerSkills.dart';
import 'package:wicka/view/widgets/ClipperSignUp.dart';
import 'package:wicka/view/widgets/StepItem.dart';

class WizardWorkerScreen extends StatefulWidget {
  @override
  _WizardWorkerState createState() => new _WizardWorkerState();
}

class _WizardWorkerState extends State<WizardWorkerScreen> {
  double currentStep = 1.0;
  bool complete = false;
  List<Widget> steps = [];

  next() {
    currentStep + 1.0 != 6.0
        ? goTo(currentStep + 1.0)
        : setState(() => complete = true);
  }

  goTo(double step) {
    setState(() => currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    double heightSteps = MediaQuery.of(context).size.height -
        (20.0 +
            MediaQuery.of(context).size.width * 0.025 +
            MediaQuery.of(context).size.height * 0.25);
    this.steps = [
      WizWorkerNotifications(
        height: heightSteps,
        postContinue: next,
      ),
      WizWorkerSkills(
        height: heightSteps,
        postContinue: next,
      ),
      WizWorkerLocation(
        height: heightSteps,
        postContinue: next,
      ),
      WizWorkerFinancial(
        height: heightSteps,
        postContinue: next,
      ),
      WizWorkerIntroduction(
        height: heightSteps,
        postContinue: next,
      )
    ];
    return new Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(gradient: Gradients.wavesGradient),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Center(
                          child: Hero(
                              tag: 'logo',
                              child:
                                  Image.asset("assets/iso_kmello_white.png")))
                    ],
                  ),
                ),
                clipper: ClipperSignUp(),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(color: Colores.primary, height: 2.0),
                  Row(children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                    StepItem(
                        index: 1.0,
                        currentIndex: currentStep,
                        icon: Icons.star,
                        size: MediaQuery.of(context).size.width * 0.1),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    StepItem(
                        index: 2.0,
                        currentIndex: currentStep,
                        icon: Icons.handyman,
                        size: MediaQuery.of(context).size.width * 0.1),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    StepItem(
                        index: 3.0,
                        currentIndex: currentStep,
                        icon: Icons.location_on,
                        size: MediaQuery.of(context).size.width * 0.1),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    StepItem(
                        index: 4.0,
                        currentIndex: currentStep,
                        icon: Icons.attach_money,
                        size: MediaQuery.of(context).size.width * 0.1),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    StepItem(
                        index: 5.0,
                        currentIndex: currentStep,
                        icon: Icons.portrait,
                        size: MediaQuery.of(context).size.width * 0.1)
                  ])
                ],
              ),
              this.steps[(this.currentStep - 1).toInt()]
            ]))));
  }
}
