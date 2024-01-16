import 'package:flutter/material.dart';
import 'package:restaurant/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class detailsPage extends StatelessWidget {
  final Rastauraant item;
  detailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff424769),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D3250),
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
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.50,
            child: Image.network(
              item.imageUrl.toString(),
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.44,
                ),
                Container(
                  width: double.infinity,
                  height: 600.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Color(0xff424769),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF6B17A),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 3.h,
                            width: 50.w,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          item.name.toString(),
                          style: TextStyle(
                            color: Color(0xffF6B17A),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "${item.rating}  ",
                              style: TextStyle(
                                color: Color(0xff97077A1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Color(0xffF6B17A),
                            ),
                            Text(
                              "(${item.totalRatings.toString()})",
                              style: TextStyle(
                                color: Color(0xff97077A1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xffF6B17A),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              item.location.toString(),
                              style: TextStyle(
                                color: Color(0xff7077A1),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timelapse_outlined,
                              color: Color(0xffF6B17A),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              item.hours.toString(),
                              style: TextStyle(
                                  color: Color(
                                0xff7077A1,
                              )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(
                              0xffF6B17A,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          item.description.toString(),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Wrap(
                          spacing: 8.sp,
                          children: List<Widget>.generate(
                            item.menuList!.length,
                            (int index) {
                              return Stack(
                                children: [
                                  Chip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.sp),
                                    ),
                                    label: Text(
                                      item.menuList![index],
                                    ),
                                    shadowColor: Colors.grey[60],
                                    backgroundColor: Color(0xffF6B17A),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
