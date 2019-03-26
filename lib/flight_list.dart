import 'package:flutter/material.dart';
import 'custom_shape_clipper.dart';
import 'main.dart';

const TextStyle whiteTextStyle = TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold);
const TextStyle blackTextStyle = TextStyle(color: Colors.black, fontSize:16.0, fontWeight: FontWeight.bold);

final Color discountBackgroundColor = Color(0xFFFFE08D);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

class FlightListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Search Results", style: whiteTextStyle,),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 30.0,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            FlightListingScreenTopPart(),
            FlightListingScreenBottomPart(),
          ],
        ),
      ),
    );
  }
}

class FlightListingScreenTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
					clipper: CustomShapeClipper(),
					child: Container(
						height: 160,
						decoration: BoxDecoration(
							gradient: LinearGradient(
								colors: [firstColor, secondColor,],
							),
						),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 10.0,),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(locations[0], style: TextStyle(color: Colors.black, fontSize: 14.0),),
                          Divider(color: Colors.black54, height: 20.0,),
                          Text(locations[1], style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.import_export, color: Colors.black, size: 40.0,)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FlightListingScreenBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 16.0),
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Best Deals for the Next 6 Months', style: blackTextStyle,)
          ),
          SizedBox(height: 10.0,),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: PageScrollPhysics(),
            children: <Widget>[
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: flightBorderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 26.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('\$4,199', style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),),
                      SizedBox(width: 10.0),
                      Text('(\$9,999)', style: TextStyle(color: Colors.black54, fontSize: 16.0, fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough),),
                    ],
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: <Widget>[
                      FlightDetailChip(Icons.calendar_today, 'Jun 2019'),
                      FlightDetailChip(Icons.flight_takeoff, 'Air India'),
                      FlightDetailChip(Icons.star, '4.4'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
              child: Text(
                '55%', style: TextStyle(color:appTheme.primaryColor, fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: discountBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlightDetailChip extends StatelessWidget {

  final IconData iconData;
  final String label;

  FlightDetailChip(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(fontSize: 14.0, color: Colors.black),
      backgroundColor: chipBackgroundColor,
      avatar: Icon(iconData, size: 14.0,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}