import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/list.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final String? title;

  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          title!,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    5.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(slidersList[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    20.heightBox,
                    const Text(
                      'Dummy Item',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      count: 5,
                      normalColor: Colors.blueGrey,
                      selectionColor: Colors.amber,
                      stepInt: true,
                    ),
                    10.heightBox,
                    const Text(
                      '\$20,000',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: redColor),
                    ),
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Seller",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              5.heightBox,
                              const Text(
                                "In House Brand",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.message),
                          )
                        ],
                      ),
                    ),
                    20.heightBox,
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  const Text(
                                    'Color:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey),
                                  ),
                                  50.widthBox,
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.redAccent,
                                  ),
                                  5.widthBox,
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.purple,
                                  ),
                                  5.widthBox,
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.green,
                                  )
                                ],
                              ),
                            ),
                            20.heightBox,
                            Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  const Text(
                                    'Color:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey),
                                  ),
                                  60.widthBox,
                                  const Text(
                                    '- ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  5.widthBox,
                                  const Text(
                                    '0 ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  5.widthBox,
                                  const Text(
                                    '+',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  20.widthBox,
                                  const Text(
                                    '[ 0 available ]',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            20.heightBox,
                            Container(
                              color: Colors.greenAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Total:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          color: Colors.grey),
                                    ),
                                    60.widthBox,
                                    const Text(
                                      '\$0.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    20.heightBox,
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black54),
                            ),
                            5.heightBox,
                            const Text(
                              ' - Pure Item - Imported - Cash On Delivery',
                              style: TextStyle(color: Colors.blueGrey),
                            )
                          ],
                        ),
                      ),
                    ),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          itemDetailsButtonList.length,
                          (index) => Card(
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child:  ListTile(
                                title: Text(
                                  itemDetailsButtonList[index],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: const Icon(Icons.arrow_forward),
                              ),
                            ),
                          ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Product You May Also Likes', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                6,
                                    (index) => Card(
                                      child: Container(
                                  margin:
                                  const EdgeInsets.symmetric(horizontal: 4),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/mobile.jpg',
                                          width: 150,
                                          fit: BoxFit.fill,
                                        ),
                                        10.heightBox,
                                        const Text(
                                          'Mobile 4GB Ram/64GB Memory',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        10.heightBox,
                                        const Text(
                                          'Price 14000',
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                  ),
                                ),
                                    ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: (){},
              child: const Text('Add To Card',style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
