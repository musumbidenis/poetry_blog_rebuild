import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final postImageUrl;
  final userImageUrl;
  final title;

  const Post({Key key, this.postImageUrl, this.userImageUrl, this.title})
      : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
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
                  size: 30.0,
                )),
            title: Text(
              'Go Back',
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            floating: true,
            elevation: 0,
          ),
          SliverToBoxAdapter(
              child: Stack(
            children: <Widget>[
              // The containers in the background
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .30,
                    color: Colors.blue,
                  ),
                ],
              ),
              // The card widget with top padding,
              // incase if you wanted bottom padding to work,
              // set the `alignment` of container to Alignment.bottomCenter
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .18,
                    right: 20.0,
                    left: 20.0),
                child: Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                        bottomLeft: const Radius.circular(30.0),
                        bottomRight: const Radius.circular(15.0)),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
