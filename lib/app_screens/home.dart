import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      
     child: Container(
       padding: EdgeInsets.all(40.0),
      alignment: Alignment.center,
      color: Colors.deepPurple,
       child: 
       Column(children: <Widget>[

          Row(
        children: <Widget>[ 

        Expanded(child: Text("Dana Air",
         textDirection: TextDirection.ltr,
         style: TextStyle(
         decoration: TextDecoration.none,
         fontSize: 40,
         fontFamily: 'Raleway',
         fontWeight: FontWeight.w700,
         color: Colors.white

       ),
       )),

        Expanded(child: Text("From Lagos to London",
         textDirection: TextDirection.ltr,
         style: TextStyle(
         decoration: TextDecoration.none,
         fontSize: 15,
         fontFamily: 'Raleway',
         fontWeight: FontWeight.w700,
         color: Colors.white

       ),
       )),

        ],
      ),

      Row(
        children: <Widget>[ 

        Expanded(child: Text("Ibom Air",
         textDirection: TextDirection.ltr,
         style: TextStyle(
         decoration: TextDecoration.none,
         fontSize: 40,
         fontFamily: 'Raleway',
         fontWeight: FontWeight.w700,
         color: Colors.white

       ),
       )),

        Expanded(child: Text("From here to anywhere arround the world",
         textDirection: TextDirection.ltr,
         style: TextStyle(
         decoration: TextDecoration.none,
         fontSize: 15,
         fontFamily: 'Raleway',
         fontWeight: FontWeight.w700,
         color: Colors.white

       ),
       )),

        ],
      ),

      FlightImageAssets(),
      FlightBookingButton()

       ],)
       
   
      // width: 200.0,
      // height: 100.0,
      // margin: EdgeInsets.only(left: 15.0),
      // padding: EdgeInsets.all(25.0),
    
      ),

     );
  
  }

}

class FlightImageAssets extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  AssetImage assetImage =  AssetImage('images/fligtvector.png');
  Image image = Image(image: assetImage, );
  return Container(child: image, margin: EdgeInsets.only(top: 70.0),);
  }

}

class FlightBookingButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      child: RaisedButton(
        color: Colors.white,
        child: Text(
          "Book your flight",
          style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Raleway',
          color: Colors.deepPurpleAccent,
          fontWeight: FontWeight.w700
          ),
          ),
        elevation: 10.0,
        onPressed: () => bookFlight(context)
      ),
    );

  }

        void bookFlight(BuildContext context){
          var alertDialog =  AlertDialog(
            title: Text("Flight booked successfully"),
            content: Text("Have a pleasant flight"),
          );

          showDialog(
            context: context,
            builder: (BuildContext context) =>  alertDialog
           
          );
        }

  
}
