import 'package:flutter/material.dart';
import '../../../core/routes/screens_route_name.dart';
import '../../../core/utils/firebase_services.dart';
import '../../../core/constants/assets_app.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../core/extentions/validate.dart';
import '../../../core/services/custom_button_widget.dart';
import '../../../core/services/custom_text_field.dart';
import '../../../core/theme/colors_app.dart';
import '../../forgetPassword/view/forget_password_view.dart';
import '../../signUp/view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AssetsApp.logoSplash,
                  height: 0.20 * height,
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 18),
                CustomTextField(
                  controller: _passwordController,
                  isPassword: true,
                  maxLines: 1,
                  hint: "Password",
                  hintColor: ColorsApp.white,
                  prefixIcon: ImageIcon(
                    AssetImage(AssetsApp.passwordIcon),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetPasswordView()),
                      );
                    },
                    child: Text(
                      "Forget Password?",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: ColorsApp.secondColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                CustomButtonWidget(
                  onPressed: () {
                      if (_formKey.currentState!.validate()) {
                       FirebaseServices.signIn(
                             _emailController.text, _passwordController.text)
                        .then((value) {
                       EasyLoading.dismiss();
                       if (value) {
                        Navigator.pushNamedAndRemoveUntil(context,
                            ScreenRouteName.profileView, (route) => false);
                      }
                    }
                     );
                     }
                  },
                  buttonText: "Login",
                ),
                const SizedBox(height: 10),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t Have Account? ",
                        style: theme.textTheme.titleMedium
                            ?.copyWith(color: ColorsApp.white),
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpView(),
                              ),
                            );
                          },
                          child: Text(
                            "Create One",
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
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: ColorsApp.secondColor,
                        indent: 30,
                        endIndent: 30,
                      ),
                    ),
                    Text(
                      "OR",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: ColorsApp.secondColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: ColorsApp.secondColor,
                        indent: 30,
                        endIndent: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Google login
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorsApp.secondColor,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Image.asset(
                           AssetsApp.googleIcon,
                           height: 0.03 * height,
                          ),
                          const SizedBox(width: 12),
                        Text(
                          "Login With Google",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 140),
                  //  child: CustomContainerWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
