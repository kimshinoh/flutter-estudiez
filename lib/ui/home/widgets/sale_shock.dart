import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/widgets/rediant-gradient.dart';

class SaleShock extends StatelessWidget {
  final int itemCount = 3;
  const SaleShock({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      height: 550,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '💰 SALE SHOCK',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: const <Widget>[
                  Text(
                    'Xem thêm',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            'Siêu ưu đãi, giá cực shock chỉ từ 1k',
            style: TextStyle(
                fontSize: 13,
                color: Color.fromARGB(255, 124, 124, 124),
                fontWeight: FontWeight.w600,),
          ),
          SizedBox(
            height: 450,
            width: width,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    onTap: () {},
                    child: Column(children: [
                      SizedBox(
                        width: width * 0.95,
                        height: 140,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              height: width * 0.3,
                              width: width * 0.3,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/chocopiechotrongiu.jpg',
                                    ),
                                    fit: BoxFit.cover,),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.fromLTRB(15, 10, 5, 0),
                                width: width * 0.6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Trong gay',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Fresh Meat- Thit heo song',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: const [
                                        RadiantGradientMask(
                                            firstColor: Colors.orange,
                                            secondColor: Colors.yellow,
                                            child: Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.white,
                                            ),),
                                        SizedBox(width: 4),
                                        Text(
                                          '4.8',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    RichText(
                                        text: const TextSpan(
                                      text: '55.000₫',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '/Hộp 12 bánh',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Đã bán 230',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_circle,
                                          size: 30,
                                          color: AppColors.primary,
                                        )
                                      ],
                                    )
                                  ],
                                ),),
                          ],
                        ),
                      ),
                      if (index < itemCount - 1)
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.backgroudGrey,
                        )
                    ],),);
              },
            ),
          )
        ],
      ),
    );
  }
}
