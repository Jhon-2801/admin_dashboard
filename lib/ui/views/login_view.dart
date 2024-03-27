import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFromProvider(),
      child: Builder(builder: (context) {
        final loginFromProvider =
            Provider.of<LoginFromProvider>(context, listen: false);
        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 370),
              child: Form(
                key: loginFromProvider.fromKey,
                child: Column(
                  children: [
                    //Email
                    TextFormField(
                      onFieldSubmitted: (_) =>
                          {onFormSubmit(loginFromProvider, authProvider)},
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) {
                          return 'Email no valido';
                        }
                        return null;
                      },
                      onChanged: (value) => loginFromProvider.email = value,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInput.authbuildInputDecoration(
                          label: 'Email', icon: Icons.email_outlined),
                    ),
                    //Password
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onFieldSubmitted: (_) =>
                          {onFormSubmit(loginFromProvider, authProvider)},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese su contraseña";
                        }
                        if (value.length < 6) {
                          return "La contraseña debe de ser mayor a 6 caracteres";
                        }
                        return null;
                      },
                      onChanged: (value) => loginFromProvider.password = value,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInput.authbuildInputDecoration(
                          label: 'Password', icon: Icons.lock_outline_rounded),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    CustomOutlinedButton(
                        onPressed: () {
                          onFormSubmit(loginFromProvider, authProvider);
                        },
                        text: 'Ingresar'),

                    const SizedBox(
                      height: 20,
                    ),

                    LinkText(
                        text: 'Nueva Cuenta',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Flurorouter.registerRouter);
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void onFormSubmit(
      LoginFromProvider loginFromProvider, AuthProvider authProvider) {
    final isValid = loginFromProvider.validateForm();
    if (isValid) {
      authProvider.login(loginFromProvider.email, loginFromProvider.password);
    }
  }
}
