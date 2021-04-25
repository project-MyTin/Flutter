/*
 루틴 & 동작의 생성 & 수정하기 페이지의 헤더를 만드는 위젯
 @title : 제목
 @subText : 제목 밑의 부가 설명
 @part : 페이지의 현재 단계
 @backPageFunc : 뒤로가기 버튼을 눌렀을 때 이벤트 핸들러
 @pageNumbering : ProgressPageIcon 이 현제 단계를 표시하는 기준이 되는 리스트

 (-> 페이지의 현재 단계와 사용자에게 보여지는 단계가 다를 수 있음,
 실제 단계는 part 변수에 담기고, 사용자에게 보여지는 단계 리스트는 pageNumbering 변수에 담김)
 */
import 'package:flutter/material.dart';
import 'package:mytin/widgets/progress_page_icon.dart';

class AddPageHeader extends StatelessWidget {
  final String title, subText;
  final int part;
  final Function backPageFunc;
  final List<int> pageNumbering;

  AddPageHeader({this.title, this.subText, this.part, this.backPageFunc, this.pageNumbering});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 0.04 * height,
            ),
            onPressed: () => backPageFunc(),
          ),
        ),
        ProgressPageIcon(pageNumbering[part], 3, 0.41),
        Text(
          title,
          style: TextStyle(
              fontSize: 0.045 * height, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 0.007 * height),
        Text(
          subText,
          style: TextStyle(
            fontSize: 0.018 * height,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
