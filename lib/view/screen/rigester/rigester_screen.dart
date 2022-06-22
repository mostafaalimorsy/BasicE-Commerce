import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiii/controller/auth/rigester/cubit.dart';
import 'package:iiii/controller/auth/rigester/states.dart';
import 'package:iiii/controller/service/cash_helper.dart';
import 'package:iiii/controller/service/componans.dart';
import 'package:iiii/controller/service/constant.dart';
import 'package:iiii/view/screen/home/home_screen.dart';
import 'package:iiii/view/widget/custom_widget/custom_auth_button.dart';
import 'package:iiii/view/widget/custom_widget/custom_textformfield_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class RigesterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwdcontroller = TextEditingController();
    var namecontroller = TextEditingController();
    var phonecontroller = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => ShopRigesterCubit(),
      child: BlocConsumer<ShopRigesterCubit, ShopAppRigesterStates>(
        listener: ( context,  state) {
          if (state is ShopAppScuccessRigesterStates) {
            if (state.getLogin.status == true) {

              print(state.getLogin.message);
              print(state.getLogin.data!.token);
              msgAlarm(
                msg: state.getLogin.message,
                textColor: Colors.black,
                states: ToastStates.SUCCESS,
              );

              CachHelper.saveData(key: 'token', value: state.getLogin.data?.token)
                  .then((value) {
                token = state.getLogin.data?.token;
                print("token saved");
                navigatReplace(context, HomeScreen());
              });
            } else {
              print(state.getLogin.message);
              msgAlarm(
                msg: state.getLogin.message,
                textColor: Colors.white,
                states: ToastStates.ERROR,
              );
            }
          }
        },
        builder: ( context,  state) {
          ShopRigesterCubit getData = ShopRigesterCubit.get(context);
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
                            //title of screen
                            Text(
                              "Sign-up",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(color: Colors.black),
                            ),
                            //DEscription of screen
                            Text(
                              "Sign-up to browse our hot offers",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 30,
                            ),
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
                            //phone
                            defaultTextForm(
                                msg: 'please enter your phone',
                                type: TextInputType.phone,
                                labelText: "phone",
                                hintText: "01xxxxxxxxx",
                                controller: phonecontroller,
                                icon: Icons.phone),
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
                            //password
                            defaultTextForm(
                              onSubmitted: (value) {
                                if (formKey.currentState!.validate()) {
                                  getData.getLogin(
                                      email: emailcontroller.text,
                                      password: passwdcontroller.text,
                                    phone: phonecontroller.text ,
                                    name: namecontroller.text,

                                  );
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
                              condition: state is ShopAppRigesterStates,
                              builder: (BuildContext context) {
                                return authButton(
                                    context: context,
                                    authButtonText: "Sign-up",
                                    onpressed: () {
                                      if (formKey.currentState!.validate()) {
                                        getData.getLogin(
                                            name: namecontroller.text,
                                            phone: phonecontroller.text,
                                            email: emailcontroller.text,
                                            password: passwdcontroller.text);
                                        print(emailcontroller.text);
                                        print(passwdcontroller.text);
                                      }
                                      // Navigator.pop(context);

                                    });
                              },
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(
                              height: 15,
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
