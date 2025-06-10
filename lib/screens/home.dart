import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://image.uniqlo.com/UQ/ST3/us/imagesgoods/470187/item/usgoods_03_470187_3x4.jpg?width=400'))),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 300,
              width: 350,
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 240),
                child: Text(
                  'Shop Our Fall Collection',
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: .025,
                      shadows: [
                        Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0))
                      ],
                      fontSize: 23,
                      fontFamily: 'Helvetica Neue'),
                ),
              ),
            )),
      ),
    );
  }
}
