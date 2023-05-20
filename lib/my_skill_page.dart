
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfo/page_title.dart';

import 'about_page.dart';
import 'app.dart';
import 'base_page.dart';

class MySkillPage extends StatefulWidget {
  MySkillPage(GlobalKey key) : super(key: key);

  @override
  _MySkillPageState createState() => _MySkillPageState();
}

class _MySkillPageState extends State<MySkillPage> {
  Widget _buildSkillItem(Skill skill) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              skill.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "${skill.percent}%",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
        SizedBox(height: 8),
        Stack(
          children: <Widget>[
            Container(
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            FractionallySizedBox(
              widthFactor: skill.percent / 100,
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Padding(
        padding: PAGE_CONTENT_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageTitle("My skills"),
            SizedBox(height: 32),
            Text(
              SKILLS,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24),
            LayoutBuilder(
              builder: (_, constrain) {
                final maxWidth = constrain.maxWidth;
                final widthForTablet = 500;
                final skillWidth =
                    maxWidth > widthForTablet ? (maxWidth - 24) / 2 : maxWidth;
                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: skills
                      .map(
                        (it) => SizedBox(
                          width: skillWidth,
                          child: _buildSkillItem(it),
                        ),
                      )
                      .toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Skill {
  String name;
  int percent;

  Skill({
    required this.name,
    required this.percent,
  });
}

final skills = [
  Skill(name: "Flutter", percent: 80),
  Skill(name: "Web", percent: 70),
  Skill(name: "Wordpress", percent: 80),
  Skill(name: "Programming", percent: 70),
];
