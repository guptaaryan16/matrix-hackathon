
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
      color: Color(0xFF0D0D0D),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children:[
              Image.asset(
                "Matrix.png", 
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0,),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  color: Color(0xFFA66394),
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
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3 , color: Color(0xFFA66394),
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xFF181E26),
                        hintText:"Enter username",
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: "Username",
                        labelStyle: TextStyle(color: Color(0xFFA66394)), 
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
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3 , color: Color(0xFFA66394),
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xFF181E26),
                        hintText:"Enter password",
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Color(0xFFA66394)), 
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
                      color: Color(0xFFA66394),
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
           