import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iiii/view/screen/rigester_screen.dart';
import 'package:iiii/view/widget/custom_auth_button.dart';
import 'package:iiii/view/widget/custom_text_buton.dart';
import 'package:iiii/view/widget/custom_textformfield_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../controller/auth/login/cubit/cubit.dart';
import '../../controller/auth/login/cubit/states.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwdcontroller = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopAppLoginStates>(
        listener: (BuildContext context, ShopAppLoginStates state) {},
        builder: (BuildContext context, ShopAppLoginStates state) {
          ShopLoginCubit getData = ShopLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
                child: SingleChildScrollView(
                    child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LOGIN",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.black),
                    ),
                    Text(
                      "Login now to browse our hot offers",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 30,
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
                    //password
                    defaultTextForm(
                      onSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          getData.postLogin(
                              email: emailcontroller.text,
                              password: passwdcontroller.text);
                          print(emailcontroller.text);
                          print(passwdcontroller.text);
                        }
                      },
                      msg: 'please enter your password',
                      type: TextInputType.visiblePassword,
                      labelText: "password",
                      hintText: "******",
                      controller: passwdcontroller,
                      icon: Icons.lock_outline,
                      passwd: getData.password,
                      onTap: (){
                        getData.changPasswordVisiability();
                      },
                      visableIcon: getData.suffix,
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    //Login  Button
                    ConditionalBuilder(
                      condition: state is! ShopAppLoadingStates,
                      builder: (BuildContext context) {
                        return authButton(
                            context: context,
                            authButtonText: "Login",
                            onpressed: () {
                              if (formKey.currentState!.validate()) {
                                getData.postLogin(
                                    email: emailcontroller.text,
                                    password: passwdcontroller.text);
                                print(emailcontroller.text);
                                print(passwdcontroller.text);
                              }
                            });
                      },
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //Rigester button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don\'t have an account?"),
                        CustomTextButton(
                            context: context,
                            route: RigeterScreen(),
                            text: "RIGESTER"),
                      ],
                    ),
                  ],
                ),
              ),
            ))),
          );
        },
      ),
    );
  }
}
