import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGDynamicScaffoldWidget extends StatefulWidget {
  Widget drawer;
  Widget bottomNavigationBar;
  bool showBottonNavigationBar = false;
  PreferredSizeWidget appbar;
  Widget body;
  Widget fab;
  bool showFab = false;

  double maxWidth = 480;
  double centerColumnWidth = 390; // iPhone 12 Pro

  bool showDrawer = true;
  bool showAppbar = true;

  final String image;
  final Color? backgroundColor;

  SVGDynamicScaffoldWidget({
    required this.drawer,
    required this.bottomNavigationBar,
    required this.appbar,
    required this.body,
    required this.fab,
    this.showBottonNavigationBar = false,
    this.showFab = false,
    this.showAppbar = true,
    this.maxWidth = 600,
    this.centerColumnWidth = 420,
    this.showDrawer = true,
    this.image = "assets/background.svg",
    this.backgroundColor,
  });

  @override
  _SVGDynamicScaffoldWidgetState createState() =>
      _SVGDynamicScaffoldWidgetState();
}

class _SVGDynamicScaffoldWidgetState extends State<SVGDynamicScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > widget.centerColumnWidth) {
          return wideScaffold(widget.image);
        } else {
          return narrowScaffold(widget.image);
        }
      },
    );
  }

  Widget narrowScaffold(String image) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.showAppbar ? widget.appbar : null,
        endDrawer: widget.showDrawer ? widget.drawer : null,
        bottomNavigationBar:
            widget.showBottonNavigationBar ? widget.bottomNavigationBar : null,
        // body: widget.body,
        backgroundColor: widget.backgroundColor,
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                //width: widget.centerColumnWidth,
                //height: MediaQuery.of(context).size.height,
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widget.body
          ],
        ),
        floatingActionButton: widget.showFab ? widget.fab : null,
      ),
    );
  }

  Widget wideScaffold(String image) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.teal[200],
            ),
          ),
          Container(
            width: widget.centerColumnWidth,
            child: narrowScaffold(image),
          ),
          Expanded(
            child: Container(
              color: Colors.teal[200],
            ),
          ),
        ],
      ),
    );
  }
}
