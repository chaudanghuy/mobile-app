import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wordpress_app/pages/delete_user.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {

  
  _openDeletePopup (){
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context, builder: (context)=> DeleteUser());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('security').tr(),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(15),
                isThreeLine: false,
                title: Text(
                  'account-delete',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ).tr(),
                leading: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 20,
                  child: Icon(
                    Feather.trash,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: ()=> _openDeletePopup()
              ),
            ],
          ),
        ],
      ),
    );
  }
}
