import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:makeframes/Services/api_service.dart';
import 'package:makeframes/constant/snackbar.dart';
import 'package:makeframes/constant/widgets.dart';
import 'package:makeframes/models/login_request_model.dart';
import 'package:makeframes/screens/home/homesccreen.dart';
import 'package:makeframes/screens/login/signupScreen.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
    
GlobalKey<FormState> formKey = GlobalKey(); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
  backgroundColor: Colors.black,

      appBar: AppBar(
        elevation: 10,
        backgroundColor: color1(),
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(130),bottomRight:Radius.circular(260) )
        ),
        bottom: PreferredSize(
          preferredSize:const Size.fromHeight(197),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children:const [

                   Padding(
                    padding:  EdgeInsets.only(left: 35),
                    child: Text('" To be an artist is ',
                    style: TextStyle(
                    color: Colors.white ,fontWeight: FontWeight.bold,fontSize: 23),),
                  ),
                ],
              ),
             const  Padding(
                    padding:  EdgeInsets.only(left: 64,top: 4 ),
                    child: Text('to believe in life "',
                    style: TextStyle(
                    color: Colors.white ,fontWeight: FontWeight.bold,fontSize: 23  ),),
                  ),
              SizedBox(height: height(context, 0.13),)
            ],
          ) 
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32,right: 32,top: 47,bottom: 15),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,  
          child: ListView( 
            children: [
              TextFormField(
                controller: _emailController, 
                cursorColor: color1(), 
                keyboardType: TextInputType.emailAddress, 
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
                  labelText: 'Enter Email', 
                  labelStyle:const TextStyle(
                      fontSize: 13,  
                    color: Color.fromARGB(255, 190, 190, 190) 
                  ),
                  filled: true, 
                  fillColor:const Color.fromARGB(255, 38, 38, 38),
                  suffixIcon:const Icon(CupertinoIcons.mail_solid,color: Color.fromARGB(255, 221, 221, 221),)
                ),
              ),
              SizedBox(height: height(context, 0.03),), 
               TextFormField(
                controller: _passwordController, 
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
                  labelText: 'Enter password',
                  labelStyle:const TextStyle(
                      fontSize: 13,
                    color: Color.fromARGB(255, 190, 190, 190)
                  ),
                  filled: true,
                  fillColor:const Color.fromARGB(255, 38, 38, 38),  
                  suffixIcon:const Icon(CupertinoIcons.lock_fill,color: Color.fromARGB(255, 220, 220, 220),)
                ),
              ),
              SizedBox(height: height(context, 0.140 ),),   
              ElevatedButton(onPressed: (){ 
                 if (formKey.currentState!.validate() ) {
                          

                             
                       loginButtonclicked(context); 
                          }
                        
                           
              },
              style: ButtonStyle(
                
              backgroundColor: MaterialStateProperty.all(color1()), 
              padding: MaterialStateProperty.all(const EdgeInsets.all(13)),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
               child:const Text('LOGIN')),
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
               ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> SignupScreen())); 
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
               child:const Text('SIGNUP')), 
             const  Align(
                alignment: Alignment.center, 
                child: Padding(
                  padding:  EdgeInsets.all(4.0),
                  child: Text('if you are a new user please signup',style: TextStyle(color:Colors.white,fontSize: 11),) ,
                )) 
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginButtonclicked(context)async{

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    
      final loguser = LoginreqModel(email: email,password: password);
      
      await  ApiService().login(loguser).then((value) => {
        if(value == true){ 
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>  HomeScreen()), (route) => false)  
        }else{
          CustomSnackBar().snackBar(context, 'Invalid Username/Password', color1()) 
        }
      });
      
    }
 
  } 

  


 
