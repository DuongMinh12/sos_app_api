// import 'package:flutter/material.dart';
//
// import '../../constants/add_all.dart';
// import '../../widgets/widgets.dart';
//
// class WithdrawMoneyPage extends StatelessWidget {
//   const WithdrawMoneyPage({Key? key}) : super(key: key);
//   static String routeName = 'withdrawMoneyPage';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppbar(
//         title: 'Rút Tiền',
//       ),
//       bottomNavigationBar: BottomNaviga(),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: 140,
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.shade200,
//                     offset: Offset(0, 3),
//                     blurRadius: 7,
//                     //spreadRadius: 5
//                   )
//                 ],
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     height: 50,
//                     width: double.infinity,
//                     alignment: Alignment.centerLeft,
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(color: cologreya300, borderRadius: BorderRadius.circular(8)),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           child: Text(
//                             'Số dư:',
//                             style: txt16!.copyWith(fontWeight: FontWeight.bold),
//                           ),
//                           width: 60,
//                         ),
//                         Text(
//                           '5.00.000',
//                           style: txt16!.copyWith(color: Colors.black),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           'VND',
//                           style: txt16,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 50,
//                     width: double.infinity,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                         hintText: 'Số tiền cần rút',
//                         hintStyle: TextStyle(
//                           fontSize: 16,
//                         ),
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                         suffixIcon: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           width: 60,
//                           alignment: Alignment.centerRight,
//                           child: Text('VND', style: txt14,),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             BuildText(txttext: 'Thông tin tài khoản'),
//             DropdownButtonCustom(),
//             BuildTextFormField(hintext: 'Tên chủ tài khoản'),
//             BuildTextFormField(hintext: 'Số tài khoản'),
//             Center(
//               child: Container(
//                 width: 138,
//                 height: 47,
//                 margin: EdgeInsets.only(bottom: 13, top: 29),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     print('Confirm');
//                   },
//                   child: Text(
//                     'Confirm',
//                     style: txt18!.copyWith(color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: kMainColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       )),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
