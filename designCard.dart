import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';


class designCard extends StatefulWidget{

  designCard({Key key}) : super(key: key);

  @override
  designCardState createState() => designCardState();
}

class designCardState extends State<designCard>  with SingleTickerProviderStateMixin {
  bool _isEditing = true;
  bool _addthefield=true;
  final FocusNode myFocusNode = FocusNode();

  int _count = 1;
  final nameController = TextEditingController();
  final desigController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();
  final contactController = TextEditingController();
  final landlineController = TextEditingController();
  final officeController = TextEditingController();
  final residenceController = TextEditingController();
  final fbController = TextEditingController();
  final webController = TextEditingController();
  final twitterController = TextEditingController();
  final customController = TextEditingController();

  Future<String> get _localCardPath async {
    final card_directory = await getApplicationDocumentsDirectory();

    return card_directory.path;
  }

  Future<File> get _localCardFile async {
    final path = await _localCardPath;
    return File('$path/MyCard.txt');
  }





  @override
    void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _customFieldList = new List.generate(_count, (int i) => new CustomField());

    List<Widget> customFieldWidget = <Widget>[

      new Column(
        children: _customFieldList,
      ),

    ];

    Widget FlipcardSaved= FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 1000,

      onFlipDone: (status) {
        print(status);
      },
      front: Center(

          child: Card(
            margin: EdgeInsets.all(20),
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),

            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[

                    new Container(
                      decoration: BoxDecoration(
                        color: Colors.black12, //Color(0xFF006666),
                        borderRadius: BorderRadius.all(Radius.circular(22.0)),
                      ),
                      // height: 450.0,
                      //color: Color(0xffFFFFFF),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.0),
                        child: new Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 30.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Text( 'Text Button', textAlign: TextAlign.left, overflow:                                                TextOverflow.ellipsis,style: TextStyle(fontWeight:                                                    FontWeight.bold, fontSize: 25),),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Enter the Designation",
                                        ),
                                        controller: desigController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Company Name",
                                        ),
                                        controller: companyController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 4.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Contact no",
                                        ),
                                        controller: contactController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Enter landline no",
                                        ),
                                        controller: landlineController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0, bottom: 20.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Enter Your Email",
                                        ),
                                        controller: emailController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            /*_addthefield? Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: customFieldWidget,
                                  ),): Container(),*/


                            !_isEditing ? _getActionButtons() : new Container(),
                            //!_isEditing ? _getAddButton(_customFieldList) : new Container(),


                            //!_isEditing ? _getActionButtons() : new Container(),

                          ],

                        ),
                      ),
                    ),
                    Center(child: Padding(
                        padding: EdgeInsets.only(
                            left: 90.0, top: 10.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new FlatButton(
                                // shape: ,

                                //color: Colors.black,
                                child: Text("\'Flip the Card\'", style: TextStyle(fontStyle :FontStyle.italic, fontSize: 16.0),),
                                color: Colors.blue,
                                // onPressed: (){},
                                //decoration: const InputDecoration(
                                //   hintText: "Company",
                                //  ),
                                // enabled: !_isEditing,
                                //  autofocus: !_isEditing,

                              ),
                            ),
                          ],
                        )),),

                  ],
                ),
              ],
            ),





          )),
      back: Center(

          child: Card(
            margin: EdgeInsets.all(20),
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),

            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[

                    new Container(
                      decoration: BoxDecoration(
                        color: Colors.black12, //Color(0xFF006666),
                        borderRadius: BorderRadius.all(Radius.circular(22.0)),
                      ),
                      // height: 450.0,
                      //color: Color(0xffFFFFFF),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.0),
                        child: new Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 260.0, right: 25.0, top: 60.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        _isEditing ? _getEditIcon() : new Container(),

                                      ],
                                    )
                                  ],
                                )),


                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Office Address",
                                        ),
                                        controller: officeController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Residence Address",
                                        ),
                                        controller: residenceController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Facebook Id",
                                        ),
                                        controller: fbController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 4.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Website",
                                        ),
                                        controller: webController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Twitter Id",
                                        ),
                                        controller: twitterController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0, bottom: 20.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Custom field",
                                        ),
                                        controller: customController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            /*_addthefield? Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: customFieldWidget,
                                  ),): Container(),*/


                            !_isEditing ? _getActionButtons() : new Container(),
                            //!_isEditing ? _getAddButton(_customFieldList) : new Container(),


                            //!_isEditing ? _getActionButtons() : new Container(),

                          ],

                        ),
                      ),
                    ),
                    Center(child: Padding(
                        padding: EdgeInsets.only(
                            left: 90.0, top: 10.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new FlatButton(
                                // shape: ,

                                //color: Colors.black,
                                child: Text("\'Flip the Card\'", style: TextStyle(fontStyle :FontStyle.italic, fontSize: 16.0),),
                                color: Colors.blue,
                                // onPressed: (){},
                                //decoration: const InputDecoration(
                                //   hintText: "Company",
                                //  ),
                                // enabled: !_isEditing,
                                //  autofocus: !_isEditing,

                              ),
                            ),
                          ],
                        )),),

                  ],
                ),
              ],
            ),





          )),
    );
    Widget FlipcardEditing= FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 1000,

      onFlipDone: (status) {
        print(status);
      },
      front: Center(

          child: Card(
            margin: EdgeInsets.all(20),
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),

            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[

                    new Container(
                      decoration: BoxDecoration(
                        color: Colors.black12, //Color(0xFF006666),
                        borderRadius: BorderRadius.all(Radius.circular(22.0)),
                      ),
                      // height: 450.0,
                      //color: Color(0xffFFFFFF),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.0),
                        child: new Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 30.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Enter Your Name",
                                        ),
                                        controller: nameController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Enter the Designation",
                                        ),
                                        controller: desigController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Company Name",
                                        ),
                                        controller: companyController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 4.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Contact no",
                                        ),
                                        controller: contactController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Enter landline no",
                                        ),
                                        controller: landlineController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0, bottom: 20.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Enter Your Email",
                                        ),
                                        controller: emailController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            /*_addthefield? Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: customFieldWidget,
                                  ),): Container(),*/


                            !_isEditing ? _getActionButtons() : new Container(),
                            //!_isEditing ? _getAddButton(_customFieldList) : new Container(),


                            //!_isEditing ? _getActionButtons() : new Container(),

                          ],

                        ),
                      ),
                    ),
                    Center(child: Padding(
                        padding: EdgeInsets.only(
                            left: 90.0, top: 10.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new FlatButton(
                                // shape: ,

                                //color: Colors.black,
                                child: Text("\'Flip the Card\'", style: TextStyle(fontStyle :FontStyle.italic, fontSize: 16.0),),
                                color: Colors.blue,
                                // onPressed: (){},
                                //decoration: const InputDecoration(
                                //   hintText: "Company",
                                //  ),
                                // enabled: !_isEditing,
                                //  autofocus: !_isEditing,

                              ),
                            ),
                          ],
                        )),),

                  ],
                ),
              ],
            ),





          )),
      back: Center(

          child: Card(
            margin: EdgeInsets.all(20),
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),

            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[

                    new Container(
                      decoration: BoxDecoration(
                        color: Colors.black12, //Color(0xFF006666),
                        borderRadius: BorderRadius.all(Radius.circular(22.0)),
                      ),
                      // height: 450.0,
                      //color: Color(0xffFFFFFF),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.0),
                        child: new Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 260.0, right: 25.0, top: 60.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        _isEditing ? _getEditIcon() : new Container(),

                                      ],
                                    )
                                  ],
                                )),


                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Office Address",
                                        ),
                                        controller: officeController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Residence Address",
                                        ),
                                        controller: residenceController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Facebook Id",
                                        ),
                                        controller: fbController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 4.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Website",
                                        ),
                                        controller: webController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Twitter Id",
                                        ),
                                        controller: twitterController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 9.0, bottom: 20.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Custom field",
                                        ),
                                        controller: customController,
                                        enabled: !_isEditing,
                                        autofocus: !_isEditing,

                                      ),
                                    ),
                                  ],
                                )),

                            /*_addthefield? Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: customFieldWidget,
                                  ),): Container(),*/


                            !_isEditing ? _getActionButtons() : new Container(),
                            //!_isEditing ? _getAddButton(_customFieldList) : new Container(),


                            //!_isEditing ? _getActionButtons() : new Container(),

                          ],

                        ),
                      ),
                    ),
                    Center(child: Padding(
                        padding: EdgeInsets.only(
                            left: 90.0, top: 10.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new FlatButton(
                                // shape: ,

                                //color: Colors.black,
                                child: Text("\'Flip the Card\'", style: TextStyle(fontStyle :FontStyle.italic, fontSize: 16.0),),
                                color: Colors.blue,
                                // onPressed: (){},
                                //decoration: const InputDecoration(
                                //   hintText: "Company",
                                //  ),
                                // enabled: !_isEditing,
                                //  autofocus: !_isEditing,

                              ),
                            ),
                          ],
                        )),),

                  ],
                ),
              ],
            ),





          )),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Design your card'),
        leading: Icon(
          Icons.portrait,
        ),
        actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
               child: _getEditIcon()
             ),],
        ),


      body: !_isEditing? FlipcardEditing: FlipcardSaved,
    );


  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {

                    _localCardFile.then((onValue){

                      onValue.writeAsString(nameController.text+"\n"+
                          desigController.text+"\n"+
                          companyController.text+"\n"+
                          contactController.text+"\n"+
                          landlineController.text+"\n"+
                          emailController.text+"\n"+
                          officeController.text+"\n"+
                          residenceController.text+"\n"+
                          fbController.text+"\n"+
                          webController.text+"\n"+
                          twitterController.text+"\n"+
                          customController.text+"\n");
                    });

                      print(nameController.text+"\n"+
                            desigController.text+"\n"+
                            companyController.text+"\n"+
                            contactController.text+"\n"+
                            landlineController.text+"\n"+
                            emailController.text+"\n"+
                            officeController.text+"\n"+
                            residenceController.text+"\n"+
                            fbController.text+"\n"+
                            webController.text+"\n"+
                            twitterController.text+"\n"+
                            customController.text+"\n"
                      );
                      setState(() {
                        _isEditing = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _isEditing = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),

        ],
      ),
    );
  }

  Widget _getAddButton(_customFieldList) {

    return new FlatButton(
      onPressed: (){


        setState(() {
            _count=_count+1;
            print("${_customFieldList.length}");


        });
        },
      child: new Icon(Icons.add),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _isEditing = false;

        });
      },
    );
  }





}





class CustomField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CustomField();
}

class _CustomField extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      // width: 170.0,
        padding: new EdgeInsets.all(5.0),
        child: new Column(children: <Widget>[
          new TextFormField(
            decoration: new InputDecoration(
              hintText: 'Custom field',
            ),
          ),


        ]));
  }


}
