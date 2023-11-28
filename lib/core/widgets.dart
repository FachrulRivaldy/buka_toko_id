// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bukatokoid/utils/constants.dart';
import 'package:flutter/material.dart';

class BuildCarousel extends StatelessWidget {
  final String imageUrl;
  final String name;
  const BuildCarousel({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 150),
              decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: NetworkImage(imageUrl)))),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Align(
                child: Text(
                  "\$$price",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}

class OrderHistoryButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressedFunction;
  const OrderHistoryButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressedFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressedFunction,
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(75, 75),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              backgroundColor: primaryColor),
          child: Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(height: 4),
        Text(text),
      ],
    );
  }
}
