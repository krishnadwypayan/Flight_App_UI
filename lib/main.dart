import 'package:flutter/material.dart';
import 'custom_shape_clipper.dart';
import 'customAppBar.dart';
import 'flight_list.dart';

void main() => runApp(new MaterialApp(
	title: "Flight List Mock Up",
	debugShowCheckedModeBanner: false,
	home: HomeScreen(),
	theme: appTheme,
));

Color firstColor = Color(0xfff47D15);
Color secondColor = Color(0xFFEF772C);

ThemeData appTheme = ThemeData(
	primaryColor: Color(0xFFF3791A),
	fontFamily: 'Oxygen'
);

List<String> locations = ["Boston (BOS)", "New York City (JFK)"];
const TextStyle dropdownLocationsStyle1 = TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropdownLocationsStyle2 = TextStyle(color: Colors.black, fontSize: 16.0);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
		body: SingleChildScrollView(
			scrollDirection: Axis.vertical,
			child: Column(
				children: <Widget>[
					_HomeScreenTopPart(),
					homeScreenBottomPart,
				],
			),
		),	
		bottomNavigationBar: CustomAppBar(),
    );
  }
}

class _HomeScreenTopPart extends StatefulWidget {
  @override
  __HomeScreenTopPartState createState() => __HomeScreenTopPartState();
}

class __HomeScreenTopPartState extends State<_HomeScreenTopPart> {

	var selectedLocationState = 0;
	bool isSelected = true;

	_topLocationPopupMenu() {
		return PopupMenuButton(
			onSelected: (index) {
				setState(() {
					selectedLocationState = index;
				});
			},
			child: Row(
				children: <Widget>[
					Text(
						locations[selectedLocationState],
						style: TextStyle(color: Colors.white, fontSize: 16.0),
					),
					Icon(Icons.keyboard_arrow_down, color: Colors.white,)
				],
			),
			itemBuilder: (BuildContext context) => <PopupMenuItem<int>>  [
				PopupMenuItem(
					child: Text(locations[0], style: dropdownLocationsStyle2,),
					value: 0,
				),
				PopupMenuItem(
					child: Text(locations[1], style: dropdownLocationsStyle2,),
					value: 1,
				),
			],
		);
	}

  @override
  Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				ClipPath(
					clipper: CustomShapeClipper(),
					child: Container(
						height: 400,
						decoration: BoxDecoration(
							gradient: LinearGradient(
								colors: [firstColor, secondColor,],
							),
						),
						child: Column(
							children: <Widget>[
								SizedBox(height: 45.0,),
								Padding(
									padding: const EdgeInsets.only(left: 16.0, right: 16.0),
									child: Row(
										children: <Widget>[
											Icon(
												Icons.location_on, 
												color: Colors.white,
											),
											SizedBox(width: 16.0,),
											_topLocationPopupMenu(),
											Spacer(),
											Icon(
												Icons.settings, 
												color: Colors.white,
											),
										],
									),
								),
								SizedBox(height: 30.0,),
								Text(
									"Where would\nyou like to go?",
									style: TextStyle(color: Colors.white,fontSize: 28.0, fontWeight: FontWeight.bold),
									textAlign: TextAlign.center,
								),
								SizedBox(height: 30.0,),
								Padding(
									padding: EdgeInsets.symmetric(horizontal: 32.0),
									child: Material(
										elevation: 5.0,
										borderRadius: BorderRadius.all(Radius.circular(30.0)),
										child: TextField(
											controller: TextEditingController(
												text: locations[1]
											),
											style: dropdownLocationsStyle2,
											cursorColor: appTheme.primaryColor,
											decoration: InputDecoration(
												border: InputBorder.none,
												contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
												suffixIcon: Material(
													elevation: 2.0,
													borderRadius: BorderRadius.all(Radius.circular(30.0)),
													child: InkWell(
                            child: Icon(Icons.search, color: Colors.black,),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => FlightListingScreen()
                              ));
                            },
                          ),
												),
											),
										),
									),
								),
								SizedBox(height: 20.0,),
								Row(
									mainAxisSize: MainAxisSize.min,
									mainAxisAlignment: MainAxisAlignment.spaceAround,
									children: <Widget>[
										InkWell(
											onTap: () {
												setState(() {
												  isSelected = true;
												});
											},
											child: ChoiceChip(icon: Icons.flight_takeoff, text: 'Flights', isSelected: isSelected,)
										),
										SizedBox(width: 20.0,),
										InkWell(
											child: ChoiceChip(icon: Icons.hotel, text: 'Hotels', isSelected: !isSelected),
											onTap: () {
												setState(() {
												  isSelected = false;
												});
											},
										),
								],
							),
						],
					),
			  ),
			),
		],
	);
  }
}

class ChoiceChip extends StatefulWidget {

	final IconData icon;
	final String text;
	final bool isSelected;

	ChoiceChip({this.icon, this.text, this.isSelected});

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
	return Container(
		padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
		decoration: widget.isSelected ? BoxDecoration(
			color: Colors.white.withOpacity(0.15),
			borderRadius: BorderRadius.all(Radius.circular(20.0)),
		) : null,
	  child: Row(
	  	mainAxisSize: MainAxisSize.min,
	  	mainAxisAlignment: MainAxisAlignment.spaceBetween,
	  	children: <Widget>[
	  		Icon(
	  			widget.icon,
	  			size: 20.0,
	  			color: Colors.white,
	  		),
	  		SizedBox(
	  			width: 8.0,
	  		),
	  		Text(
	  			widget.text,
	  			style: TextStyle(
	  				color: Colors.white,
	  				fontSize: 16.0,
	  			),
	  		),
	  	],
	  ),
	);
  }
}

var viewAllItemsTextStyle = TextStyle(color: appTheme.primaryColor, fontSize: 14.0);

var homeScreenBottomPart = Column(
	children: <Widget>[
		Padding(
			padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
			child: Row(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					SizedBox(width: 16.0,),
					Text('Currently Watched Items', style: dropdownLocationsStyle2,),
					Spacer(),
					Text('VIEW ALL(12)', style: viewAllItemsTextStyle,),
				],
			),
		),
		Container(
			height: 240.0,
			child: ListView(
				scrollDirection: Axis.horizontal,
				children: cityCards,
		  	),
		),
	],
);

List<CityCard> cityCards = [
	CityCard("assets/athens.jpg", "Athens", "Feb 2019", "45", "4299", "2250"),
	CityCard("assets/sydney.jpg", "Sydney", "Apr 2019", "25", "5000", "3750"),
	CityCard("assets/vegas.jpg", "Las Vegas", "Jun 2019", "30", "10000", "7000")
];

class CityCard extends StatelessWidget {
	final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;

	CityCard(this.imagePath, this.cityName, this.monthYear, this.discount, this.oldPrice, this.newPrice);

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 8.0),
			child: Column(
				children: <Widget>[
					ClipRRect(
						borderRadius: BorderRadius.all(Radius.circular(10.0)),
						child: Stack(
							children: <Widget>[
								Container(
									height: 210.0,
									width: 160.0,
									child: Image.asset(imagePath, fit: BoxFit.cover,),
								),
								Positioned(
									left: 0.0,
									bottom: 0.0,
									height: 80.0,
									width: 160.0,
									child: Container(
										decoration: BoxDecoration(
											gradient: LinearGradient(
												begin: Alignment.bottomCenter,
												end: Alignment.topCenter,
												colors: [
													Colors.black, Colors.black12
												],
											)
										),
									),
								),
								Positioned(
									left: 10.0,
									bottom: 10.0,
									right: 10.0,
									child: Row(
										mainAxisSize: MainAxisSize.max,
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: <Widget>[
											Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: <Widget>[
													Text(
														cityName,
														style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0,)
													),
													Text(
														monthYear,
														style: TextStyle(color: Colors.white, fontSize: 14.0,)
													),
												],
											),
											Container(
												padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.all(Radius.circular(20.0)),
												),
												child: Text(
													"$discount%",
													style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold)
												),
											),
										],
									),
								)
							],
						),
					),
					Row(
						mainAxisSize: MainAxisSize.max,
						mainAxisAlignment: MainAxisAlignment.start,
						children: <Widget>[
							SizedBox(width: 5.0,),
							Text(
								"\$$newPrice",
								style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
							),
							SizedBox(width: 15.0),
							Text(
								"\$($oldPrice)",
								style: TextStyle(color: Colors.black26, fontSize: 14.0, fontWeight: FontWeight.normal, ),
							),
						],
					),
				],
			),
		);
	}
}