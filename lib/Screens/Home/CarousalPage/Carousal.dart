import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Carousal extends StatefulWidget {
  @override
  _CarousalState createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(255, 27, 38, 44),
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios),
        label: Text(
          " Back ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(child: Text("Neophytes", style: TextStyle(fontSize:48, fontWeight:FontWeight.bold),)),
          SizedBox(height:20),
          Container(
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: <Widget>[
                  Carousel(
                    dotIncreaseSize: 1.5,
                    boxFit: BoxFit.scaleDown,
                    images: [
                      AssetImage("assets/images/throwback.png"),
                      AssetImage("assets/images/1.jpeg"),
                      AssetImage("assets/images/2.jpeg"),
                      AssetImage("assets/images/3.jpeg"),
                      AssetImage("assets/images/4.jpeg"),
                      AssetImage("assets/images/5.jpeg"),
                      AssetImage("assets/images/6.jpeg"),
                      AssetImage("assets/images/7.jpeg"),
                      AssetImage("assets/images/8.jpeg"),
                      AssetImage("assets/images/10.jpeg"),
                      AssetImage("assets/images/11.jpeg"),
                      AssetImage("assets/images/12.jpeg"),
                      AssetImage("assets/images/13.jpeg"),
                      AssetImage("assets/images/thank.jpg"),
                    ],
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 200),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(padding: EdgeInsets.all(15),child: Text("We take this opportunity to thank the Neophytes team that organised and conducted our freshers party. They have been the  prime inspiration for us to organise Amortentia 2020. We could'nt thank them enough for their constant support and the guidance they provide us alltogether. However, our seniors and we have bonded very well.I hope we could be equally good seniors to this batch of freshers .We wish all of them a great future ahead.\"No matter who we are, all we do is to trace the footprints of the ones who have already walked the path. \" ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
          SizedBox(height:100),
        ],
      ),
    );
  }
}
