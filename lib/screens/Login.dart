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
    String gifLocation = 'assets/sample.gif';
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
                    height: 200.0,
                    width: 200.0,
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
                                
                                // TODO: onPressed still not working, please fix later
                                attemptUsername = usernameController.text;
                                attemptPassword = passwordController.text;

                                // setState() will refresh the page and set a new state
                                // depending on what you defined
                                setState(() {
                                  if(attemptUsername == 'cict' && attemptPassword == 'wvsu'){
                                    gifLocation = 'assets/happy.gif';
                                  }

                                  else{
                                    gifLocation = 'assets/angry.gif';
                                  }
                                });
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