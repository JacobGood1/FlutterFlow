// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:rive/rive.dart';

class Achim extends StatefulWidget {
  final double? width;
  final double? height;
  final String? currentState;
  final bool? test; // Declaration of the test property
//
  const Achim({
    super.key,
    this.width,
    this.height,
    // required this.shades,
    required this.currentState,
    //required this.fullbody,
    //required this.transparent,
    this.test, // Added the missing test property
  });

  @override
  State<Achim> createState() => _AchimState();
}

class _AchimState extends State<Achim> {
  SMITrigger? _idle;

  // SMITrigger? _hold;
  // SMITrigger? _remove;
  // SMITrigger? _talk;
  // SMIBool? _shades; // Boolean for Sunglasses
  // SMIBool? _fullbody; // Boolean for Full Body
  // SMIBool? _transparent; // Boolean for Background transparency
  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    if (controller != null) {
      artboard.addController(controller);
      _idle = controller.findSMI('Trigger 1') as SMITrigger?;

      // Bind the booleans
      //  _shades?.value = widget.shades;
      //_fullbody?.value = widget.fullbody;
      //_transparent?.value = widget.transparent;
      // Trigger the current animation
      _triggerCurrentAnimation(widget.currentState);
    }
  }

  void _triggerCurrentAnimation(String? state) {
    _idle?.fire();
  }

  @override
  void didUpdateWidget(covariant Achim oldWidget) {
    super.didUpdateWidget(oldWidget);
    _triggerCurrentAnimation(widget.currentState);
    if (widget.currentState != oldWidget.currentState) {}
    // if (widget.shades != oldWidget.shades) {
    //   _shades?.value = widget.shades;
    // }
    // if (widget.fullbody != oldWidget.fullbody) {
    //   _fullbody?.value = widget.fullbody;
    // }
    // if (widget.transparent != oldWidget.transparent) {
    //   _transparent?.value = widget.transparent;
    // }
  }

  @override
  Widget build(BuildContext context) {
    // Default to loading from assets if `test` is null or false
    final child = RiveAnimation.asset(
      'assets/rive_animations/rocket_ship.riv',
      fit: BoxFit.fitHeight,
      onInit: _onRiveInit,
    );

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose of any resources if needed
  }
}
