import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:userflowerstore/models/category.dart';
import 'package:userflowerstore/models/product.dart';
import 'package:userflowerstore/models/siLder.dart';
import 'package:userflowerstore/provider/provider.dart';
import 'package:userflowerstore/views/colors.dart';
import 'package:userflowerstore/views/productview.dart';
import '../app_router.dart';

class UserPage extends StatefulWidget {
 // const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
  int activeindex=0;
}

class _UserPageState extends State<UserPage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Consumer<AuthProvider>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Main Screen',
                style: GoogleFonts.dancingScript(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              elevation: 0.0,
              centerTitle: true,
              leading: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
              // actions: [
              //   IconButton(
              //       onPressed: () {
              //         value.signout();
              //       },
              //       icon: Icon(
              //         Icons.logout,
              //         color: Colors.black,
              //       ))
              // ],
            ),
            body: Consumer<FireStoreProvider>(
                builder: (context, value, child) => value
                            .imagesliderslist.isEmpty &&
                        value.categories.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 35.0, top: 1.0),
                                    child: Text('Hello, take a look!',
                                        style: GoogleFonts.dancingScript(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  CarouselSlider.builder(

                                      carouselController: CarouselController(),
                                      itemCount: value.imagesliderslist.length,
                                      itemBuilder: (context, index, x) {
                                        return UserSliderWidget(
                                            value.imagesliderslist[index]);
                                      },
                                      options: CarouselOptions(
                                        onPageChanged: (index, reson)=>setState(()=>widget.activeindex=index),

                                        autoPlay: true,
                                        height: 190,
                                        enlargeCenterPage: true,
                                        viewportFraction: .9,
                                        aspectRatio: 1.0,
                                        initialPage: 0,
                                      )),
                                  SizedBox(height: 12,),
                                  buildindector(),

                                ],
                              ),
                              // Padding(
                              //   padding: EdgeInsets.all(20.0),
                              //   child: Row(
                              //     children: [
                              //       Text('Categories',
                              //           style: GoogleFonts.dancingScript(
                              //               fontSize: 30.0,
                              //               fontWeight: FontWeight.bold)),
                              //       // Spacer(),
                              //       // Row(
                              //       //   children: [
                              //       //     IconButton(
                              //       //         onPressed: () {},
                              //       //         icon: Icon(
                              //       //           Icons.arrow_forward_ios,
                              //       //           color:
                              //       //               HexColore.fromHex('#f8e3e2'),
                              //       //         ))
                              //       //   ],
                              //       // )
                              //     ],
                              //   ),
                              // ),
                             const  SizedBox(height: 10.0),
                              Container(
                                height: 60,
                                padding: EdgeInsets.only(left: 20),
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: value.categories.length,
                                    itemBuilder: (context, index) =>
                                        categoryui(value.categories[index])),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 18.0, left: 20),
                                child: Row(
                                  children: [
                                    Text('Product ',
                                        style: GoogleFonts.dancingScript(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold)),
                                    const Spacer(),
                                    Row(
                                      children: [

                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  HexColore.fromHex('#f8e3e2'),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 15.0,
                                        childAspectRatio: 0.8,
                                        crossAxisCount: 2),
                                // crossAxisCount: 2,
                                primary: false,
                                itemCount: value.products.length,
                                itemBuilder: (context, index) {
                                  return _buildCard(
                                    value.products[index],
                                    false,false
                                  );
                                },
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ]),
                      )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xFF031956),
            child: Icon(
              Icons.card_giftcard,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );

  }
  Widget buildindector(){
    return Consumer<FireStoreProvider>(
      builder: (context, value, child) =>

      AnimatedSmoothIndicator(
        activeIndex: widget.activeindex,
        count: value.imagesliderslist.length ,

        effect:  WormEffect(
          dotWidth: 23,
          radius: 40,
          dotColor: HexColore.fromHex('#f8e3e2'),
        ),
      ),
    )  ;

  }
}

class buildCard2 extends StatelessWidget {
  Product product;
  buildCard2(this.product);
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context, value, child) => InkWell(
            onTap: () {
              AppRouter.NavigateToWidget(CookieDetail(
                product: product,
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20),

              child: Column(
                children: [
                  Container(

                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(product.imageUrl!),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        color: Colors.white),
                  ),
                  Center(
                    child: Text(product.description!),
                  )
                ],
              ),
            )));
  }
}
class UserSliderWidget extends StatelessWidget {
  Silderitem imageSilder;
  UserSliderWidget(this.imageSilder);
  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
      //height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(imageSilder.imagesliderUrl),
              fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(.4),
              Colors.black.withOpacity(.1),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              imageSilder.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class categoryui extends StatelessWidget {
  Category category;
  categoryui(this.category);
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context, value, child) => InkWell(
              onTap: () {
                value.getAllProduct(category.catId!);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 30,
                   width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: .9,
                          color: const Color(0xFF031956),
                      )),
                  child:

                      Center(child: Text(category.name!, style: GoogleFonts.dancingScript(fontWeight: FontWeight.bold),)),

                ),
              ),
            ));
  }
}
Widget _buildCard(  Product product, bool added,
    bool isFavorite) {
  return InkWell(
      onTap: () {
        AppRouter.NavigateToWidget(CookieDetail(
          product: product,
        ));
      },
      child: Container(
        margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(children: [
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      isFavorite
                          ? Icon(Icons.favorite, color:  const Color(0xFF031956),
                      )
                          : Icon(Icons.favorite_border,
                          color:  const Color(0xFF031956),)
                    ])),
            Hero(
                tag: product,
                child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(product.imageUrl!),
                            fit: BoxFit.contain)))),
            SizedBox(height: 7.0),
            Text(product.price.toString(),
                style: TextStyle(
                    color:  const Color(0xFF031956),
                    fontFamily: 'Varela',
                    fontSize: 14.0)),
            Text(product.description!,
                style: TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 14.0)),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
            Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!added) ...[
                        const Icon(Icons.shopping_basket,
                            color: const Color(0xFF031956), size: 12.0),
                      const   Text('Add to cart',
                            style: TextStyle(

                                color: const Color(0xFF031956),
                                fontSize: 12.0))
                      ],

                      ]
                    ))
          ])));
}

