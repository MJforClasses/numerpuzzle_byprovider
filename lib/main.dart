import 'package:flutter/material.dart';
import 'package:numerpuzzle_byprovider/provider_class.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ProviderClass>(
    create: (context) => ProviderClass(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ));
}

//ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late double height, width, stp, stbm;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    stp = MediaQuery.of(context).padding.top;
    stbm = MediaQuery.of(context).padding.bottom;
    height = (height - stp - stbm) / 100;
    width /= 100;
    ProviderClass data = Provider.of<ProviderClass>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: data.generateList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  SizedBox(
                    height: height * 50,
                    width: width * 100,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: width * 100,
                          height: height * 15,
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index1) {
                              int i = index == 0 ? index1 : index == 1 ? index1+3 : index1+6;
                              String value = data.randomNum[i] != 0 ? data.randomNum[i].toString() : "";
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: height, left: width * 2.5),
                                child: InkWell(
                                  onTap: ()=>data.responseOnTap(index),
                                  child: Container(
                                    height: height * 10,
                                    width: width * 30,
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    child: Text(value,style: TextStyle(fontSize: height*4,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}