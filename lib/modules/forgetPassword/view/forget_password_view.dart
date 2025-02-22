import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/assets_app.dart';

import '../../../core/services/custom_button_widget.dart';
import '../../../core/services/custom_text_field.dart';
import '../../../core/theme/colors_app.dart';

class ForgetPasswordView  extends StatelessWidget {
  const ForgetPasswordView ({super.key});
  
  

  @override
  Widget build(BuildContext context) {
     final _emailController = TextEditingController();
    return  Scaffold(
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
          "Forget Password",
          style: TextStyle(
            color: ColorsApp.secondColor
          ),
        ),
        centerTitle: true,
      ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const  EdgeInsets.symmetric( horizontal: 8),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Image.asset(AssetsApp.forgetPasswordImg,
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: CustomTextField(
              
                        controller: _emailController,
                        hint: "Email",
                        hintColor: ColorsApp.white,
                        prefixIcon: ImageIcon(
                          AssetImage(AssetsApp.emailIcon),
                          color: ColorsApp.white,
                        ),
             ),
           ),
         
           CustomButtonWidget(buttonText: "Verify Email", onPressed: () {  }
      
           
           )
      
        ],),
      ),
    )
    );
  }
}