
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:userflowerstore/app_router.dart';
// import 'package:userflowerstore/models/category.dart';
// import 'package:userflowerstore/provider/provider.dart';
// import 'package:userflowerstore/views/colors.dart';

// class CollectionTile extends StatelessWidget {
//   // const CollectionTile({Key? key,}) : super(key: key);
//   Category? cateogory;
//   CollectionTile(this.cateogory);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FireStoreProvider>(builder: (context, provider, x) {
//       return InkWell(
//         onTap: () {
//           provider.getAllProduct(cateogory!.catId!);
//           //AppRouter.NavigateToWidget((CookiePage(cateogory!.catId!)));
//         },
//         child: Padding(
//             padding: EdgeInsets.all(13),
//             child: Row(children: <Widget>[
//               Container(
//                 width: 50,
//                 height: 180,
//                 margin: const EdgeInsets.only(right: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         Icons.delete,
//                         color: HexColore.fromHex('343e4b'),
//                       ),
//                       onPressed: () {
//                         provider.deleteCategory(cateogory!);
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.edit,
//                         color: HexColore.fromHex('343e4b'),
//                       ),
//                       onPressed: () {
//                         Provider.of<FireStoreProvider>(context, listen: false)
//                             .categoryNameController
//                             .text = cateogory!.name!;
//                         AppRouter.NavigateToWidget(EditCategory(
//                           category: cateogory!,
//                         ));

//                         // AppRouter.NavigateToWidget(EditCategory(
//                         //   category: cateogory!,
//                         // )

//                         // );
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.add,
//                         color: HexColore.fromHex('343e4b'),
//                       ),
//                       onPressed: () {
//                         AppRouter.NavigateToWidget(AddProduct(
//                           Catid: cateogory!.catId.toString(),
//                         ));
//                       },
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                   child: Container(
//                 height: 180,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                         image: NetworkImage(cateogory!.imageUrl),
//                         fit: BoxFit.cover)),
//                 child: Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       gradient: LinearGradient(colors: [
//                         Colors.black.withOpacity(.4),
//                         Colors.black.withOpacity(.1),
//                       ])),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         cateogory!.name!,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ))
//             ])),
//       );
//     });
//   }
// }
