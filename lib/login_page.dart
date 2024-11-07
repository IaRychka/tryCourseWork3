import 'package:flutter/material.dart';
import 'user.dart';
import 'main_screen.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      bool userFound = false;
      for (User user in User.users) {
        if (user.login == _loginController.text && user.password == _passwordController.text) {
          userFound = true;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen(user: user)),
          );
          break;
        }
      }
      if (!userFound) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Неверный логин или пароль')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизация',
        style: TextStyle(color: Color.fromARGB(255, 211, 211, 211))),
        backgroundColor: const Color.fromARGB(255, 125, 101, 190), 
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color.fromARGB(255, 191, 203, 224), // Фон фиолетовый
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 16.0), // Внутренний отступ сверху
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 169, 149, 226),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0), // Уменьшенный отступ
                            child: TextFormField(
                              controller: _loginController,
                              decoration: InputDecoration(
                                labelText: 'Логин',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Пожалуйста, введите логин';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0), // Уменьшенный отступ
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Пароль',
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Пожалуйста, введите пароль';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10.0), // Уменьшенный отступ перед кнопкой
                          ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 125, 101, 190), // Измененный цвет кнопки
                              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text('Войти',
                            style: TextStyle(color: Color.fromARGB(255, 221, 221, 221))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0), // Отступ перед текстом и кнопкой регистрации
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Еще нет аккаунта? '),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegistrationPage()),
                          );
                        },
                        child: Text('Зарегистрироваться',
                        style: TextStyle(color: Color.fromARGB(255, 125, 101, 190))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
