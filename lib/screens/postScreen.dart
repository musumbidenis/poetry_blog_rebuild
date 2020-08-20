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
          // SliverAppBar(
          //   brightness: Brightness.light,
          //   backgroundColor: Colors.white,
          //   leading: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Icon(
          //         Icons.arrow_back,
          //         color: Colors.black54,
          //         size: 30.0,
          //       )),
          //   title: Text(
          //     'Go Back',
          //     style: const TextStyle(
          //       color: Colors.black54,
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   centerTitle: false,
          //   floating: true,
          //   elevation: 0,
          // ),
          SliverToBoxAdapter(
              child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1496950866446-3253e1470e8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .15,
                      right: 20.0,
                      left: 20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0)),
                    ),
                    elevation: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 28.0, horizontal: 25.0),
                      child: Wrap(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 18.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 35.0,
                                  ),
                                  Text(
                                    "Marcus Ng",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18.0),
                                  child: Text(
                                    "The Sun and the flower",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla feugiat enim orci, id rhoncus enim lacinia at. Duis eu turpis nibh. Nulla suscipit magna ultricies risus ultrices lobortis. Nunc pharetra nisi urna, cursus molestie enim pulvinar sed. In libero orci, porttitor vel risus sit amet, fermentum elementum leo. Nunc quis purus eget enim auctor mattis vitae ut arcu. Ut auctor sapien id nunc interdum, ac bibendum mauris consectetur. Vestibulum at tempor diam, sit amet consectetur libero. Vivamus ipsum sapien, gravida in augue sed, pulvinar finibus nunc. Suspendisse vulputate dapibus risus, sit amet pulvinar leo dapibus eget. Morbi eu blandit urna.  amet, consectetur adipiscing elit. Nulla feugiat enim orci, id rhoncus enim lacinia at. ",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    textAlign: TextAlign.justify),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
          SliverToBoxAdapter(
            child: Text("data"),
          )
        ],
      ),
    );
  }
}
