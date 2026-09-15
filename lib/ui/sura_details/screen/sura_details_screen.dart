import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
   SuraModel suraModel=ModalRoute.of(context)?.settings.arguments as SuraModel;
if(suraVerses.isEmpty){
  readFile(suraModel.suraNumber);
}
    return Scaffold(
    backgroundColor: ColorsManager.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title:Text(suraModel.suraNameEn,style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: ColorsManager.goldColor,

        ),),
          iconTheme: IconThemeData(color: ColorsManager.goldColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,
              vertical: 9),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.leftCorner),
                      Text(suraModel.suraNameAr,style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: ColorsManager.goldColor,

                      ),),
                      Image.asset(AssetsManager.rightCorner),

                    ],
                  ),
                  SizedBox(height: 3,),
                  Expanded(
                    child:suraVerses.isEmpty
                    ? Center(child: CircularProgressIndicator(color: ColorsManager.goldColor,))
                    : SingleChildScrollView(
                      child: Text(suraVerses,
                        textDirection: TextDirection.rtl,
                        textAlign:TextAlign.center,
                        style: TextStyle(
                          height: 2.5 ,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: ColorsManager.goldColor
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Image.asset(AssetsManager.mosque02,)
        ],
      ),
    );
  }

  String suraVerses= '';

  readFile(int suraNumber) async {
    String suraContent = await rootBundle.loadString('assets/suras/$suraNumber.txt');
    List<String> suraLines = suraContent.split('\n');
    for(int i=0;i<suraLines.length;i++){
    suraVerses+=suraLines[i].trim();
    suraVerses+=" (${i+1}) ";

    }
    setState(() {

    });
  }
}
