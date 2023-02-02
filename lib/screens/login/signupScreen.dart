

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:makeframes/constant/widgets.dart';
import 'package:makeframes/provider/signinProvdr.dart';
import 'package:makeframes/screens/login/loginscreen.dart';
import 'package:provider/provider.dart';


class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});

  
    
  GlobalKey<FormState> formKey = GlobalKey();    
  @override
  Widget build(BuildContext context) { 
   final provider =   Provider.of<SignInProvdr>(context,listen: false);
  
    return Scaffold(
      
  backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: color1(),
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(130),bottomRight:Radius.circular(260) )
        ),
        bottom: PreferredSize(
          preferredSize:const Size.fromHeight(173),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children:const [

                   Padding(
                    padding:  EdgeInsets.only(left: 35),
                    child: Text('" To be an artist is ',style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold,fontSize: 23),),
                  ),
                ],
              ),
             const  Padding(
                    padding:  EdgeInsets.only(left: 64,top: 4 ), 
                    child: Text('to believe in life "',style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold,fontSize: 23  ),),
                  ),
              SizedBox(height: height(context, 0.1),)
            ],
          ) 
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32,right: 32,top: 25,bottom: 15),
        child: Form( 
          key: formKey, 
          autovalidateMode: AutovalidateMode.onUserInteraction, 
          child: ListView( 
            children: [
              TextFormField(
                controller: provider.userNameController,
                cursorColor: color1(), 
                keyboardType: TextInputType.emailAddress,
                 validator: ((value) {
                  if(value!.isEmpty){
                    return "enter username"; 
                  }else{
                    return null;  
                  }
                }), 
                style:const TextStyle(
                  color: Colors.white
                 ),
                decoration: InputDecoration(
                   focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:color1(),width: 2),
                     ),   
                  labelText: 'User Name', 
                  labelStyle:const TextStyle(
                      fontSize: 13,
                    color: Color.fromARGB(255, 190, 190, 190) 
                  ),
                  filled: true,
                  fillColor:const Color.fromARGB(255, 38, 38, 38),
                  suffixIcon:const Icon(Icons.person,color: Color.fromARGB(255, 221, 221, 221),)
                ),
              ),
              SizedBox(height: height(context, 0.028),), 
               TextFormField(
                controller: provider.emailController,
                cursorColor: color1() ,
                
                 validator: ((value) {
                  if(value!.isEmpty){
                    return "enter your email"; 
                  }else{
                    return null;  
                  }
                }),
                 style:const TextStyle(
                  color: Colors.white
                 ), 
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:color1(),width: 2),
                     ),   
                  labelText: 'Email' ,
                  labelStyle:const TextStyle(
                      fontSize: 13,
                    color: Color.fromARGB(255, 190, 190, 190)
                  ),
                  filled: true,
                  fillColor:const Color.fromARGB(255, 38, 38, 38), 
                  suffixIcon:const Icon(CupertinoIcons.mail_solid,color: Color.fromARGB(255, 220, 220, 220),)
                ),
              ),
               SizedBox(height: height(context, 0.028),), 
               TextFormField(
                controller: provider.passwordController,
                cursorColor: color1() ,
                obscureText: true,
                 validator: ((value) {
                  if(value!.isEmpty){
                    return "enter your password"; 
                  }else{
                    return null;  
                  }
                }), 
                 style:const TextStyle(
                  color: Colors.white
                 ), 
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:color1(),width: 2),
                     ),   
                  labelText: 'password',
                  labelStyle:const TextStyle(
                      fontSize: 13,
                    color: Color.fromARGB(255, 190, 190, 190)
                  ),
                  filled: true,
                  fillColor:const Color.fromARGB(255, 38, 38, 38), 
                  suffixIcon:const Icon(CupertinoIcons.lock_fill,color: Color.fromARGB(255, 220, 220, 220),)
                ),
              ), 
               SizedBox(height: height(context, 0.028),), 
               TextFormField(
                controller: provider.repasswordController, 
                cursorColor: color1() ,
                obscureText: true, 
                 validator: ((value) {
                  if(value!.isEmpty){
                    return "re-enter your password";  
                  }else{
                    return null;  
                  }
                }),
                 style:const TextStyle(
                  color: Colors.white
                 ), 
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:color1(),width: 2),
                     ),   
                  labelText: 'Re-enter password',
                  labelStyle:const TextStyle(
                      fontSize: 13,
                    color: Color.fromARGB(255, 190, 190, 190)
                  ),
                  filled: true,
                  fillColor:const Color.fromARGB(255, 38, 38, 38), 
                  suffixIcon:const Icon(CupertinoIcons.lock_fill,color: Color.fromARGB(255, 220, 220, 220),)
                ),
              ), 
              SizedBox(height: height(context, 0.059 ),), 
              ElevatedButton(onPressed: (){
                 if (formKey.currentState!.validate() ) {
                            provider. otpgenrate(context);  
                             FocusManager.instance.primaryFocus?.unfocus(); 
                          }  
                 FocusManager.instance.primaryFocus?.unfocus();  
              },
              style: ButtonStyle(
               
              backgroundColor: MaterialStateProperty.all(color1()), 
              padding: MaterialStateProperty.all(const EdgeInsets.all(13)),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
               child:const Text('SIGNUP')),
              const SizedBox(height: 21,), 
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  Container(
                    height: height(context, 0.0014),
                    color: Colors.grey,
                    width: width(context, 0.36),   
                  ),
                 const Text('OR',style: TextStyle(
                    color: Colors.grey
                  ),),
                  Container(
                     height: height(context, 0.0014),
                    color: Colors.grey,
                    width: width(context, 0.36), 
                  )
                ],
               ) ,
               const SizedBox(height: 21,), 
               ElevatedButton(onPressed: ()async{ 
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen())); 
               
                
               },
              style: ButtonStyle(   
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
              side: BorderSide(width: 2, color:color1()),
              ), 
            ),
              backgroundColor: MaterialStateProperty.all(Colors.black), 
              padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
               child:const Text('LOGIN')), 
            ],
          ),
        ),
      ),
    );
  } 

 



 
}

 
