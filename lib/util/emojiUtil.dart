
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class EmojiUtil {
  static List<String> _keyList = [
    "[(a)]",
    "[(b)]",
    "[(c)]",
    "[(d)]",
    "[(e)]",
    "[(f)]",
    "[(g)]",
    "[(h)]",
    "[(i)]",
    "[(j)]",
    "[(k)]",
    "[(l)]",
    "[(m)]",
    "[(n)]",
    "[(o)]",
    "[(p)]",
    "[(q)]",
    "[(r)]",
    "[(s)]",
    "[(t)]",
    "[(u)]",
    "[(v)]",
    "[(w)]",
    "[(x)]",
    "[(w)]",
    "[(z)]",
    "[(A)]",
    "[(B)]",
    "[(C)]",
    "[(D)]",
    "[(E)]",
    "[(F)]",
    "[(G)]",
    "[(H)]",
    "[(I)]",
    "[(J)]",
    "[(K)]",
    "[(L)]",
    "[(M)]",
    "[(N)]",
    "[(O)]",
    "[(P)]",
    "[(Q)]",
    "[(R)]",
    "[(S)]",
    "[(T)]",
    "[(U)]",
    "[(V)]",
    "[(W)]",
    "[(X)]",
    "[(Y)]",
    "[(Z)]",
    "[(!)]",
    "[(@)]",
    "[(#)]",
    "[(\$)]",
    "[(%)]",
    "[(^)]",
    "[(&)]",
    "[(*)]",
    "[(()]",
    "[())]",
    "[(-)]",
    "[(_)]",
    "[(+)]",
    "[(=)]",
    "[({)]",
    "[(})]",
    "[(|)]",
    "[( ,)]",
    "[(:)]",
    "[(,)]",
    "[(.)]",
    "[(?)]",
    "[(~)]",
    "[(`)]",
    "[(')]",
    "[(·)]",
    "[(…)]",
    "[(0)]",
    "[(1)]",
    "[(2)]",
    "[(3)]",
    "[(4)]",
    "[(5)]",
    "[(6)]",
    "[(7)]",
    "[(8)]",
    "[(9)]",
    "[:)a]",
    "[:)b]",
    "[:)c]",
    "[:)d]",
    "[:)e]",
    "[:)f]",
    "[:)g]",
    "[:)h]",
    "[:)i]",
    "[:)j]",
    "[:)k]",
    "[:)l]",
    "[:)m]",
    "[:)n]",
    "[:)o]",
    "[:)p]",
    "[:)q]",
    "[:)r]",
    "[:)s]",
    "[:)t]",
    "[:)u]",
    "[:)v]",
    "[:)w]",
    "[:)x]",
    "[:)y]",
    "[:)z]",
    "[:(a]",
    "[:(b]",
    "[:(c]",
    "[:(d]",
    "[:(e]",
    "[:(f]",
    "[:(g]",
    "[:(h]",
    "[:(i]",
    "[:(j]",
    "[:(k]",
    "[:(l]",
    "[:(m]",
    "[:(n]",
    "[:(o]",
    "[:(p]",
    "[:(q]",
    "[:(r]",
    "[:(s]",
    "[:(t]",
    "[:(u]",
    "[:(v]",
    "[:(w]",
    "[:(x]",
    "[:(y]",
    "[:(z]",
  ];
  static List<String> _valueList = [
    "ee_1",
    "ee_2",
    "ee_3",
    "ee_4",
    "ee_5",
    "ee_6",
    "ee_7",
    "ee_8",
    "ee_9",
    "ee_10",
    "ee_11",
    "ee_12",
    "ee_13",
    "ee_14",
    "ee_15",
    "ee_16",
    "ee_17",
    "ee_18",
    "ee_19",
    "ee_20",
    "ee_21",
    "ee_22",
    "ee_23",
    "ee_24",
    "ee_25",
    "ee_26",
    "ee_27",
    "ee_28",
    "ee_29",
    "ee_30",
    "ee_31",
    "ee_32",
    "ee_33",
    "ee_34",
    "ee_35",
    "ee_36",
    "ee_37",
    "ee_38",
    "ee_39",
    "ee_40",
    "ee_41",
    "ee_42",
    "ee_43",
    "ee_44",
    "ee_45",
    "ee_46",
    "ee_47",
    "ee_48",
    "ee_49",
    "ee_50",
    "ee_51",
    "ee_52",
    "ee_53",
    "ee_54",
    "ee_55",
    "ee_56",
    "ee_57",
    "ee_58",
    "ee_59",
    "ee_60",
    "ee_61",
    "ee_62",
    "ee_63",
    "ee_64",
    "ee_65",
    "ee_66",
    "ee_67",
    "ee_68",
    "ee_69",
    "ee_70",
    "ee_71",
    "ee_72",
    "ee_73",
    "ee_74",
    "ee_75",
    "ee_76",
    "ee_77",
    "ee_78",
    "ee_79",
    "ee_80",
    "ee_81",
    "ee_82",
    "ee_83",
    "ee_84",
    "ee_85",
    "ee_86",
    "ee_87",
    "ee_88",
    "ee_89",
    "ee_90",
    "ee_91",
    "ee_92",
    "ee_93",
    "ee_94",
    "ee_95",
    "ee_96",
    "ee_97",
    "ee_98",
    "ee_99",
    "ee_100",
    "ee_101",
    "ee_102",
    "ee_103",
    "ee_104",
    "ee_105",
    "ee_106",
    "ee_107",
    "ee_108",
    "ee_109",
    "ee_110",
    "ee_111",
    "ee_112",
    "ee_113",
    "ee_114",
    "ee_115",
    "ee_116",
    "ee_117",
    "ee_118",
    "ee_119",
    "ee_120",
    "ee_121",
    "ee_122",
    "ee_123",
    "ee_124",
    "ee_125",
    "ee_126",
    "ee_127",
    "ee_128",
    "ee_129",
    "ee_130",
    "ee_131",
    "ee_132",
    "ee_133",
    "ee_134",
    "ee_135",
    "ee_136",
    "ee_137",
    "ee_138",
    "ee_139",
    "ee_140",
    "ee_141",
  ];

  static EmojiUtil _instance;

  static EmojiUtil getInstance() {
    if (_instance == null) {
      _instance = EmojiUtil();
    }
    return _instance;
  }

  List<InlineSpan> addSmiles(String content) {
    List<InlineSpan> widgets = [];
    TextStyle style = TextStyle(color: Colors.black);
    content = content.replaceAll("\]", "\[");
    print(content);
    List<String> list = content.split(RegExp(r"\["));
    list.removeWhere((element) => element.isEmpty);
    for (int i = 0; i < list.length; i++) {
      int index = _keyList.indexOf("[${list[i]}]");
      if (index >= 0) {
        widgets.add(WidgetSpan(child: Image.asset("images/${_valueList[index]}.png",width: 25,height: 25,)));
      } else {
        widgets.add(TextSpan(text: list[i],style: style));
      }
    }
    return widgets;
  }
}
