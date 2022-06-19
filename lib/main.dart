import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController birthYearController = TextEditingController();
  String ageStr = "Chưa xác định";
  String nameStr = "Chưa xác định";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
        child: Column(
          children: [
            // Text("Hello"),
            // Text("I am a dev Flutter"),
            // TextField: Họ tên
            inputWidget(
                labelText: "Họ và tên",
                hintText: "Nhập họ và tên",
                controller: userNameController),
            // TextField: Năm sinh
            inputWidget(
                labelText: "Năm sinh",
                hintText: "Nhập năm sinh",
                controller: birthYearController),
            // Button: Show thông tin
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    nameStr = userNameController.text;
                    ageStr = (DateTime.now().year -
                            int.parse(birthYearController.text))
                        .toString();
                  });
                },
                child: Text("Tính tuổi")),
            const SizedBox(
              height: 30,
            ),

            // Card Information
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                  child: SizedBox(
                width: 300,
                height: 100,
                child: Center(
                    child: Text(nameStr.toString() + ": " + ageStr.toString())),
              )),
            ),
          ],
        ),
      )),
    );
  }
}

// Tạo 1 widget bằng hàm
Widget inputWidget(
    {required String labelText,
    required String hintText,
    required controller}) {
  return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controller,
      ));
}
