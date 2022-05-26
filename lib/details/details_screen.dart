import 'package:flutter/material.dart';
import 'package:flutter_betta_fish/constants.dart';
import 'package:flutter_betta_fish/models/product.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'Back'.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/cart_with_item.svg'))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '${product.id}',
                      child: FishPoster(
                        size: size,
                        image: product.image,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ColorDot(
                        fillColor: Color(0xFF80989A),
                        isSelected: true,
                      ),
                      ColorDot(
                        fillColor: Color(0xFFFF5200),
                        isSelected: false,
                      ),
                      ColorDot(
                        fillColor: kPrimaryColor,
                        isSelected: false,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      product.title,
                      style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(58, 7, 81, 1),),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 2,
                    ),
                    child: Text(
                      product.description,
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(kDefaultPadding),
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding / 2,
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(58, 7, 81, 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/chat.svg",
                    height: 18,
                  ),
                  SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                  Text(
                    "Chat",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  FlatButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/shopping-bag.svg",
                        height: 18),
                    label: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.fillColor,
    this.isSelected = false,
  }) : super(key: key);

  final Color fillColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
      padding: EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Color(0xFF707070) : Colors.transparent,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
        ),
      ),
    );
  }
}

class FishPoster extends StatelessWidget {
  const FishPoster({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: size.width * 0.8,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 232, 215, 1),
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(
            image,
            height: size.width * 0.75,
            width: size.width * 0.75,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
