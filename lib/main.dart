import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){


runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
  title: 'Simple SI unit Calculator',
  home: SIform(),
  theme: ThemeData(
    primaryColor: Colors.orange,
    accentColor: Colors.orangeAccent,

  ),

      )
    );  
}

class SIform extends StatefulWidget{ 
  @override
  State<StatefulWidget> createState() {
    
    return _SIformState();
  }

}

class _SIformState extends State<SIform>{

  var formKey = GlobalKey<FormState>();

  var _currencies = ['Dollar', 'Euro', 'Naira'];
  final _minimumPadding = 5.0;

  var _currentItemSelected = 'Naira';

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context){

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),

      body: Form(

        key: formKey,
        //margin: EdgeInsets.all(_minimumPadding * 2),
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[

            getImageAsset(),

            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
              keyboardType: TextInputType.number,
              controller: principalController,
              validator: (String value){
                if (value.isEmpty){
                  return 'Please enter the principal amount';
                }
              },
              decoration: InputDecoration(
                
                 labelText: 'Principal',
                 hintText: 'Enter principal e.g 12000',
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0)
                   )
              ),
            )),

            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
              keyboardType: TextInputType.number,
              controller: roiController,
              validator: (String value){
                if (value.isEmpty){
                  return 'Please enter the principal rate';
                }
              },
              decoration: InputDecoration(
                
                 labelText: 'Rate of interest',
                 hintText: 'In percent ',
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0)
                   )
              ),
            )),

            Padding(
              padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
              children: <Widget>[

              Expanded(child: TextFormField(
              keyboardType: TextInputType.number,
              controller: termController,
              validator: (String value){
                if (value.isEmpty){
                  return 'Please enter the term in years';
                }
              },
              decoration: InputDecoration(
                 labelText: 'Term',
                 hintText: 'Time in years',
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0)
                   )
              )
          )),

              Container(width: _minimumPadding * 5,),   

              Expanded(child: DropdownButton<String>(
                items: _currencies.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),

                value: _currentItemSelected,

                onChanged: (String newValueSelected){

                  //Your code to execute, for the drop down button
                  _onDropdownItemSelected(newValueSelected);

                  
                }
              )),
     


              ],
            )),


           Padding(
             padding: EdgeInsets.only(bottom: _minimumPadding, top: _minimumPadding),
             child: Row(children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text('Calculate'),
                  onPressed: (){
                    
                    
                    setState(() {
                     if (formKey.currentState.validate()){ 
                     this.displayResult = _calculateTotalReturns();
                    }});

                  },
                ),
              ),

              Expanded(
                child: RaisedButton(
                  child: Text('Reset'),
                  onPressed: (){

                    setState(() {
                      _reset();
                    });
                    
                  },
                ),
              )
            ],)),

            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
            
              child: Text(this.displayResult)
            )

          ],
        )),
      ),
    );
  }


  Widget getImageAsset(){

    AssetImage assetImage = AssetImage('images/images.png');
    Image image = Image(image: assetImage, width: 200.0, height: 200.0,);
    return Container(child: image, margin: EdgeInsets.all(_minimumPadding * 10),);
  }

  void _onDropdownItemSelected  (String newValueSelected){
    setState(() {
     this._currentItemSelected = newValueSelected; 
    });
  }

  String _calculateTotalReturns(){

    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term)/100; 

    String result = 'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;

  }

  void _reset(){
      principalController.text = '';
      roiController.text = '';
      termController.text = '';
      displayResult = '';
      

  }
}
  
