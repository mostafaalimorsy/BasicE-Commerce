// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iiii/controller/Auth/cubit/cubit.dart';
// import 'package:iiii/controller/Auth/cubit/states.dart';
// import 'package:iiii/view/screen/rigester_screen.dart';
// import 'package:iiii/view/widget/custom_auth_button.dart';
// import 'package:iiii/view/widget/custom_text_buton.dart';
// import 'package:iiii/view/widget/custom_textformfield_widget.dart';
//
// Widget loginWidget(context  , VoidCallback? onpressed) {
//
//   var emailcontroller = TextEditingController();
//   var passwdcontroller = TextEditingController();
//   return BlocConsumer <ShopLoginCubit ,ShopAppLoginStates  >(
//     listener: (BuildContext context, ShopAppLoginStates state) {  },
//     builder: (BuildContext context, ShopAppLoginStates state) {
//       ShopLoginCubit getData = ShopLoginCubit.get(context);
//       return  Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "LOGIN",
//               style: Theme.of(context).textTheme.headline4?.copyWith(
//                   color: Colors.black
//               ),
//             ),
//             Text(
//               "Login now to browse our hot offers",
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyText1
//                   ?.copyWith(color: Colors.grey),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             //Auth
//             defaultTextForm(
//                 msg: 'please enter your e-mail',
//                 type: TextInputType.emailAddress,
//                 labelText: "Email",
//                 hintText: "text@email.com",
//                 controller: emailcontroller,
//                 icon: Icons.email_outlined
//             ),
//
//             SizedBox(
//               height: 15,
//             ),
//             //password
//             defaultTextForm(
//               msg: 'please enter your password',
//               type: TextInputType.visiblePassword,
//               labelText: "password",
//               hintText: "******",
//               controller: passwdcontroller,
//               icon: Icons.lock_outline,
//               passwd: false,
//               visableIcon: Icons.visibility_outlined,
//
//             ),
//
//             SizedBox(
//               height: 15,
//             ),
//             authButton(
//                 context: context,
//                 authButtonText: "Login",
//               onpressed: () {
//
//
//
//       }
//               ),
//             SizedBox(
//               height: 15,
//             ),
//             //Rigester button
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Don\'t have an account?"),
//                 CustomTextButton(context: context,route: RigeterScreen(),text: "RIGESTER"),
//               ],
//             ),
//
//           ],
//         ),
//       );
//     },
//
//   );
// }
