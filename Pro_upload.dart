import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProUpload extends StatefulWidget {
  const ProUpload({Key? key}) : super(key: key);

  @override
  _ProUploadState createState() => _ProUploadState();
}

class _ProUploadState extends State<ProUpload> {
  final _formKey = GlobalKey<FormState>();

  CollectionReference products = FirebaseFirestore.instance.collection(
    'products',
  );
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  // TextEditingController imageController = TextEditingController();

  String imgUrl = "";

  final ImagePicker picker = ImagePicker();

  getImage() async {
    // final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    final Uint8List byteImage = await image!.readAsBytes();

    // image --> [12, 121, 25454, 2187, 88785, 854577, 4, 4, 878, 45, 4, ......]
    print(
      byteImage,
    ); // Don't invoke 'print' in production code. Try using a logging framework.
    // base 64 algorithm

    final String base64img = base64Encode(byteImage);
    print(base64img);

    setState(() {
      imgUrl = base64img;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('Upload Product'),
      backgroundColor: Colors.blue,
    );

    var body = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        //key: _formKey,
        child: ListView(
          children: [
            // Product Name
            TextFormField(
               controller: titleController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(),
              ),
              //onSaved: (value) => productName = value,
            ),

            SizedBox(height: 16),

            // Price
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(),
              ),
              //onSaved: (value) => price = double.tryParse(value ?? '0'),
            ),

            SizedBox(height: 16),

            // Description
            TextFormField(
              controller: desController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(),
              ),
              //onSaved: (value) => description = value,
            ),

            SizedBox(height: 16),

            // // Image Picker (Mock)
            // ElevatedButton.icon(
            //   icon: Icon(Icons.image),
            //   label: Text('Pick Image'),
            //   style: ElevatedButton.styleFrom(),
            //   onPressed: () {


  
          

            //     // // TODO: Implement image picker
            //     // ScaffoldMessenger.of(context).showSnackBar(
            //     //   SnackBar(content: Text('Image picker not implemented.')),
            //     //);
            //   },
            // ),




            // SizedBox(height: 24),

            // // Submit Button
            // ElevatedButton(
            //   child: Text('Submit'),
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 14),
            //     textStyle: TextStyle(fontSize: 16),
            //   ),

            //   onPressed: () {
            //     //   if (_formKey.currentState!.validate()) {
            //     //     _formKey.currentState!.save();
            //     //     print("Name: $productName, Price: $price, Desc: $description");
            //     //     ScaffoldMessenger.of(context).showSnackBar(
            //     //       SnackBar(content: Text('Product Submitted')),
            //     //     );
            //   },
            //   //},
            // ),











         ElevatedButton(onPressed:
             (){
              getImage();
             }
             , child: Text("Choose File")),
                        ElevatedButton(
                onPressed: () {
                  // Add the product to the database
                  products.add({
                    'title':titleController.text,
                    'description':desController.text,
                    'price':double.parse(priceController.text),
                    'image':imgUrl,
                    
                  }).then((value) => {
                    titleController.clear(),
                    desController.clear(),
                    priceController.clear(),
                   
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: 
                    Text("Product added successfully..✔",style: TextStyle(color: Colors.white),), backgroundColor: Colors.purple,)) ,

                    // Navigator.pop(context),
                  }).catchError((error) => {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add product"),))
                  });
                },
                child: Text("Add product"),
              ),
            ],
          ),
        ),
      );





    return Scaffold(appBar: appBar, body: body);
  }
}
