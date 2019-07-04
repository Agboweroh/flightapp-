

import 'package:flightapp/screens/customShapeClipper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final Color discountBackgroundColor = Color(0xFFFFE0BD);
final Color flightBorderColor = Color(0xFFE6E6E6);
final chipBackgroundColor = Color(0xFFF6F6F6);
 final formatCurrency = NumberFormat.simpleCurrency();
 final ThemeData appTheme = ThemeData(primaryColor: Color(0xFFF3791A),fontFamily: "Oxygen");

 class InheritedFlightListing extends InheritedWidget{
   final String toLacation;
  final String fromLocation;
  
  InheritedFlightListing({this.toLacation,this.fromLocation,Widget child}):super(child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) =>true;
  static InheritedFlightListing of(BuildContext context)=>
  context.inheritFromWidgetOfExactType(InheritedFlightListing);
  

 }

class FlightListing extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Search Result"),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },

          child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Column(
          children: <Widget>[
            FlightListTopPart(),
            SizedBox(height: 20.0,),
 
            FlightListingBottomPart(),
          ],
        ),
      ),
    );
  }
}

class FlightListTopPart extends StatelessWidget {
   final Color firstColor = Color(0xFFF47015);
    final Color secondColor = Color(0xFFEF772C);
    
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 160.0,
             decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [firstColor,secondColor]
              )
            ),
          ),
        ),
        Column(
          
           
          children: <Widget>[
            SizedBox(height: 20.0,),
    
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0,),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 20.0),
                child: Row( 
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Text("${InheritedFlightListing.of(context).fromLocation}",style:TextStyle(fontSize: 16.0,),),
                          Divider(color: Colors.grey,height: 20.0,),
                          Text("${InheritedFlightListing.of(context).toLacation}", style: TextStyle(fontSize: 16.0 ,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.import_export,color:Colors.black, size: 32.0,))
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




class  FlightListingBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Best Deals for next 6 Months", 
            style:TextStyle(color: Colors.green,
            fontSize:16.0,fontWeight:FontWeight.bold)),
          ), 
          SizedBox(height: 10.0,),
          ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard(),
          FlightCard(),
            ],
          )
        ],
      ),
      
    );
  }
}
class FlightCard extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Stack(
            children :<Widget>[
               Container(
                 margin: EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0),),
            border: Border.all(color: flightBorderColor),
            
            
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("${formatCurrency.format(4159)}", 
                    style: TextStyle(fontWeight: FontWeight.bold ,
                    fontSize:20.0,),),
                    SizedBox(width: 4.0,),
                     Text("${(formatCurrency.format(9999))}", 
                     style: TextStyle(fontWeight: FontWeight.bold ,
                     fontSize:20.0,decoration: TextDecoration.lineThrough ,color: Colors.grey),),
                 
                  ],
                ),
                Wrap(
                  runSpacing: -8.0,
                  spacing: 8.0,
                  children: <Widget>[
                    
                    FlightDetailChip(Icons.calendar_today, "June 2019"),
                    FlightDetailChip(Icons.flight_takeoff, "Air Jet"),
                    FlightDetailChip(Icons.star, "4.5"),



                  ],
                )
              ],
              
            ),
          ),
          
                ),
                Positioned(
                  top: 10.0,
                  right: 0.0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0 ),
                                  
                    
                    child: Text("55%" , style:TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold )
                    ),
                    decoration: BoxDecoration( color: discountBackgroundColor,
                     borderRadius: BorderRadius.circular(10.0)),
                    
                  ),
                )
                 ],

                
          
          
        
      ),
    );
  }
}
class FlightDetailChip extends StatelessWidget {

  final IconData iconData;
  final String label;
  FlightDetailChip(this.iconData,this.label);
  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black,fontSize: 14.0,),
      backgroundColor: chipBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      avatar: Icon(iconData, size: 14.0,color: appTheme.primaryColor,),

      
      
    );
  }
}
  