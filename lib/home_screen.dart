import 'package:flutter/material.dart';
import 'package:http/http.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password)async{

    try{
      Response response = await post(Uri.parse('https://reqres.in/api/register'),
      body: {
        'email' : email,
        'password' : password,
      });
      if(response.statusCode == 200){
        print('Account Created Successfully');
      }else{
        print('Failed');
      }
    } catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('API Sign up Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),

            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password'
              ),
            ),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.teal,
                ),
                child: const Center(
                  child: Text('Sign up'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
