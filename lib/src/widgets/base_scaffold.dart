import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget Function(Size size) builder;
  final Widget? bottomNavBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Key? scaffoldKey;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool safeTop;
  final bool safeBottom;
  final VoidCallback? onWillPop;
  final Widget? floatingActionButton;

  const BaseScaffold({
    Key? key,
    this.appBar,
    required this.builder,
    this.bottomNavBar,
    this.drawer,
    this.endDrawer,
    this.scaffoldKey,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.safeTop = true,
    this.safeBottom = true,
    this.onWillPop,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final constraints = Size(constraint.maxWidth, constraint.maxHeight);
        return WillPopScope(
          onWillPop: () {
            if (onWillPop != null) onWillPop!();
            return Future.value(false);
          },
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              floatingActionButton: floatingActionButton,
              backgroundColor: backgroundColor,
              key: scaffoldKey,
              appBar: appBar,
              bottomNavigationBar: bottomNavBar,
              drawer: drawer,
              endDrawer: endDrawer,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              body: SafeArea(
                top: safeTop,
                bottom: safeBottom,
                child: Builder(
                  builder: (_) => builder(constraints),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
