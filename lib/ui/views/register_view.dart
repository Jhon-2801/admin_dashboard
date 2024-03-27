import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);
        return Container(
          margin: const EdgeInsets.only(top: 60),
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 400),
              child: Form(
                key: registerFormProvider.fromKey,
                child: Column(
                  children: [
                    //Nombre
                    TextFormField(
                      onChanged: (value) => registerFormProvider.name = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El campo es requerido';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInput.authbuildInputDecoration(
                          label: 'Nombre',
                          icon: Icons.supervised_user_circle_sharp),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Email
                    TextFormField(
                      onChanged: (value) => registerFormProvider.email = value,
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) {
                          return 'Email no valido';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInput.authbuildInputDecoration(
                          label: 'Email', icon: Icons.email_outlined),
                    ),
                    //Password
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) =>
                          registerFormProvider.password = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese su contraseña";
                        }
                        if (value.length < 6) {
                          return "La contraseña debe de ser mayor a 6 caracteres";
                        }
                        return null;
                      },
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
                          final validFrom = registerFormProvider.validateForm();
                          if (!validFrom) return;

                          final authProvider =
                              Provider.of<AuthProvider>(context, listen: false);

                          authProvider.register(
                              registerFormProvider.email,
                              registerFormProvider.password,
                              registerFormProvider.name);
                        },
                        text: 'Crear cuenta'),

                    const SizedBox(
                      height: 20,
                    ),

                    LinkText(
                        text: 'Login',
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
}
