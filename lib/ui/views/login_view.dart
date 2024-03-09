import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 370),
          child: Form(
            child: Column(
              children: [
                //Email
                TextFormField(
                  // validator: (),
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.authbuildInputDecoration(
                      label: 'Email', icon: Icons.email_outlined),
                ),
                //Password
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // validator: (),
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.authbuildInputDecoration(
                      label: 'Password', icon: Icons.lock_outline_rounded),
                ),

                const SizedBox(
                  height: 20,
                ),
                CustomOutlinedButton(onPressed: () {}, text: 'Ingresar'),

                const SizedBox(
                  height: 20,
                ),

                LinkText(
                    text: 'Nueva Cuenta',
                    onPressed: () {
                      Navigator.pushNamed(context, Flurorouter.registerRouter);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
