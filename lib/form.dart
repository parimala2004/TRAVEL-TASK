import 'package:flutter/material.dart';


class InputFormScreen extends StatefulWidget {
  @override
  _InputFormScreenState createState() => _InputFormScreenState();
}

class _InputFormScreenState extends State<InputFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _formFieldController = TextEditingController();
  final TextEditingController _formfieldController = TextEditingController();
  final TextEditingController _formfieldcontroller = TextEditingController();
  final TextEditingController _formFieldcontroller = TextEditingController();


  String? _selectedCity;
  String? _selectedDepartment;

  List<String> _cities = ['Chennai', 'Bangalore', 'Hyderabad', 'Mumbai','Coimbatore','gujarat','Rajastan','Punjab','Delhi','Kolkata','Lucknow'];
  List<String> _departments = ['CSE', 'ECE', 'EEE', 'MECH'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Input Form',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey,
      ),
      body:SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name:",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize:20),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter full name',
                    suffixIcon:Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Address:",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize:20),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _formFieldController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter  the address',
                    suffixIcon: Icon(Icons.home_outlined),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'address is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Phone number:",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize:20),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _formfieldController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter  the number',
                    suffixIcon: Icon(Icons.phone),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'number is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Date Of Birth",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize:20),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _formFieldcontroller,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'yyyy-mm-dd',
                      hintText: 'DOB',
                    filled: true,
                    fillColor: Colors.grey.shade300,

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'DOB';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize:20),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _formfieldcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your mail',
                    suffixIcon: Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                  validator: (value)
                  {
                    final pattern= RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}');
                    if(value!.isEmpty)
                    {
                      return 'required';
                    }
                    else if(pattern.hasMatch(value))
                    {
                      return null;
                    }
                    else
                    {
                      return "enter a valid email";
                    }
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "City:",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize:20),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField<String>(
                  value: _selectedCity,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                  hint: Text('Select a city'),
                  items: _cities.map((city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a city';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Department",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize:20),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField<String>(
                  value: _selectedDepartment,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                  hint: Text('Select a department'),
                  items: _departments.map((dept) {
                    return DropdownMenuItem(
                      value: dept,
                      child: Text(dept),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedDepartment = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'select a department';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        (      SnackBar(content: Text('Form submitted successfully')),
                        );
                      }
                    },
                    child: Text('Submit',style: TextStyle(color: Colors.blueAccent),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}