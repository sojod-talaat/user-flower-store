import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userflowerstore/app_router.dart';
import 'package:userflowerstore/provider/provider.dart';
import 'package:userflowerstore/views/shared_component.dart';
import 'package:userflowerstore/views/sign_up.dart';

class LoginScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  bool _secirty = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, Provider, x) {
      return Scaffold(
          body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image(image: AssetImage('assets/images/welcome.png'),),
                  const Text(
                    'Login Now ',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text('login now to browse our hot offers',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF8D8E98),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: defulutTextFormFild(
                      style: Theme.of(context).textTheme.bodyText2,
                      controller: Provider.loginemailcontroller,
                      type: TextInputType.emailAddress,
                      labeltext: 'Email Adress',
                      hintText: 'Enter Email Adress',
                      //    obscureText: !_secirty,
                      prefix: Icon(
                        Icons.email,
                        color: const Color(0xFF031956),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: defulutTextFormFild(
                        style: Theme.of(context).textTheme.bodyText2,
                        controller: Provider.loginpasswordcontroller,
                        //LoginCubit.get(context).passwordController,
                        type: TextInputType.text,
                        labeltext: 'Password',
                        hintText: 'Enter Password',
                        //obscureText: LoginCubit.get(context).secirty,
                        onSubmited: (value) {
                          // if (formkey.currentState.validate()) {
                          //   print(LoginCubit.get(context)
                          //       .passwordController
                          //       .text);
                          //   LoginCubit.get(context).UserLogin(
                          //       LoginCubit.get(context)
                          //           .emailController
                          //           .text,
                          //       LoginCubit.get(context)
                          //           .passwordController
                          //           .text);

                          //   NavigateTo(
                          //       router: HomeLayout(), context: context);
                          // }
                        },
                        prefix: const Icon(
                          Icons.lock,
                          color: Color(0xFF031956),
                        ),
                        //suffix: LoginCubit.get(context).suffix,
                        suffixFun: () {
                          // LoginCubit.get(context)
                          //   .ChangePasswordVisibility();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value.length <= 5) {
                            return 'Please enter long password';
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // ConditionalBuilder(
                  //   condition: state is! LoginLoadingState,
                  //   builder: (context) =>

                  defultMaterialButton(
                    height: 50,
                    width: 250,
                    text: 'LOGIN',
                    function: () {
                      Provider.Signin();
                    },
                  ),
                  //   fallback: (context) => CircularProgressIndicator(),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account ?',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF8D8E98),
                          )),
                      defultTextButton(
                        text: 'Sign Up...',
                        onPressed: () {
                          AppRouter.NavigateWithReplacemtnToWidget(
                              SignupScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    });
  }
}
