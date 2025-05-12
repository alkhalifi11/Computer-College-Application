// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:univapp_2/app/components/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About_App extends StatelessWidget {
  const About_App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 55, 94),
        iconTheme: IconThemeData(color: Colors.white, size: 35),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 10,
              height: 40,
              color: Colors.blue,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              "حول التطبيق",
              style: Theme.of(context).textTheme.headlineMedium ??
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
        toolbarHeight: 120,
      ),
      endDrawer: drawerapp(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'عن التطبيق:',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      height: 1.5,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 20),
              Text(
                ' هو تطبيق شامل مصمم لتزويد الطلاب بآخر الأخبار والتحديثات حول كليتهم . يقدم التطبيق واجهة مستخدم سهلة الاستخدام ومجموعة متنوعة من الميزات لإبقاء الطلاب على اطلاع ومشاركة.',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 20),
              Text(
                'الميزات:',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 10),
              Text(
                '• آخر التحديثات الإخبارية من الكلية\n'
                '• مقالات إخبارية مفصلة مع الصور والمصادر\n'
                '• سهولة الوصول الى المناهج الدراسية و الجداول عند الحاجة\n'
                '• مكتبة الكترونية متنوعة توفرها الكلية\n'
                '• واجهة مستخدم سهلة الاستخدام مع تنقل سهل\n'
                '• إشعارات للتحديثات الهامة\n'
                '• والمزيد...',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 20),
              Text(
                'مهمتنا:',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 10),
              Text(
                'مهمتنا هي إبقاء الطلاب على اتصال بكليتهم من خلال توفير معلومات دقيقة وفي الوقت المناسب. نسعى لتعزيز تجربة الطلاب من خلال تقديم منصة موثوقة للأخبار والتحديثات.',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 20),
              Text(
                'فريق العمل:',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 10),
              Text(
                'يتكون فريق العمل من مجموعة من الطلاب الذين عملوا لتطوير هذا التطبيق ليكون مشروع التخرج الخاص بهم. فيما يلي بعض أعضاء الفريق:',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  _buildTeamMember(
                    context,
                    'ناصر سعيد السليماني \t// مشرف العمل',
                    'images/nas.jpg',
                    'معيد',
                    'علوم حاسوب',
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTeamMember(
                          context,
                          'هاشم سالم الحامد',
                          'images/ha.jpg',
                          'علوم حاسوب',
                          'تخرج عام 2025',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: _buildTeamMember(
                          context,
                          'وجدي سالم الجذع',
                          'images/w.jpg',
                          'علوم حاسوب',
                          'تخرج عام 2025',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTeamMember(
                          context,
                          'يوسف سالم محيفران',
                          'images/yus.jpg',
                          'علوم حاسوب',
                          'تخرج عام 2025',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: _buildTeamMember(
                          context,
                          'عبدالله محمد لخضر',
                          'images/abd.jpg',
                          'علوم حاسوب',
                          'تخرج عام 2025',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTeamMember(
                          context,
                          'احمد علوي الخليفي',
                          'images/ah.jpg',
                          'علوم حاسوب',
                          'تخرج عام 2025',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'التواصل مع المطور :',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 10),
              Text(
                'إذا كان لديك أي أسئلة أو ملاحظات، لا تتردد في الاتصال بنا عبر الطرق التالية:',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 10),
                  Text(
                    'البريد الإلكتروني: ahmedalkhalifi31@gmail.com',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                  SizedBox(width: 10),
                  Text(
                    'واتساب: 967775295345+',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.instagram, color: Colors.purple),
                  SizedBox(width: 10),
                  Text(
                    'انستغرام: @a.alkhalifi98',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMember(BuildContext context, String name, String imagePath,
      String graduationYear, String s) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            graduationYear,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            s,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
