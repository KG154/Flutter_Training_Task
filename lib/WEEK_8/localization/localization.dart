import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskproject/Widget/commonWidget.dart';

import 'localization_class.dart';

class localizationScreen extends StatelessWidget {
  const localizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: Locale('en', 'US'),
      title: 'localization',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initi();
  }

  Future initi() async {
    prefs = await SharedPreferences.getInstance();
    final _getlocalestring = prefs!.getString("Locale");
    final List getlocale =
        locale.where((element) => element["name"] == _getlocalestring).toList();
    Locale _locale = getlocale[0]["locale"];
    Get.updateLocale(_locale);
  }

  List<Map<String, dynamic>> locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
    {'name': 'ગુજરાતી', 'locale': Locale('gu', 'IN')},
    {'name': '한국인(Korean)', 'locale': Locale('ko', 'KR')},
    {'name': 'Arabic', 'locale': Locale('ar', 'BH')},
    {'name': 'Dutch', 'locale': Locale('nl', 'BQ')},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "title".tr,
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('text'.tr),
            SizedBox(
              height: 20,
            ),
            Text('name'.tr),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        // height: 250,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                prefs!.setString(
                                    "Locale", locale[index]['name'].toString());
                                updating(locale[index]['locale'] as Locale);
                              },
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                locale[index]['name'].toString(),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.black54,
                            );
                          },
                          itemCount: locale.length,
                        ),
                      );
                    });
              },
              child: commonButton(
                title: "Language".tr,
                height: 40,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  updating(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }
}
