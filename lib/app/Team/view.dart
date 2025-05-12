// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, prefer_final_fields, deprecated_member_use, non_constant_identifier_names

// استيراد مكتبة Flutter الأساسية لإنشاء واجهات المستخدم
import 'package:flutter/material.dart';
// استيراد ملف يحتوي على عنصر واجهة مستخدم مخصص لعرض بطاقة الفريق
import 'package:univapp_2/app/Team/card_team.dart';
// استيراد ملف يحتوي على صفحة الفريق
import 'package:univapp_2/app/Team/team_page.dart';
// استيراد ملفات أخرى متعلقة بالكليات
import 'package:univapp_2/app/about/college/card_college.dart';
import 'package:univapp_2/app/about/college/college_page.dart';
// استيراد ملف يحتوي على وظائف CRUD (إنشاء، قراءة، تحديث، حذف)
import 'package:univapp_2/app/components/curd.dart';
// استيراد ملف يحتوي على قائمة جانبية مخصصة
import 'package:univapp_2/app/components/drawer.dart';
// استيراد ملف يحتوي على روابط API
import 'package:univapp_2/app/constant/linkapi.dart';
// استيراد ملف يحتوي على نموذج بيانات الفريق
import 'package:univapp_2/app/model/team_model.dart';

// تعريف عنصر واجهة مستخدم من نوع StatefulWidget لعرض صفحة الفريق
class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _HomeState(); // إنشاء الحالة المرتبطة بالعنصر
}

// تعريف الحالة المرتبطة بعنصر Team
class _HomeState extends State<Team> {
  //
  Curd _curd = Curd(); // إنشاء كائن من فئة Curd للتعامل مع طلبات API
  //
  // دالة لجلب بيانات الفريق من النوع الأول باستخدام API
  get_Team() async {
    var response = await _curd.postRequest(linkTeamView, {"type": '1'});
    return response; // إرجاع البيانات المستلمة
  }

  // دالة لجلب بيانات الفريق من النوع الثاني باستخدام API
  get_Team2() async {
    var response = await _curd.postRequest(linkTeamView, {"type": '2'});
    return response; // إرجاع البيانات المستلمة
  }

  // دالة لجلب بيانات الفريق من النوع الثالث باستخدام API
  get_Team3() async {
    var response = await _curd.postRequest(linkTeamView, {"type": '3'});
    return response; // إرجاع البيانات المستلمة
  }

  // دالة لجلب بيانات الفريق من النوع الرابع باستخدام API
  get_Team4() async {
    var response = await _curd.postRequest(linkTeamView, {"type": '4'});
    return response; // إرجاع البيانات المستلمة
  }

  @override
  Widget build(BuildContext context) {
    // بناء واجهة المستخدم الرئيسية للصفحة
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 9, 55, 94), // تحديد لون الخلفية
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 55, 94), // لون شريط التطبيق
        iconTheme: IconThemeData(
            color: Colors.white, size: 35), // تخصيص أيقونات الشريط
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // محاذاة العناصر إلى البداية
          children: [
            Container(
              width: 10,
              height: 40,
              color: Colors.blue, // مستطيل أزرق صغير
            ),
            SizedBox(
              width: 7, // مسافة بين العناصر
            ),
            Text("كادر الكلية",
                style: Theme.of(context).textTheme.headlineMedium), // عنوان الصفحة
          ],
        ),
        toolbarHeight: 120, // ارتفاع شريط التطبيق
      ),
      endDrawer: drawerapp(), // إضافة القائمة الجانبية
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 0, right: 0, top: 0, bottom: 2), // تحديد الحواف
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white, // لون الخلفية
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))), // زوايا مستديرة
                child: Container(
                  padding: EdgeInsets.all(5), // حواف داخلية
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20, // مسافة عمودية
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // محاذاة العناصر إلى البداية
                        children: [
                          Container(
                            width: 10,
                            height: 40,
                            color: Colors.blue, // مستطيل أزرق صغير
                          ),
                          SizedBox(
                            width: 7, // مسافة بين العناصر
                          ),
                          Text(
                            "الكادر الاداري", // نص عنوان القسم
                            style: TextStyle(
                              fontSize: 18, // حجم النص
                              color: Colors.black, // لون النص
                              fontWeight: FontWeight.w900, // وزن النص
                              fontFamily: 'ElMessiri', // نوع الخط
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10, // مسافة عمودية
                      ),
                      FutureBuilder(
                          future: get_Team(), // استدعاء الدالة لجلب البيانات
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              // التحقق من وجود بيانات
                              if (snapshot.data['status'] == "fail") {
                                // التحقق من حالة البيانات
                                return Center(
                                    child: Text(
                                  "لا توجد معلومات حالياً عن كادر القسم", // رسالة في حال عدم وجود بيانات
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ));
                              }
                              return ListView.builder(
                                itemCount:
                                    snapshot.data['data'].length, // عدد العناصر
                                shrinkWrap: true, // تقليل المساحة المستخدمة
                                physics:
                                    NeverScrollableScrollPhysics(), // تعطيل التمرير
                                itemBuilder: (BuildContext context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                        top: 2,
                                        bottom: 0), // حواف داخلية
                                    child: CardTeam(
                                      team_model: Team_Model.fromJson(
                                          snapshot.data['data']
                                              [i]), // إنشاء عنصر بطاقة الفريق
                                    ),
                                  );
                                },
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // التحقق من حالة الاتصال
                              return Center(
                                  child: Text(
                                "جاري تحميل المعلومات...", // رسالة أثناء التحميل
                                style: Theme.of(context).textTheme.headlineSmall,
                              ));
                            }
                            return Center(
                                child: Text(
                              "جاري تحميل المعلومات...", // رسالة افتراضية
                              style: Theme.of(context).textTheme.headlineSmall,
                            ));
                          }),
                      SizedBox(
                        height: 40, // مسافة عمودية
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // محاذاة العناصر إلى البداية
                        children: [
                          Container(
                            width: 10,
                            height: 40,
                            color: Colors.blue, // مستطيل أزرق صغير
                          ),
                          SizedBox(
                            width: 7, // مسافة بين العناصر
                          ),
                          Text(
                            "الكادر التدريسي", // نص عنوان القسم
                            style: TextStyle(
                              fontSize: 18, // حجم النص
                              color: Colors.black, // لون النص
                              fontWeight: FontWeight.w900, // وزن النص
                              fontFamily: 'ElMessiri', // نوع الخط
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20, // مسافة عمودية
                      ),
                      FutureBuilder(
                          future: get_Team2(), // استدعاء الدالة لجلب البيانات
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              // التحقق من وجود بيانات
                              if (snapshot.data['status'] == "fail") {
                                // التحقق من حالة البيانات
                                return Center(
                                    child: Text(
                                  "لا توجد معلومات حالياً عن كادر القسم", // رسالة في حال عدم وجود بيانات
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ));
                              }
                              return ListView.builder(
                                itemCount:
                                    snapshot.data['data'].length, // عدد العناصر
                                shrinkWrap: true, // تقليل المساحة المستخدمة
                                physics:
                                    NeverScrollableScrollPhysics(), // تعطيل التمرير
                                itemBuilder: (BuildContext context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                        top: 2,
                                        bottom: 0), // حواف داخلية
                                    child: CardTeam(
                                      team_model: Team_Model.fromJson(
                                          snapshot.data['data']
                                              [i]), // إنشاء عنصر بطاقة الفريق
                                    ),
                                  );
                                },
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // التحقق من حالة الاتصال
                              return Center(
                                  child: Text(
                                "جاري تحميل المعلومات...", // رسالة أثناء التحميل
                                style: Theme.of(context).textTheme.headlineSmall,
                              ));
                            }
                            return Center(
                                child: Text(
                              "جاري تحميل المعلومات...", // رسالة افتراضية
                              style: Theme.of(context).textTheme.headlineSmall,
                            ));
                          }),
                      SizedBox(
                        height: 40, // مسافة عمودية
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
