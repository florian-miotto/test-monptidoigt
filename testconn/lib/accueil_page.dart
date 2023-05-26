import 'package:flutter/material.dart';
// import 'package:flutter_files/index.dart';
//import 'package:geolocator/geolocator.dart';
void main() {
  runApp(MaterialApp(home: AccueilPage()));
}


class AccueilPage extends StatefulWidget {
  static const String routeName = '/accueil';

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Center(
          ),
          FadeAppBarTutorial(),
        ],
      ),
      extendBody: true,
    bottomNavigationBar: 
    

      TransparentBtmNavBarCurvedFb1(),
    
    );
  }
}

class FadeAppBarTutorial extends StatefulWidget {
  const FadeAppBarTutorial({Key? key}) : super(key: key);

  @override
  State<FadeAppBarTutorial> createState() => _FadeAppBarTutorialState();
}

class _FadeAppBarTutorialState extends State<FadeAppBarTutorial> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Container(
          // Place as the child widget of a scaffold
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
           
          ),
          child: Stack(
            children: [
              CustomScrollView(
                //------------------------------------------------------------------- >> test de contenu scrollable
  controller: _scrollController,
  slivers: [
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            height: 100,
            color: Color.fromARGB(255, 89, 183, 233),
            child: Text('Élément $index'),
          );
        },
        childCount: 50, 
      ),
    ),
  ],
),

              PreferredSize(
                  child: FadeAppBar(scrollOffset: _scrollControllerOffset),
                  preferredSize: Size(MediaQuery.of(context).size.width, 20.0))
            ],
          ), // Place child here
        ));
  }
}

class FadeAppBar extends StatelessWidget {
  final double scrollOffset;
  const FadeAppBar({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 24.0,
          ),
          color: Color.fromARGB(255, 235, 253, 250)
              .withOpacity((scrollOffset / 50).clamp(0, 1).toDouble()),
          child: SafeArea(child: SearchInput()),
        ));
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0.5,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
          decoration: const InputDecoration(
            // prefixIcon: Icon(Icons.email),
            
            suffixIcon: Icon(Icons.search, size: 16, color: Color.fromARGB(244, 9, 160, 115)),
            filled: true,
            fillColor: Colors.white,
            
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            border: OutlineInputBorder(
              //border color :

              borderSide: BorderSide(color: Colors.white, width: 1.0),

              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(244, 9, 160, 115), width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          onChanged: (value) {
            
          },
        ));
  }
}
// No state included
class TransparentBtmNavBarCurvedFb1 extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  TransparentBtmNavBarCurvedFb1(
      {this.primaryColor = const Color.fromARGB(255, 13, 136, 99),
      this.secondaryColor = Colors.white,
      Key? key})
      : backgroundColor = Colors.black.withOpacity(.5),
        super(
          key: key,
        );

  @override
  _TransparentBtmNavBarCurvedFb1State createState() =>
      _TransparentBtmNavBarCurvedFb1State();
}

class _TransparentBtmNavBarCurvedFb1State
    extends State<TransparentBtmNavBarCurvedFb1> {
  //- - - - - - - - - instructions - - - - - - - - - - - - - - - - - -
  // WARNING! MUST ADD extendBody: true; TO CONTAINING SCAFFOLD
  //
  // Instructions:
  //
  // add this widget to the bottomNavigationBar property of a Scaffold, along with
  // setting the extendBody parameter to true i.e:
  //
  // Scaffold(
  //  extendBody: true,
  //  bottomNavigationBar: BottomNavBarCurvedFb1()
  // )
  //
  // Properties such as color and height can be set by changing the properties at the top of the build method
  //
  // For help implementing this in a real app, watch https://www.youtube.com/watch?v=C0_3w0kd0nc. The style is different, but connecting it to navigation is the same.
  //
  //- - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    final primaryColor = widget.primaryColor;
    final secondaryColor = widget.secondaryColor;
    final backgroundColor = widget.backgroundColor;

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: BottomNavCurvePainter(backgroundColor: Colors.white),
          ),
          Center(
            heightFactor: 0.1,
            child: FloatingActionButton(
                backgroundColor: primaryColor,
                child: const Icon(Icons.add),
                elevation: 0.3,
                onPressed: () {}),
          ),
          SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "Home",
                  icon: Icons.home_outlined,
                  selected: true,
                  onPressed: () {},
                  defaultColor: Colors.black,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "like",
                  icon: Icons.favorite_outline,
                  selected: false,
                  onPressed: () {},
                  defaultColor: Colors.black,
                  selectedColor: primaryColor,
                ),
                const SizedBox(width: 46),
                NavBarIcon(
                    text: "ring",
                    icon: Icons.notifications_none_outlined,
                    selected: false,
                    onPressed: () {},
                    defaultColor: Colors.black,
                    selectedColor: primaryColor),
                NavBarIcon(
                  text: "profil",
                  icon: Icons.person_3_outlined,
                  selected: false,
                  onPressed: () {},
                  selectedColor: primaryColor,
                  defaultColor: Colors.black,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor =  Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 0);

    double insetCurveBeginnningX = size.width / 1.95 - insetRadius;
    double insetCurveEndX = size.width / 2.05 + insetRadius;

    path.lineTo(insetCurveBeginnningX, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, 100 / 36);

    path.arcToPoint(Offset(insetCurveEndX, 100 / 36), 
        radius: Radius.circular(insetRadius / 2), clockwise: false);

    path.quadraticBezierTo(insetCurveEndX, 0, insetCurveEndX, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 100);
    path.lineTo(0, 100);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


//-------------------------------------------------- icons de la nav bar
class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color.fromARGB(255, 34, 87, 104),
      this.defaultColor = const Color.fromARGB(255, 0, 0, 0)})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Color.fromARGB(255, 0, 0, 0),
          icon: Icon(
            icon,
            size: 30,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}