import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString("name");
  print(name);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: name == null ? Login() : const HomePage(),
  ));
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(41, 28, 28, 28),
        body: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Username:',
                style: TextStyle(color: Colors.grey[400], fontSize: 22)),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == "mymoon") {
                    return null;
                  } else {
                    return "Invalid";
                  }
                },
                autofocus: false,
                cursorColor: Colors.grey[400],
                style: TextStyle(fontSize: 15.0, color: Colors.grey[400]),
                decoration: InputDecoration(
                  hintText: 'Enter your Username',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Password:',
                style: TextStyle(color: Colors.grey[400], fontSize: 22)),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == "mymoon") {
                    return null;
                  } else {
                    return "Invalid";
                  }
                },
                autofocus: false,
                cursorColor: Colors.grey[400],
                obscureText: true,
                style:
                    const TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("name", "myms");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  textStyle: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
            ),
          ]),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(41, 28, 28, 28),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(41, 54, 54, 54),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 22,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: SizedBox(
          height: 15,
          width: 15,
          child: Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Color.fromARGB(41, 9, 9, 9),
                ),
                child: const Text("Logout"),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove("name");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                }),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Tattoo",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    )),
                Text(
                  "A tattoo is a form of body modification made by inserting ink, dyes, and/or pigments, either indelible or temporary, into the dermis layer of the skin to form a design. The art of making tattoos is tattooing.Tattoos fall into three broad categories: purely decorative symbolic and pictorial. In addition, tattoos can be used for identification such as ear tattoos on livestock as a form of branding. Humans have marked their bodies with tattoos for thousands of years. These permanent designs—sometimes plain, sometimes elaborate, always personal—have served as amulets, status symbols, declarations of love, signs of religious beliefs, adornments and even forms of punishment. Joann Fletcher, research fellow in the department of archaeology at the University of York in Britain, describes the history of tattoos and their cultural significance to people around the world, from the famous Iceman, a 5,200-year-old frozen mummy, to today’s Maori.",
                  style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/one.jpg'),
                          fit: BoxFit.fill,
                        ),
                        // shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/2.jpg'),
                          fit: BoxFit.fill,
                        ),
                        // shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/3.jpg'),
                          fit: BoxFit.fill,
                        ),
                        // shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/4.jpg'),
                          fit: BoxFit.fill,
                        ),
                        // shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180.0,
                  width: 180.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/5.jpg'),
                      fit: BoxFit.fill,
                    ),
                    // shape: BoxShape.circle,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
