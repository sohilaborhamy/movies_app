
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/constants/assets_app.dart';
import '../../../core/extentions/validate.dart';
import '../../../core/routes/screens_route_name.dart';
import '../../../core/services/custom_button_widget.dart';
import '../../../core/services/custom_language_widget.dart';
import '../../../core/services/custom_text_field.dart';
import '../../../core/theme/colors_app.dart';
import '../../../core/utils/firebase_services.dart';
import '../../login/view/login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
 final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    var theme = Theme.of(context);
   
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsApp.secondColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Register",
          style: TextStyle(
            color: ColorsApp.secondColor
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               
                const SizedBox(height: 30),
                CustomTextField(
                  controller: _nameController,
                  hint: "Name",
                  hintColor: ColorsApp.white,
                  prefixIcon: ImageIcon(
                    AssetImage(AssetsApp.nameIcon),
                    color: ColorsApp.white,
                  ),
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _emailController,
                  hint: "Email",
                  hintColor: ColorsApp.white,
                  prefixIcon: ImageIcon(
                    AssetImage(AssetsApp.emailIcon),
                    color: ColorsApp.white,
                  ),
                 onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                     return "Please enter your  e-mail";
                    }
                  if (!Validations.validateEmail(value)) {
                      return "please enter your a valid e-mail";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _passwordController,
                  isPassword: true,
                  maxLines: 1,
                  hint: "Password",
                  hintColor: ColorsApp.white,
                  prefixIcon: ImageIcon(
                    AssetImage(AssetsApp.hideIcon),
                    color: ColorsApp.white,
                  ),
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your  password";
                   }
                   if (!Validations.validatePassword(value)) {
                     return "please enter your a valid password";
                    }
                   return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  isPassword: true,
                  maxLines: 1,
                  hint: "Confirm Password",
                  hintColor: ColorsApp.white,
                  prefixIcon: ImageIcon(
                    AssetImage(AssetsApp.hideIcon),
                    color: ColorsApp.white,
                  ),
                onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                     return "Please enter your  password";
                    }
                    if (value != _passwordController.text) {
                     return "re password not match";
                    }
                   return null;
                  },
                ),
                 const SizedBox(height: 15),
                 CustomTextField(
                 controller: _phoneController   ,
                  hint: "Phone Number",
                 hintColor: ColorsApp.white,
                 prefixIcon: ImageIcon(
                    AssetImage(AssetsApp.phoneIcon),
                    color: ColorsApp.white,
                  ),
                   onValidate: (value) {
                   if (value == null || value.trim().isEmpty) {
                     return "Please enter your phone number";
                    }
                   return null;
                  },
                 ),
                const SizedBox(height: 15),
                CustomButtonWidget(
                 onPressed: () {
                   if (_formKey.currentState!.validate()) {
                      FirebaseServices.signUp(
                             _emailController.text, _passwordController.text)
                          .then((value) {
                        EasyLoading.dismiss();
                       if (value) {
                         Navigator.pushNamedAndRemoveUntil(context,
                             ScreenRouteName.loginView, (route) => false);
                        }
                     });
                    }
                 },
                  buttonText: "Create Account",
                ),
                const SizedBox(height: 10),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already Have Account? ",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color : ColorsApp.white
                        ),
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: ColorsApp.secondColor,
                              fontWeight: FontWeight.bold,
                            
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 135),
                  child: CustomLanguageWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}  