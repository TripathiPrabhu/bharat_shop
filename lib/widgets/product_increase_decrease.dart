import 'package:flutter/material.dart';

class IncreaseDecrease extends StatelessWidget {
  const IncreaseDecrease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.remove_circle, color: Colors.red,),) ,
          Text('0'),
          IconButton(onPressed: (){},
            icon: Icon(Icons.add_circle, color: Colors.green,),) ,
        ],
      ),
    );
  }
}
