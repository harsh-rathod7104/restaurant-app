import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/details_page.dart';
import 'package:restaurant/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getApi() async {
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var decodeJson = jsonDecode(jsonData);
      rastauraantData = List.from(decodeJson)
          .map((item) => Rastauraant.fromJson(item))
          .toList();
      setState(() {});
    }
  }

  @override
  void initState() {
    getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff424769),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D3250),
        title: Text('Restaurant App'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://ih1.redbubble.net/image.4831482474.3625/fposter,small,wall_texture,square_product,600x600.u1.jpg'),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            CustomTextFeild(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.013,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemCount: rastauraantData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailsPage(
                              item: rastauraantData[index],
                            ),
                          ),
                        );
                      },
                      child: CustomGridTile(item: rastauraantData[index]));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomGridTile extends StatelessWidget {
  final Rastauraant item;
  const CustomGridTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 120.h,
              width: double.infinity,
              child: Image.network(
                item.imageUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 10),
                width: double.infinity,
                color: Color(0xff7077A1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name.toString(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xffF6B17A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.010,
                    ),
                    Row(
                      children: [
                        Text(
                          "Rating ${item.rating}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff2D3250),
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Color(0xffF6B17A),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    Text(
                      maxLines: 1,
                      item.location.toString(),
                      style: TextStyle(color: Color(0xff424769)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(color: Color(0xff2D3250)),
        filled: true,
        fillColor: Color(0xff7077A1),
        prefixIcon: Icon(Icons.search),
        prefixIconColor: Color(0xffF6B17A),
        contentPadding: EdgeInsets.symmetric(vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0,
            color: Color.fromRGBO(112, 119, 161, 1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xffF6B17A),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF6B17A),
          ),
        ),
      ),
    );
  }
}
