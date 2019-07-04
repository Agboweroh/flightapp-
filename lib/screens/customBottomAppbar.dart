import 'package:flutter/material.dart';
import 'myHomeScreen.dart';


class CustomAppBar extends StatelessWidget {

 final List<BottomNavigationBarItem> bottomBarItems = [];
  CustomAppBar(){
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.home,color:Colors.black),
        title: Text("Explore",style:TextStyle(color:appTheme.primaryColor ,fontSize:16.0,fontWeight:FontWeight.bold))
      ),
    );bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite,color:Colors.red),
        title: Text("WatchList",style:TextStyle(color: Colors.black,fontSize:16.0,fontWeight:FontWeight.bold))
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.details,color:Colors.purple),
        title: Text("Deals",style:TextStyle(color: Colors.black,fontSize:16.0,fontWeight:FontWeight.bold))
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications,color:Colors.green),
        title: Text("Notification",style:TextStyle(color: Colors.black,fontSize:16.0,fontWeight:FontWeight.bold))
      ),
    );
    
      

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
          child: BottomNavigationBar(items: bottomBarItems,
      type: BottomNavigationBarType.shifting,
        
      ),
    );
  }
}