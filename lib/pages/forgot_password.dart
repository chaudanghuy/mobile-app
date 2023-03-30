import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:wordpress_app/services/auth_service.dart';
import 'package:wordpress_app/utils/dialog.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  var formKey = GlobalKey<FormState>();
  var emailCtrl = TextEditingController();
  final RoundedLoadingButtonController _btnCtlr =
      RoundedLoadingButtonController();

  void _handleSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      resetPassword(emailCtrl.text);
    }
  }

  Future<void> resetPassword(String email) async {
    _btnCtlr.start();
    FocusScope.of(context).unfocus();
    await AuthService.sendPasswordResetEmail(email).then((value) {
      if (value) {
        _btnCtlr.success();
        openDialog(context, 'Sent Successfully!',
            'An password reset email has been sent to $email. Go to that link & reset your password and login using the new password');
      } else {
        _btnCtlr.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'reset-password',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.7,
                    wordSpacing: 1,
                    color: Theme.of(context).colorScheme.primary),
              ).tr(),
              Text('follow the simple steps',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.secondary))
                  .tr(),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'username@mail.com', labelText: 'Email'),
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value!.isEmpty) return "Email can't be empty";
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              RoundedLoadingButton(
                animateOnTap: false,
                child: Wrap(
                  children: [
                    Text(
                      'submit',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ).tr()
                  ],
                ),
                controller: _btnCtlr,
                onPressed: () => _handleSubmit(),
                width: MediaQuery.of(context).size.width * 1.0,
                color: Theme.of(context).primaryColor,
                elevation: 0,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
