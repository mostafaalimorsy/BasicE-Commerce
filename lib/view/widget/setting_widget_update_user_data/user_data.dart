import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/service/cash_helper.dart';
import 'package:iiii/controller/service/componans.dart';
import 'package:iiii/controller/service/constant.dart';
import 'package:iiii/controller/shop/cubit/cubit.dart';
import 'package:iiii/controller/shop/cubit/states.dart';
import 'package:iiii/view/screen/login/login_screen.dart';
import 'package:iiii/view/widget/custom_widget/custom_auth_button.dart';
import 'package:iiii/view/widget/custom_widget/custom_textformfield_widget.dart';

Widget UserData(context) {
  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  return BlocConsumer<ShopCubit, ShopStates>(
    listener: (BuildContext context, ShopStates state) {},
    builder: (BuildContext context, ShopStates state) {

      var model = ShopCubit.get(context).UserModel;
      token=model!.data!.token;
      namecontroller.text = model.data!.name!;
      emailcontroller.text = model.data!.email!;
      phonecontroller.text = model.data!.phone!;
      ShopCubit getData = ShopCubit.get(context);
      return ConditionalBuilder(
        condition: getData.UserModel != null,
        fallback: (BuildContext context) => CircularProgressIndicator(),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //name
                defaultTextForm(
                    msg: 'please enter your Name',
                    type: TextInputType.name,
                    labelText: "Name",
                    hintText: "Test",
                    controller: namecontroller,
                    icon: Icons.person),
                SizedBox(
                  height: 15,
                ),
                //login
                defaultTextForm(
                    msg: 'please enter your e-mail',
                    type: TextInputType.emailAddress,
                    labelText: "Email",
                    hintText: "text@email.com",
                    controller: emailcontroller,
                    icon: Icons.email_outlined),

                SizedBox(
                  height: 15,
                ),
                //phone
                defaultTextForm(
                    msg: 'please enter your phone',
                    type: TextInputType.phone,
                    labelText: "phone",
                    hintText: "01xxxxxxxxx",
                    controller: phonecontroller,
                    icon: Icons.phone),
                SizedBox(
                  height: 20,
                ),
                authButton(
                  context: context,
                  authButtonText: "Update Data",
                  onpressed: () {
                    CachHelper.clearData(key: 'token').then(
                            (value) => navigatReplace(context, LoginScreen()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),

                authButton(
                  context: context,
                  authButtonText: "Sign out",
                  onpressed: () {
                    CachHelper.clearData(key: 'token').then(
                        (value) => navigatReplace(context, LoginScreen()));
                  },
                ),



              ],
            ),
          );
        },
      );
    },
  );
}
