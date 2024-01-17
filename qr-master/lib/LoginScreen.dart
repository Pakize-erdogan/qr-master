import 'package:flutter/material.dart';
import 'package:qr_scanner/HomePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showError = false;
  bool _isStudent = true;

  String _selectedUserRole = 'Öğrenci';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biruni QR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Biruni Üniversitesi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                  ),
                ),
                Text(
                  'Yoklama Sistemi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 10, 59, 116),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(100.0),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                child: Center(child: Image.asset('assets/images/logo.jpg')),
                width: 350.0,
                height: 350.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'E-posta',
                    prefixIcon: Icon(Icons.person),
                    suffix: Text(
                      _selectedUserRole == 'Öğrenci'
                          ? '@st.biruni.edu.tr'
                          : '@biruni.edu.tr',
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Şifre',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      child: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),
              if (_showError)
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Kullanıcı adı veya şifre boş olamaz",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 10, 59, 116),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(
                    'Giriş',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _handleLoginButtonPress(context);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.school,
                      color: _isStudent ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isStudent = true;
                        _selectedUserRole = 'Öğrenci';
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.work,
                      color: _isStudent ? Colors.grey : Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        _isStudent = false;
                        _selectedUserRole = 'Akademisyen';
                      });
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<String>(
                      value: _selectedUserRole,
                      items: <String>['Öğrenci', 'Akademisyen']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedUserRole = newValue!;
                          _isStudent = newValue == 'Öğrenci';
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Şifremi Unuttum",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLoginButtonPress(BuildContext context) {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _showError = true;
      });
    } else {
      setState(() {
        _showError = false;
      });

      if (loginIsSuccessful) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        print('Giriş başarısız');
      }
    }
  }

  bool get loginIsSuccessful {
    return true;
  }
}
