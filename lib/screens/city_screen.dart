import 'package:flutter/material.dart';
import 'package:wetterapp/constants/constants.dart';


class CityScreen extends StatefulWidget {

  const CityScreen({Key? key, }) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

    @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }


  TextEditingController textEditingController =TextEditingController();
  @override
  Widget build(BuildContext context) {
 late   String cityName;
    return Scaffold(appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints:const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
            
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
             
              
               TextField(
                controller: textEditingController,
                onChanged: (value){
             cityName=value;
                },
  obscureText: false,
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Stadt',
  
  ),
), FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}