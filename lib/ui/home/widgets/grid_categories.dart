import 'package:flutter/material.dart';

class GridCategory extends StatelessWidget {
  const GridCategory({Key? key}) : super(key: key);
  final double heightIcon = 50;
  final double widthIcon = 50;
  final double textSize = 13;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 30),
        height: 230,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/meat.png',
                        width: widthIcon,
                        height: heightIcon,
                        fit: BoxFit.cover,),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Thịt',
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/fruit.png',
                        width: widthIcon,
                        height: heightIcon,
                        fit: BoxFit.cover,),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hoa quả',
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/fruit2.png',
                        width: widthIcon,
                        height: heightIcon,
                        fit: BoxFit.cover,),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Rau củ',
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/cook.png',
                        width: widthIcon,
                        height: heightIcon,
                        fit: BoxFit.cover,),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Chế biến',
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/sale.png',
                        width: widthIcon,
                        height: heightIcon,
                        fit: BoxFit.cover,),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Giá shock',
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/seed.png',
                        width: widthIcon,
                        height: heightIcon,
                        fit: BoxFit.cover,),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hạt giống',
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/seafood.png',
                        width: widthIcon,
                        height: heightIcon,
                        fit: BoxFit.cover,),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Thuỷ - Hải sản',
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/snack.png',
                        width: widthIcon,
                        height: heightIcon,
                        fit: BoxFit.cover,),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Đồ ăn vặt',
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],),);
  }
}
