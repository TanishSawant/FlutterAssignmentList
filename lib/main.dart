import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  //var assignment;
  @override
  _State createState() => _State();
}

class _State extends State<MyApp>  {

  //CAUTION: Road ahead is prone to mental instability.... Proceed with caution!

  //Assignment assignment;
  final List<String> name = <String>['Launching Missile'];
  final List<String> description = <String>['You decide the location to destroy'];
  final List<bool> isDone = <bool>[false];
  final List<DateTime> _datesOfSubmission = <DateTime>[DateTime.now()];

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  //TextEditingController assignmentNumberController = TextEditingController();

  //_State(this.assignment);

  void addItemToList(){
    setState(() {
      name.insert(0,nameController.text);
      description.insert(0, descriptionController.text);
      isDone.insert(0, false);
      _datesOfSubmission.insert(0, _value);
      nameController.clear();
      descriptionController.clear();
      //assignmentNumberController.clear();
    });
  }

  bool _isCr = true;

//To be visited afterwards  

  showAlertDialog1(BuildContext context) {
  // set up the buttons
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed:  () {Navigator.pop(context);},
  );
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget launchButton = FlatButton(
    child: Text("Launch"),
    onPressed:  () {},
  );

  Widget sorryButton = FlatButton(
    child: Text("I am SORRY"),
    onPressed:  () {Navigator.pop(context);},
  );

  // set up the AlertDialog
  AlertDialog alert1 = AlertDialog(
    title: Text("Notice"),
    content: Text("You think this is a joke?? Name of assignment cannot be empty!"),
    actions: [
      okButton,
      sorryButton
    ],
  );



  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert1;
    },
  );
}

  showBottomSheet(BuildContext context, int index) {
  // set up the buttons
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed:  () {Navigator.pop(context);},
  );
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget launchButton = FlatButton(
    child: Text("Launch"),
    onPressed:  () {},
  );

  Widget sorryButton = FlatButton(
    child: Text("I am SORRY"),
    onPressed:  () {Navigator.pop(context);},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
      title: Text("${name[index].toUpperCase()}",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
      ),
      content: Container(
        height: 100.0,
        padding: EdgeInsets.only(top:12.0),
        child: Column(
          children: <Widget>[
            Text("${description[index]}",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "Poppins" , color: Colors.blue[200], fontSize: 18.0),
            ),
            Text("\n${_datesOfSubmission[index].difference(DateTime.now()).inDays}2ays to go....",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "Poppins" , color: Colors.redAccent[200], fontSize: 18.0),
            ),
          ],
        ),
      ),
      actions: [FlatButton(onPressed: () => Navigator.pop(context), child: Text("ok"))],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc){
          return Container(
            child:Padding(
            padding: EdgeInsets.all(30),
            child: Visibility(
                visible: _isCr,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  
                  AzzezIdea(descriptionController: nameController, label: "Name"),
                
                  AzzezIdea(descriptionController: descriptionController, label: "Description Of Assignment"),
                
                  Container(
                    child: Text(_dateFormat.format(_value),
                    style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                  Container(
                    child: FlatButton.icon(
                    label: Text("SELECT DATE"),//TODO STYLE THIS
                    icon: new Icon(
                    Icons.date_range,
                    color: Colors.black,
                  ),
                      onPressed: () => _selectDate(),
                    )
                  ),
                  Visibility(
                    visible: _isCr,
                    child:FloatingActionButton(
                    child: Text('Add'),
                    onPressed: () {
                      if(nameController.text != ''){addItemToList(); Navigator.pop(context);}
                      else {showAlertDialog1(context);}
                      },
                    ), 
                  ),
                ],
              ),
            ),
          ),
          
          );
      }
    );
}

  DateTime _value = DateTime.now();

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025)
    );
    if(picked != null) setState(() => _value = picked);
  }

//TODO: change da format
  DateFormat _dateFormat = DateFormat("yyyy-MM-dd");


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('Assignment'),
      ),
      body: Column(
        children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 1.0, top:8.0, right: 8.0, bottom: 7.0),
                      itemCount: name.length,
                      itemBuilder: (BuildContext context, int index) {

                        Color textColor = Colors.black;
                        if (isDone[index] == true){
                          textColor = Colors.blueGrey[300];
                        }
                        
                        Color backgroundColor = Colors.white30;
                        if (isDone[index] == true){
                          backgroundColor = Colors.blueGrey[50];
                        }

                        return
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.only(left: 0.0),
                            padding: EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              border: Border(
                                bottom: BorderSide(
                                  color: _datesOfSubmission[index].difference(DateTime.now()).inDays<2?Colors.red[400]:Colors.blue,
                                  width: 1.0
                                ),
                  
                              )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      "${name[index]}",
                                      style: TextStyle(fontSize: 24.0, fontFamily: "Thesis", color: textColor),
                                    ),
                                    Visibility(
                                      visible: isDone[index],
                                        child: Container(
                                        child: new Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        new Text(
                                          //TODO: CHANGE THE FONTSIZE
                                          "Due : \n${_dateFormat.format(_datesOfSubmission[index])}",
                                          style: TextStyle(
                                            color: _datesOfSubmission[index].difference(DateTime.now()).inDays<2?Colors.red:Colors.black87,
                                          ),
                                        ),
                                        //Divider()
                                      ],
                                    ),
                                    
                                  ],
                                ),

                                Visibility(
                                  //visible: !isDone[index],
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Mark As Done',
                                        style: TextStyle(color: Colors.green[300]),
                                      ),
                                      Checkbox(
                                        activeColor: Colors.green[300],
                                        value: isDone[index],
                                        onChanged: (value) {
                                          setState(() {
                                            isDone[index] = value;
                                          });
                                        },  
                                      ),
                                    ],
                                  ),
                                )   
                              ],
                            ),
                          ),
                          onTap: ()=>{showBottomSheet(context, index)},
                        );
                      }
                    )
                  ),
                    Visibility(
                        visible: _isCr,
                        child:Container(
                          margin: EdgeInsets.only(left: 330.0, bottom: 20.0),
                          child: FloatingActionButton(
                          child: Icon(
                            Icons.add
                          ),
                          onPressed: () => {_settingModalBottomSheet(context)},
                                ),
                              ),
                            ),
        ]
      )
    );
  }
}

class AzzezIdea extends StatelessWidget {
  
  
  final TextEditingController descriptionController;
  final String label;

  AzzezIdea({this.descriptionController, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top : 10.0),
      child: TextField(
        controller: descriptionController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}