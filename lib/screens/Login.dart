import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String gifLocation = 'assets/SkippyPeppa_3.gif';
    String attemptUsername;
    String attemptPassword;

    return Scaffold(

      appBar: AppBar(
        title: Text("Hello there! Please log in."),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Stack(

          children:[

            Container(
              color: Colors.lightBlue[200],
              height: screenHeight,
              width: screenWidth,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                
                //  GIF
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image(
                    image: AssetImage(gifLocation),
                    height: 250.0,
                    width: 250.0,
                  ),
                ),
                
                //  Form for entering username and password and a login button
                //  Padding for entire form
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),

                  child: Container(

                    // Padding for form fields and buttons
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    
                    child: Form(
                      key: _formKey,
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          //  Username Text Field
                          TextFormField(

                            decoration: const InputDecoration(hintText: 'Username'),
                            
                            validator: (value) {
                              if (value.isEmpty){
                                return 'Please enter a valid username';
                              }
                              return null;
                            },

                            controller: usernameController,
                          ),

                          //  Password Text Field
                          TextFormField(

                            obscureText: true,
                            decoration: const InputDecoration(hintText: 'Password'),
                            validator: (value) {

                              if (value.isEmpty){
                                return 'Please enter your passwword';
                              }
                              
                              return null;
                            },

                            controller: passwordController,
                          ),

                          //  Log-in button w/ padding
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30.0),
                            child: MaterialButton(
                              minWidth: screenWidth,
                              color: Colors.blue,

                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              onPressed: (){
                                
                                attemptUsername = usernameController.text;
                                attemptPassword = passwordController.text;

                                if(attemptUsername == 'cict' && attemptPassword == 'wvsu'){
                                  Navigator.pushNamed(context, '/home');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ]

        ),
      ),
    );
  }
}