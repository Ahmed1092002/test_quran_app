import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/GetSurah/cubit/get_surah_cubit.dart';
    
class SurahView extends StatefulWidget {

final int number ;
  const SurahView({ Key? key, required this.number }) : super(key: key);

  @override
  State<SurahView> createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: BlocProvider(create: (BuildContext context) => GetSurahCubit()..getSurahData(id: widget.number),
        child: BlocConsumer<GetSurahCubit,GetSurahState>(builder: (context, state) {
          var cubit=GetSurahCubit.get(context);
      return  state is GetSurahLoading || cubit.surahDataModel==null ? Center(child: CircularProgressIndicator()) :  ListView.separated(
        separatorBuilder: (_,index){
          return Divider(
            color: Colors.black,
          );
        },

        itemCount: cubit.surahDataModel!.data!.ayahs!.length,
          itemBuilder: (_,index){
          print (cubit.surahDataModel!.data!.ayahs!.length);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cubit.surahDataModel!.data!.ayahs![index].text!,
                    style: TextStyle(fontSize: 18),

                  ),
                ),
              ),
            );
          });
        },
            listener:(context, state){

            } ),
      ),
    );
  }
}