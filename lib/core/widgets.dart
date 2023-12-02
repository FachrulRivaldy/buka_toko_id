// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:bukatokoid/utils/constants.dart';
import 'package:flutter/material.dart';

class PrimaryForm extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final IconData? suffixIcon1;
  final IconData? suffixIcon2;
  final double width;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  bool isObscure;
  PrimaryForm(
      {Key? key,
      this.hintText,
      this.suffixIcon1,
      this.suffixIcon2,
      this.prefixIcon,
      this.isObscure = false,
      this.width = 300,
      required this.controller,
      this.keyboardType})
      : super(key: key);

  @override
  State<PrimaryForm> createState() => _PrimaryFormState();
}

class _PrimaryFormState extends State<PrimaryForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText: widget.isObscure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: IconButton(
              icon: Icon(
                widget.isObscure ? widget.suffixIcon1 : widget.suffixIcon2,
              ),
              onPressed: () {
                setState(() {
                  widget.isObscure = !widget.isObscure;
                });
              },
            ),
          )),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFF5E73E1)),
          minimumSize: MaterialStateProperty.all(const Size(250, 55)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
      onPressed: onPressed,
      child:
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 24)),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget image;
  final VoidCallback onPressed;
  const SecondaryButton(
      {Key? key, required this.image, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: onPressed,
        child: image,
      ),
    );
  }
}

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

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile(
      {Key? key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: const TextStyle(fontSize: 16),
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

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void showModal(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: const Text('Sorry, this feature is not available yet'),
      actions: <TextButton>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        )
      ],
    ),
  );
}

TextStyle linkText() {
  return const TextStyle(color: Color(0xFF5E73E1));
}

TextStyle titleText() {
  return const TextStyle(fontSize: 36, fontWeight: FontWeight.w500);
}
