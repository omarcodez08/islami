import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/model/sura_model.dart';

import '../../../../../core/resources/assets_manager.dart';

class SuraItem extends StatelessWidget {
SuraModel suraModel;
SuraItem(this.suraModel);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.suraDetailsRouteName,arguments: suraModel);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
          children: [
            SvgPicture.asset(AssetsManager.surasNumber),
            Text(suraModel.suraNumber.toString(),style: TextStyle(
            fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ColorsManager.whiteColor,
      ),),
          ],
          ),
          SizedBox(width: 24,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suraModel.suraNameEn,style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.whiteColor,
                ),),
                Text('${suraModel.versesNumber} Verses',style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.whiteColor,
                ),),
              ]
            ),
          ),
          Text(suraModel.suraNameAr,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.whiteColor,
          ),),
      
      
        ],
      ),
    );
  }
}
