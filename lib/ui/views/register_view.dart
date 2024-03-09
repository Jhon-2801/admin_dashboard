import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 370),
          child: Form(
            child: Column(
              children: [
                //Nombre
                TextFormField(
                  // validator: (),
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.authbuildInputDecoration(
                      label: 'Nombre',
                      icon: Icons.supervised_user_circle_sharp),
                ),
                const SizedBox(height: 20,),

                //Email
                TextFormField(
                  // validator: (),
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.authbuildInputDecoration(
                      label: 'Email',
                      icon: Icons.email_outlined),
                ),
                //Password
                const SizedBox(height: 20,),
                TextFormField(
                  // validator: (),
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.authbuildInputDecoration(
                      label: 'Password',
                      icon: Icons.lock_outline_rounded),
                ),

                const SizedBox(height: 20,),
                CustomOutlinedButton(onPressed: (){}, text: 'Crear cuenta'),

                const SizedBox(height: 20,),

                LinkText(text: 'Login', onPressed: (){
                      Navigator.pushNamed(context, Flurorouter.loginRouter);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
