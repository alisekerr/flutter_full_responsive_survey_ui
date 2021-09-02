import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  bool search = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: search ? 56 : 200,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              boxShadow: kElevationToShadow[6],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    child: !search
                        ? TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.blue[300],
                              ),
                              border: InputBorder.none,
                            ),
                          )
                        : null,
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(search ? 32 : 0),
                        topRight: Radius.circular(32),
                        bottomLeft: Radius.circular(search ? 32 : 0),
                        bottomRight: Radius.circular(32),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          search ? Icons.search : Icons.close,
                          color: Colors.blue[900],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          search = !search;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
