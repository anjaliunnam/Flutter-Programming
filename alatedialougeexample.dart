**********************firstpage.dart***************************************
  
  import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/firstpage/firstpage_modal.dart';
import 'package:flutter_application_5/pages/firstpage/firstpage_service.dart';
import 'package:flutter_application_5/pages/secoendpage/secoendpage_ui.dart';
import 'package:flutter_application_5/util/alertdialog.dart';
import 'package:flutter_application_5/util/listview.dart';
import 'package:flutter_application_5/util/textfield.dart';
import 'firstpage_modal.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // PageOneModel pageOneModel = new PageOneModel();
  PageOneService pageOneService = new PageOneService();
  RegisterModal registerModal = new RegisterModal();
  List<RegisterModal> tempdata = List.empty(growable: true);
  // Map map;
  var valuetwo;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('FirstPage'))),
      body: (tempdata.isEmpty)
          ? Textfield.getTextField(context, 'List is Empty')
          : ListViewBuilderpage.listbuilder(tempdata.map((e) => e.firstname).toList(), ondeleteclick: (index) {
              setState(() {
                tempdata.removeAt(index);
              });
            }, oneyeclick: (index) {
              setState(() {
                // map.forEach((registerModal, tempdata) {
                //   print("Key : $registerModal value $tempdata");

                tempdata.expand(AleartdialogModal.showSimpleModalDialog(
                  context,
                  tempdata[index].firstname,
                  tempdata[index].lastname,
                  tempdata[index].phonenumber,
                  tempdata[index].address,
                ));

                // });
              });
            }),
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.only(left: 30, right: 50, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: ElevatedButton(
                  child: Text('Click To '),
                  onPressed: () async {
                    RegisterModal registerModal = await Navigator.push(context, MaterialPageRoute(builder: (context) => SecoendPage()));
                    // print(registerModal.firstname);
                    // print(registerModal.lastname);
                    tempdata.add(registerModal);
                    setState(() {});
                  }),
            ),
            SizedBox(
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
********************************* firstpagemodal.dart********************************************************
  import 'package:flutter/cupertino.dart';

class RegisterModal {
  final String firstname;
  final String lastname;
  final String address;
  final String phonenumber;

  RegisterModal({this.firstname, this.lastname, this.address, this.phonenumber});
}
********************************** secoendpageui.dart******************************************
  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_5/pages/firstpage/firstpage_modal.dart';
import 'package:flutter_application_5/pages/secoendpage/secoendpage_modal.dart';
import 'package:flutter_application_5/pages/secoendpage/secoendpage_service.dart';
import 'package:flutter_application_5/util/snackbar.dart';

class SecoendPage extends StatefulWidget {
  @override
  _SecoendPageState createState() => _SecoendPageState();
}

class _SecoendPageState extends State<SecoendPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstcontroller = TextEditingController();
  TextEditingController _lastcontroller = TextEditingController();
  TextEditingController _mobilenumbercontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  TextEditingController _gendercontroller = TextEditingController();
  TextEditingController _dofBirthcontroller = TextEditingController();
  SecoendPageModal secoendPageModal = new SecoendPageModal();
  SecoendPageService secoendPageService = new SecoendPageService();

  String dropdownvalue = 'Select Gender';
  var items = ['Select Gender', 'Male', 'Female', 'Others'];

  DateTime _date = DateTime(2020, 11, 17);

  void _selectDate() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1980, 1),
      lastDate: DateTime(2050, 7),
      helpText: 'Select a date of Birth',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  void updateData() {
    var model = RegisterModal(
        firstname: _firstcontroller.text.trim(),
        lastname: _lastcontroller.text.trim(),
        phonenumber: _mobilenumbercontroller.text.trim(),
        address: _addresscontroller.text.trim());
    Navigator.pop(context, model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue, title: Center(child: Text('Registration'))),
      body: Container(
        color: Colors.pink[50],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: 800,
              width: 700,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      child: Card(
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                                child: TextFormField(
                                  controller: _firstcontroller,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your First name',
                                    labelText: 'FirstName',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                                child: TextFormField(
                                  controller: _lastcontroller,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your Last name',
                                    labelText: 'Lastname',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                                child: TextFormField(
                                  controller: _mobilenumbercontroller,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter a phone number',
                                    labelText: 'Phone',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //  DateTimePickerFormField(
                                    //   controller: _dofBirthcontroller,
                                    //   decoration: const InputDecoration(
                                    //     prefixIcon: Icon(Icons.calendar_today),
                                    //     border: OutlineInputBorder(),
                                    //     hintText: 'yyyy-mm-dd',
                                    //     labelText: 'Data of birth',
                                    //   ),
                                    // ),

                                    Container(
                                      child: Center(
                                        child: ElevatedButton(
                                          onPressed: _selectDate,
                                          child: Text('SELECT DATE OF BIRTH'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Selected date: $_date',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        DropdownButtonFormField(
                                          value: dropdownvalue,
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            filled: true,
                                            hintStyle: TextStyle(color: Colors.white10),
                                            hintText: "Select the Gender",
                                          ),
                                          items: items.map((String items) {
                                            return DropdownMenuItem(value: items, child: Text(items));
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownvalue = newValue;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                                child: Container(
                                  child: TextField(
                                    controller: _addresscontroller,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.home),
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter your Adress',
                                      labelText: 'Adress',
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: new Container(
                                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                                    child: new ElevatedButton(
                                      child: const Text('Add'),
                                      onPressed: () {
                                        setState(() {
                                          secoendPageModal.firstname = _firstcontroller.text;
                                          secoendPageModal.lastname = _lastcontroller.text;
                                          secoendPageModal.phonenumber = _mobilenumbercontroller.text;
                                          secoendPageModal.address = _addresscontroller.text;
                                          secoendPageService.firstnameValidation(secoendPageModal);
                                          secoendPageService.lastnameValidation(secoendPageModal);
                                          secoendPageService.phonenumberValidation(secoendPageModal);
                                          secoendPageService.addressValidation(secoendPageModal);
                                          print(secoendPageModal.firstname = _firstcontroller.text);

                                          if (_firstcontroller.text.isEmpty) {
                                            if (secoendPageModal.firstnameValidator) {
                                              return SnackBarPage.getSnackBar(context, 'first name is empty');
                                            }
                                          }

                                          if (_lastcontroller.text.isEmpty) {
                                            if (secoendPageModal.lastnameValidator) {
                                              return SnackBarPage.getSnackBar(context, 'last name is empty');
                                            }
                                          }
                                          if (_mobilenumbercontroller.text.isEmpty) {
                                            if (secoendPageModal.phoneValidator) {
                                              return SnackBarPage.getSnackBar(context, 'mobile number is empty');
                                            }
                                          }
                                          if (_addresscontroller.text.isEmpty) {
                                            if (secoendPageModal.addressValidator) {
                                              return SnackBarPage.getSnackBar(context, 'address is empty');
                                            }
                                          }
                                          updateData(); //pop data
                                        });
                                      },
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validationData() {}
}
****************************secoendpagemodal.dart*********************************************
  class SecoendPageModal {
  String firstname = '';
  String lastname = '';
  String gender = '';
  int dataofbirth;
  String address = '';
  bool isNotEmpty = true;
  bool firstnameValidator=true;
  bool lastnameValidator=true;
  bool phoneValidator=true;
  bool addressValidator=true;
  var phonenumber;
}


****************************secoendpageservice.dart***********************************
  import 'package:flutter_application_5/pages/secoendpage/secoendpage_modal.dart';

class SecoendPageService {
  void firstnameValidation(SecoendPageModal secoendPageModal) {
    if (RegExp(r'[A-Za-z]')
        .hasMatch(secoendPageModal.firstname)) {
      secoendPageModal.firstnameValidator = true;
    } else {
      secoendPageModal.firstnameValidator = false;
    }
  }

  void lastnameValidation(SecoendPageModal secoendPageModal) {
    if (RegExp(r'[A-Za-z]')
        .hasMatch(secoendPageModal.lastname)) {
      secoendPageModal.lastnameValidator = true;
    } else {
      secoendPageModal.lastnameValidator = false;
    }
  }

  void phonenumberValidation(SecoendPageModal secoendPageModal) {
    if (RegExp(r'[!@#<>?":_`~;[\]\\|=)(*&^%\a-zA-Zs-]')
        .hasMatch(secoendPageModal.phonenumber)) {
      secoendPageModal.phoneValidator = false;
    } else {
      secoendPageModal.phoneValidator = true;
    }
  }

  void addressValidation(SecoendPageModal secoendPageModal) {
    if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]')
        .hasMatch(secoendPageModal.address)) {
      secoendPageModal.addressValidator = false;
    } else {
      secoendPageModal.addressValidator = true;
    }
  }
}


 **************************Utils*******************************
   **************************altedilouge********************************
   import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/firstpage/firstpage_modal.dart';

class AleartdialogModal {
  RegisterModal registerModal = new RegisterModal();

  static dynamic showSimpleModalDialog(
    context,
    content_1,
    content_2,
    content_3,
    content_4,
  ) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          Map map;
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              width: 200,
              height: 300,
              child: Column(
                children: [
                  ListTile(
                    leading: Text('First Name'),
                    trailing: Text(content_1),
                  ),
                  ListTile(
                    leading: Text('Last Name'),
                    trailing: Text(content_2),
                  ),
                  ListTile(
                    leading: Text('Phone'),
                    trailing: Text(content_3),
                  ),
                  ListTile(
                    leading: Text('Address'),
                    trailing: Text(content_4),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
**********************************listviewbuilder.dart*************************************************
  import 'package:flutter/material.dart';

class ListViewBuilderpage {
  static dynamic listbuilder(List<String> content, {@required Function(int) ondeleteclick, oneyeclick}) {
    // print(content);
    print(content.length);
    return ListView.builder(
      itemCount: content.length,
      itemBuilder: (context, index) {
        int total = index + 1;
        return ListTile(
          leading: Text('$total'),
          title: Text(content[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  ondeleteclick(index);
                  // oncopyclick(index);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  oneyeclick(index);
                },
                icon: Icon(
                  Icons.visibility_rounded,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
*************************Snackbar***********************************
  import 'package:flutter/material.dart';

class SnackBarPage {
  static dynamic getSnackBar(BuildContext context, String content) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 20.0,
      content: Text(content),
    ));
  }
}
***********************************textfield*************************************
  
import 'package:flutter/material.dart';

class Textfield {
  static dynamic getTextField(BuildContext context, String content) {
    return Center(
        child: Text(
      ' Empty list',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ));
  }
}
  
  

   







  

  
  

  
