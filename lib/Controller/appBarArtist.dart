

import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/style.dart';
import '../Screens/wallet.dart';

class Appbars {
  getArtistAppBar({context,title}){
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: appBarColor,
      actions:  [
        const Icon(Icons.search,size: 24,color: Colors.white),
        const SizedBox(width: 10),
        const Icon(Icons.location_on_outlined,size: 24,color: Colors.white),
        const SizedBox(width: 10),
        const Icon(Icons.notifications_none,color: Colors.white,size: 24,),
        const SizedBox(width: 10),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Wallet_page(),));
          },
            child: const Icon(Icons.account_balance_wallet_outlined,color: Colors.white,size: 24,)),
        const SizedBox(width: 10),
      ],
      title:Text(title,style: appBarText,),
      leadingWidth: 30.0,
    );
  }
}