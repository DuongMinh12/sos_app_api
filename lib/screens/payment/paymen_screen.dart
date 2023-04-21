// import 'package:flutter/material.dart';
//
// import '../../constants/add_all.dart';
// import '../../widgets/widgets.dart';
//
// class PaymentPage extends StatelessWidget {
//   const PaymentPage({Key? key}) : super(key: key);
//   static String routeName = 'paymentPage';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppbar(
//         title: 'Nạp Tiền',
//       ),
//       bottomNavigationBar: BottomNaviga(),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             BuildText(txttext: 'Phương thức thanh toán'),
//             DropdownButtonCustom(),
//             BuildText(txttext: 'Thông tin tài khoản'),
//             BuildTextFormField(hintext: 'Tên chủ tài khoản'),
//             BuildTextFormField(hintext: 'Số tài khoản'),
//             BuildTextFormField(hintext: 'Số tiền cần nạp'),
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
