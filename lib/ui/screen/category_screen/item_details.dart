import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title ;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title!,style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Container(),
    );
  }
}
