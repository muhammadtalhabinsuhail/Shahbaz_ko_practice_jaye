import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  final Map<String, dynamic> productData;

  const EditProductScreen(this.productData, {Key? key}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late String imageBase64;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.productData['title']);
    descriptionController = TextEditingController(text: widget.productData['description']);
    priceController = TextEditingController(text: widget.productData['price'].toString());
    imageBase64 = widget.productData['image']; // Assuming you want to keep the same image for now
  }

  void updateProduct() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance
            .collection('products')
            .doc(widget.productData['id'])
            .update({
          'title': titleController.text,
          'description': descriptionController.text,
          'price': double.parse(priceController.text),
          'image': imageBase64,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product updated successfully')),
        );

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating product: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (val) => val == null || val.isEmpty ? 'Enter title' : null,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (val) => val == null || val.isEmpty ? 'Enter description' : null,
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (val) => val == null || val.isEmpty ? 'Enter price' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: updateProduct,
                child: Text('Update Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}