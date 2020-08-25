import 'dart:convert';
import 'dart:io';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poetry_blog_rebuild/data/api.dart';
import 'package:poetry_blog_rebuild/screens/screens.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File selectedImage;

  bool isLoading = false;

  GlobalKey<FormState> _formKey = GlobalKey();

  /*Text Controllers */
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  /*Get the image from gallery */
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black54,
              )),
          title: Text(
            'Create Post',
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          floating: true,
          elevation: 0,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 30.0),
          sliver: SliverToBoxAdapter(
            child: Container(
                child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        getImage();
                      });
                    },
                    child: selectedImage != null
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  selectedImage,
                                  fit: BoxFit.cover,
                                )),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Icon(
                              Icons.add_a_photo,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 9.0),
                        TextFormField(
                          controller: title,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Title',
                          ),
                          style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                          ),
                          keyboardType: TextInputType.text,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Title field cannot be blank";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 9.0),
                        Container(
                          padding: EdgeInsets.only(bottom: 40.0),
                          child: TextFormField(
                            controller: description,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '\n \n **Creative Piece** \n \n',
                            ),
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                            ),
                            keyboardType: TextInputType.multiline,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Creative piece field cannot be blank";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 50.0,
                  child: FloatingActionButton.extended(
                    elevation: 0.0,
                    icon: Icon(
                      Icons.file_upload,
                      size: 30.0,
                    ),
                    backgroundColor: Colors.pinkAccent,
                    label: Text(
                      isLoading ? 'Uploading..' : "Upload",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: _createPost,
                  ),
                ),
              ],
            )),
          ),
        ),
      ],
    ));
  }

  /*Create new post*/
  Future _createPost() async {
    var form = _formKey.currentState;
    if (form.validate() && selectedImage != null) {
      form.save();

      /*Retrieve the username of user from localStorage */
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var username = localStorage.getString('userKey');

      var data = {
        'title': title.text,
        'description': description.text,
        'username': username,
        'image': base64Encode(selectedImage.readAsBytesSync()),
        'imageName': randomAlphaNumeric(9),
      };

      /*Set the login button to loading state */
      setState(() {
        isLoading = true;
      });

      var response = await CallAPi().postData(data, 'post');
      var body = json.decode(response.body);

      if (body == 'success') {
        /*Navigate to the Home Screen */
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Navigation()));

        /**Set loading state of button to false &&
         * Clear the text fileds
        */
        title.clear();
        description.clear();
        setState(() {
          isLoading = false;
        });
      } else {
        /*Set loading state of button to false */
        setState(() {
          isLoading = false;
        });
      }
    } else if (selectedImage == null) {
      /**Display error message */
      Flushbar(
        message: "Please select a cover Image for your piece!",
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      )..show(context);
    }
  }
}
