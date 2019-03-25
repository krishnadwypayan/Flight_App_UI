import 'package:flutter/material.dart';
import 'main.dart';

class CustomAppBar extends StatelessWidget {

	final List<BottomNavigationBarItem> navBarItems = [];
	var navBarTitleTextStyle = TextStyle(color: Colors.red, fontSize: 12.0, fontWeight: FontWeight.bold);

	CustomAppBar() {
		navBarItems.add(
			BottomNavigationBarItem(
				icon: Icon(Icons.home, color: appTheme.primaryColor,),
				title: Text('Explore', style: TextStyle(color: appTheme.primaryColor, fontSize: 10.0, fontWeight: FontWeight.bold),),
			)
		);
		navBarItems.add(
			BottomNavigationBarItem(
				icon: Icon(Icons.favorite, color: Colors.black,),
				title: Text('Watchlist', style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.normal),),
			)
		);
		navBarItems.add(
			BottomNavigationBarItem(
				icon: Icon(Icons.local_offer, color: Colors.black,),
				title: Text('Deals', style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.normal),),
			)
		);
		navBarItems.add(
			BottomNavigationBarItem(
				icon: Icon(Icons.notifications, color: Colors.black,),
				title: Text('Notifications', style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.normal),),
			)
		);
	}

	@override
	Widget build(BuildContext context) {
		return Material(
			elevation: 15.0,
			child: BottomNavigationBar(
				items: navBarItems,
				type: BottomNavigationBarType.fixed,
			),
		);
	}
}