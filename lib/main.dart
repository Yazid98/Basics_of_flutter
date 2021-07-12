import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Basics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                "images/cover.jpg",
                height: 200,
                fit : BoxFit.cover),
                Padding(
                  padding: EdgeInsets.only(top: 130),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: profilePicture(68),
                  ),
                ),
              ]
            ),
            Text(
                "Eric Badarou",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            Padding(
                padding: EdgeInsets.all(13),
                child: Text(
                 "''Travailler comme si tout dépendait de soi et prier comme si tout dépendait de Dieu''",
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                )
            ),
            Row(
              children: [
                Expanded(
                child:
                buttonContainer(text: "Modifier le profil")
                ),
                buttonContainer(icon: Icons.border_color)
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.blue,
            ),
            sectionTitleText("A propos de moi"),
            aboutRow(icon: Icons.house, text: "Maisons-Alfort,France"),
            aboutRow(icon: Icons.bed, text: "Célibataire"),
            aboutRow(icon: Icons.date_range, text: "Inscrit depuis 2017"),
            aboutRow(icon: Icons.work, text: "PowerBI Developer"),
            sectionTitleText("Amis"),
            Row(
              children: [
                friendsImage("Coline", "images/cat.jpg", width/3.5),
                friendsImage("Coline", "images/cat.jpg", width/3.5),
                friendsImage("Coline", "images/cat.jpg", width/3.5),
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.blue,
            ),
            sectionTitleText("Mes posts"),
            post(time: "5 minutes", image: "images/carnaval.jpg" ,desc: "Ceci est une description de post"),
            post(time: "25 minutes", image: "images/mountain.jpg", likes: 45, desc: "Ceci est une description de post"),
            post(time: "45 minutes", image: "images/duck.jpg", desc: "Ceci est une description de post")
          ],
        ),
     )
    );
  }

  Image fromNetwork() {
    return Image.network(
      "https://images.pexels.com/photos/189349/pexels-photo-189349.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      fit: BoxFit.cover,
    );
  }

  CircleAvatar profilePicture(double? radius){
    return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
    );
  }

  Container buttonContainer({IconData? icon, String? text}){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(10),
      decoration : BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: (icon == null) ? Text(text ?? "", style: TextStyle(color: Colors.white,),
      ) : Icon(icon, color: Colors.white,),
      height: 50,
      alignment: Alignment.center,
    );
  }

  Widget sectionTitleText(String text){
    return
      Padding(
          padding: EdgeInsets.all(5),
        child:
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      );
  }

  Widget aboutRow({required IconData icon, required String text}){
    return
        Row(
          children: [
            Icon(icon),
            Padding(
            padding: EdgeInsets.all(5),
            child: Text(text),)
          ],
        );
  }

  Column friendsImage(String name, String imagePath, double? width){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(1),
          width: width,
          height: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imagePath)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Text(name),
        Padding(padding: EdgeInsets.only(bottom: 5))
      ],
    );
  }

  Container post({required String time, required String image,required String desc, int likes =0, int comments =0 }){
      return
          Container(
            margin: EdgeInsets.only(top: 8, left: 3, right: 3),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: 
                BorderRadius.circular(20),
              color: Color.fromRGBO(225, 255, 255, 1)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    profilePicture(20),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    Text("Eric Badarou"),
                    Spacer(),
                    timeText("5")
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                  child:
                  Image.asset(image, fit: BoxFit.cover,),
                ),
                Text(
                    desc,
                style: TextStyle(
                  color: Colors.black87,),
                  textAlign: TextAlign.start),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.favorite),
                    Text("$likes likes"),
                    Icon(Icons.comment),
                    Text("$comments commentaires")
                  ],
                )
              ],
            ),
          );
  }

  Text timeText(String time){
    return
        Text("Il y a $time minutes");
  }
}
















