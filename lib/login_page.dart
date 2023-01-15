
import 'package:flutter/material.dart';
import 'routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
   {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(

        child: Form(
          key: _formKey,
          child: Column(
            children:[
              Image.asset(
                "login_image.png", 
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0,),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                 child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText:"Enter username",
                        labelText: "Username", 
                      ),
                      validator: (value)
                      {
                        if(value == null)
                        {return "Username cannot be empty";}
                      },
                      onChanged: (value){
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText:"Enter password",
                        labelText: "Password", 
                      ),
                      validator : (value)
                      {
                        if(value== null){
                          return "Password cannot be Empty";
                        }
                        if(value.length<6){
                          return "Password too short. Try a bigger one!";
                        }
                      }
                    ),
                    const SizedBox(height: 40.0,),
              
              
              
              
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                      BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                      onTap: () async{
                        setState(() {
                          changeButton = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        // ignore: use_build_context_synchronously
                        await Navigator.pushNamed(context, MyRoutes.homeRoute);
                        setState(() {
                          changeButton = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration:const Duration(seconds: 1),
                        width: changeButton ? 50:150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                        ? const Icon(
                          Icons.done,
                          color: Colors.white,
                          )
                          : const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                            ),
                          )
                        ),
                    )
                  ],
                ),
                )
              
            ],
          ),
        ),
      ));
   }
}
           