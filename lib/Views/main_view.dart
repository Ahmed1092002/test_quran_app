import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_quran_app/Views/SurahView.dart';
import 'package:test_quran_app/bloc/get_surahList,cubit/cubit/surah_list_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => SurahListCubit()..getSurahList(),
        child: BlocConsumer<SurahListCubit,SurahListState>(
            listener: (context, state) {

    },
    builder: (context, state) {
              var cubit= SurahListCubit.get(context);
              return  state is SurahListDataLoading || cubit.surahListModel==null ?
              Center(child: CircularProgressIndicator()) :
              ListView.builder(
                itemCount:cubit.surahListModel!.data!.length ,
                  itemBuilder: (_,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SurahView(
                      number: cubit.surahListModel!.data![index]!.number!,
                    )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(cubit.surahListModel!.data![index].name!,
                          style: TextStyle(fontSize: 18),

                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                );
              });
    }
        ),
      )
    );
  }
}
