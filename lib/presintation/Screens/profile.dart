import 'package:cv_builder/Constants/myIcons.dart';
import 'package:cv_builder/Constants/strings.dart';
import 'package:cv_builder/data/Models/storage_item.dart';
import 'package:cv_builder/data/services/profile_service.dart';
import 'package:cv_builder/presintation/Screens/store_data.dart';

import 'package:cv_builder/presintation/Widgets/awards.dart';
import 'package:cv_builder/presintation/Widgets/certificate.dart';
import 'package:cv_builder/presintation/Widgets/experience.dart';
import 'package:cv_builder/presintation/Widgets/hobbies.dart';
import 'package:cv_builder/presintation/Widgets/languages.dart';
import 'package:cv_builder/presintation/Widgets/organization.dart';

import 'package:cv_builder/presintation/Widgets/projects.dart';
import 'package:cv_builder/presintation/Widgets/qualifications.dart';
import 'package:cv_builder/presintation/Widgets/reference.dart';
import 'package:cv_builder/presintation/Widgets/skills.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget buildDivider() {
    return const Divider(
      height: 48,
      // endIndent: ,
      color: Colors.grey,
      thickness: 1,
    );
  }

  Widget buildData(String txt, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32.0,
                height: 32.0,
                //padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  color: appColor,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: textColor,
                    size: 16.0,
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                txt,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          const Row(
            children: [
              Icon(
                MyFlutterApp.circle_check_solid,
                size: 16.0,
                //color: Colors.grey,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }

  profileCallBack(String label, TextEditingController textController) {
    final StorageItem newItems = StorageItem(label, textController.text);
    storageService1.writeSecureData(newItems);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image.asset(
                  width: 96,
                  height: 96,
                  //placeholder: 'assets/images/loading.gif',
                  "assets/images/gas.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                //color: Colors.green,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gasan',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      'Application Developer in Flutter',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          buildDivider(),
          Expanded(
              child: ListView(children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileService(
                            title: personalDetails,
                            callingBack: (String value) {
                              return value;
                            },
                            widgetTitle: 'Personal Details',
                            details: personalDetails,
                          )));
                },
                child: buildData('Personal Details', Icons.person_3_outlined)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StoreData(
                            title: 'Objective',
                          )));
                },
                child: buildData('Objective', Icons.flag_outlined)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileService(
                            title: experience,
                            callingBack: (String value) {
                              return value;
                            },
                            widgetTitle: 'Experiences',
                            details: experience,
                          )));
                },
                child: buildData('Experiences', MyFlutterApp.brain_solid)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Qualifications()));
                },
                child: buildData(
                    'Qualifications', MyFlutterApp.graduation_cap_solid)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Organization()));
                },
                child: buildData('Organizations', MyFlutterApp.city_solid)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Projects()));
                },
                child: buildData('Projects', MyFlutterApp.desktop_solid)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Certificate()));
                },
                child: buildData('Certificates', MyFlutterApp.centos)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Awards()));
                },
                child:
                    buildData('Awards/Scholarships', MyFlutterApp.award_solid)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Skills()));
                },
                child: buildData('Skills', MyFlutterApp.jedi_solid)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Languages()));
                },
                child: buildData('Languages', MyFlutterApp.language_solid)),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Hobbies()));
              },
              child: buildData(
                  'Hobbies/Interests', MyFlutterApp.person_skiing_nordic_solid),
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Reference()));
                },
                child: buildData('References', MyFlutterApp.link_solid)),
          ]))
        ],
      ),
    );
  }
}
