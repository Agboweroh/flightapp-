import 'package:flightapp/screens/customBottomAppbar.dart';
import 'package:flightapp/screens/customShapeClipper.dart';
import 'package:flightapp/screens/flight_List.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Column(
children: <Widget>[
  HomeScreenTopPart(),
   homeScreenBottomPart,
  
  
],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
 List<String> locations = ["Boston (BOS)", "New York City (JFK)", "Ben Gurion(Tel Aviv)"];
 final _searchFieldController =TextEditingController(text :(locations[1]));
   
    final ThemeData appTheme = ThemeData(primaryColor: Color(0xFFF3791A),fontFamily: "Oxygen");

const TextStyle dropDownLabelstyle =  TextStyle(fontSize: 16.0,color:Colors.white,fontWeight:FontWeight.w400);
const TextStyle dropDownMenuItemstyle =  TextStyle(fontSize: 14.0,color:Colors.black,fontWeight:FontWeight.w700);


class HomeScreenTopPart extends StatefulWidget {
  
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;
  var isFlightSelected = true;
   final ThemeData appTheme = ThemeData(primaryColor: Color(0xFFF3791A),fontFamily: "Oxygen");

  Color firstColor = Color(0xFFF47015);
    Color secondColor = Color(0xFFEF772C);
   

 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
                  child: Container(
            height: 400.0,  decoration: BoxDecoration(gradient: LinearGradient(colors: <Color>[
                firstColor,
                secondColor
            ])),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(height: 50.0,),
                      Icon(Icons.location_on, color:Colors.white),
                      SizedBox(height: 16.0,),
                      PopupMenuButton(
                        onSelected: (index){
                          setState(() {
                            selectedLocationIndex =index;

                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(locations[selectedLocationIndex], style: dropDownLabelstyle,)
                          ,
                            Icon(Icons.keyboard_arrow_down, color:Colors.white),

                          ],
                        ),
                        
                        
                        itemBuilder: (BuildContext context)=><PopupMenuItem<int>>[
                          PopupMenuItem(child: Text(locations[0], 
                          style: dropDownMenuItemstyle,
                          ),
                          value: 0,),
                           PopupMenuItem(child: Text(locations[1], 
                          style: dropDownMenuItemstyle,
                          ),
                          value: 1,),
                           PopupMenuItem(child: Text(locations[2], 
                          style: dropDownMenuItemstyle,
                          ),
                          value: 2,),
                        ]),
                        Spacer(),
                        Icon(Icons.settings,color:Colors.white)
                    ],
                  ),
                ),
                SizedBox(height: 50.0,),
                Text("where would \nYou want to go?",style: TextStyle(color: Colors.white,
                fontSize: 25.0,fontWeight: FontWeight.w400 ,fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
                SizedBox(height: 38.0,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Material(elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(30.0),),
                child: TextField(
                  controller: _searchFieldController,
                   
                  
                  
                  style: dropDownMenuItemstyle,
                  cursorColor: appTheme.primaryColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 33.0, vertical: 15.0),
                    suffix: Material(elevation: 3.0,borderRadius: BorderRadius.all(Radius.circular(30.0, )),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          InheritedFlightListing(
                            fromLocation: locations[selectedLocationIndex],toLacation: _searchFieldController.text,
                            child: FlightListing(),
                          )
                          
                        ));
                      },
                      child: Icon(Icons.search ,color: Colors.black,)),),
                    border: InputBorder.none),
                  ),
                )
                
                ,),
                SizedBox(height: 25.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      
                      child: ChoiceChip(icon: Icons.flight_takeoff,text: "Flights", isSelected:isFlightSelected),
                      onTap: (){
                        setState(() {
                         isFlightSelected =true; 
                        });
                      },
                      
                      ),
                      
                    
                    SizedBox(width: 20.0,),
                    InkWell(child: ChoiceChip(icon: Icons.hotel,text: "Hotels",isSelected: !isFlightSelected ,),

                    onTap: (){
                      setState(() {
                       isFlightSelected =false; 
                      });
                    },
                    )


                ],)
              ],
            ),
          ),
        )
      ],
      
    );
  }
}
class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  ChoiceChip({this.icon, this.text,this.isSelected});
  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 8.0),
      decoration:widget.isSelected? BoxDecoration(color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.all(Radius.circular(20.0 ))):null,
      
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(widget.icon ,size: 20.0,),
          SizedBox(height: 8.0,),
          Text(widget.text,style: TextStyle(
            color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.w700),)

        ],
        
      ),
    );
  }
}

final viewAllStyle = TextStyle(color: appTheme.primaryColor,fontSize: 14.0);

 var homeScreenBottomPart =Column(
   children: <Widget>[
     Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         mainAxisSize: MainAxisSize.max,
         children: <Widget>[
           Text("Currently watched Items", style:dropDownMenuItemstyle),
           Spacer(),
            Text("View All Items(12)", style:viewAllStyle)
       
         ],
       ),
     ),
     Container(
       height: 132.0,
       child: ListView(
         scrollDirection: Axis.vertical,
         children:citycards,),
     )


 ],
 );
List<CityCard> citycards =[ 
  CityCard(imagePath: "assets/images/city.jpg", cityName: "sydney", monthyear: "Feb ,2019",disCount: "45 %",oldPrice: "4999",newPrice: "4954",),
  CityCard(imagePath: "assets/images/cover.jpg", cityName: "New York", monthyear: "March ,2019",disCount: "75%",oldPrice: "5000",newPrice: "4900",),
 CityCard(imagePath: "assets/images/uae.jpg", cityName: "UAE", monthyear: "March ,2019",disCount: "40%",oldPrice: "5000",newPrice: "4900",)
 
];
final formatCurrency = NumberFormat.simpleCurrency();


 class CityCard extends StatelessWidget {
   final String imagePath,cityName ,monthyear, disCount, oldPrice, newPrice;
   CityCard({this.imagePath,this.cityName,this.monthyear,this.disCount,this.oldPrice,this.newPrice});
   @override
   Widget build(BuildContext context) {
     return Padding(
       
       padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
       child: Column(
         children: <Widget>[
           ClipRRect(
             borderRadius: BorderRadius.all(Radius.circular(10.0)),
             
                    child: Stack(
                      
               children: <Widget>[
                 Container(

                   height: 240.0,
                   width: 200.0,
                   child: Image.asset(imagePath,fit: BoxFit.cover,),
                 ),
                 Positioned(
                   left: 0.0,
                   bottom: 0.0,
                   width: 150.0,
                   height: 100.0,
                   child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black12,


                        ]
                      )
                    ),
                   ),
                    
                 ),
                 Positioned(
                   left: 10.0,
                  bottom: 10.0,
                  right: 5.0,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     mainAxisSize: MainAxisSize.max,
                     children: <Widget>[
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text(cityName,style:TextStyle(fontSize: 18.0,fontWeight:FontWeight.w700,color: Colors.white)),
                       Text(monthyear, style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.normal,color: Colors.white),)
                    
                         ],
                       ),
                       Container(
                         padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                         decoration: BoxDecoration(
                           shape: BoxShape.rectangle,
                           color: Colors.white,
                           borderRadius: BorderRadius.all(Radius.circular(10.0))
                         ),
                         child: Text(disCount ,style: TextStyle(color: Colors.black,
                       fontSize: 15.0,fontWeight: FontWeight.bold),))
                       
                        ],
                   ),)
               ],
               
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             
             children: <Widget>[
                Text("${formatCurrency.format(5000)} ",style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold)),
               
               Text("${formatCurrency.format(4500)}",style:TextStyle(color:Colors.grey,fontWeight:FontWeight.normal)),            
             ],
           )
         ],
       ),
     );
   }
 }

