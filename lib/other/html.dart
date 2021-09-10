import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/commonAppBar.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlPage extends StatelessWidget {
  // var content =
  //     "“不积百Book，无以至千里”，有书共读第100期啦～回看“如何读完100本书”直播，快来收割读书干货吧！#我们相遇的第100周#<br\/>咳咳～好啦～正事说完，现在来晒超级幕后花絮[(U)]<p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007185cb6da.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007185d0414.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007185d5b7c.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007185eb799.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007185f04b7.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007186010e9.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007186137f4.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a00718619e51.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a00718621c7a.jpeg\" \/><\/p>";

  final String content =
      "<section class=\"js-block block-item gorse-editor\"><section class=\"block-content\" style=\"width: 100%; overflow: hidden; clear: both; margin-right: auto; margin-left: auto;\"><section class=\"js-block block-item gorse-editor\"><section class=\"block-content\" style=\"display:block;clear:both;position:relative;width:100%;margin:0 auto;overflow:hidden;\"><p><img title=\"从图库选择图片\" style=\"width: 100%;\" data-photo-type=\"upload\" data-photo-id=\"PU_3kbXGm4_4540\" contenteditable=\"false\" class=\"js-image image-item js-hide\" src=\"http:\/\/feed.youshu.cc\/editor\/user\/297\/upload\/PU_zMBJoM4_660\" data-original-width=\"460\" data-original-height=\"318\" _src=\"http:\/\/feed.youshu.cc\/editor\/user\/297\/upload\/PU_zMBJoM4_660\"><\/p><\/section><\/section><p style=\"margin-right: 5.34%; margin-left: 5.34%; text-align: center;\"><span style=\"color: rgb(127, 127, 127); font-size: 12px; text-align: center;\">点击查看大图，保存到手机，也可以分享到朋友圈<\/span><\/p><\/section><\/section><section class=\"js-block block-item gorse-editor\"><section class=\"block-content\" style=\"display:block;clear:both;position:relative;width:100%;margin:0 auto;overflow:hidden;\"><p style=\"text-align: center;\"><br><\/p><\/section><\/section><section class=\"js-block block-item gorse-editor active\" style=\"top: auto; position: relative;\" data-margin=\"5.67\"><section class=\"block-content\" style=\"margin: 0px auto; width: 100%; overflow: hidden; clear: both; display: block; position: relative;\"><p style=\"margin: 20px 5.67%; text-align: center; line-height: 2em;\"><span style=\"color: rgb(63, 63, 63);\"><strong><span style=\"font-size: 18px;\">——· 关于本书 ·——<\/span><\/strong><\/span><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">《巴菲特之道》是第一本把巴菲特介绍到中国的书，也是被公认为总结巴菲特投资思想最好的书。很多国内投资人正是通过阅读本书，成为巴菲特投资理念的实践者。早在20年前就打开了人们了解巴菲特以及巴菲特思想的序幕。作者在书中详细介绍了巴菲特做出重要投资决策的全过程，包括最近收购亨氏食品、投资IBM等最新案例，使读者无限接近巴菲特的真实生活理念和投资观念。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><br><\/p><p style=\"margin: 20px 5.67%; line-height: 2em; text-align: center;\"><span style=\"color: rgb(63, 63, 63);\"><strong><span style=\"color: rgb(63, 63, 63); font-size: 18px;\">——· 关于作者 ·——<\/span><\/strong><\/span><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">本书的作者罗伯特·哈格斯特朗，现任美盛投资顾问公司首席投资策略师、董事总经理。上世纪80年代，开始学习巴菲特的投资方法。出版了包括《巴菲特的投资组合》《查理·芒格的智慧》在内的9本投资书籍。其中，《巴菲特之道》是投资者推荐最多的一本研究巴菲特的书，一经出版，就已经销售120万册。著名的先锋基金创始人约翰·博格对本书给予了高度评价，认为巴菲特朴素的智慧与哲学都完美地呈现在这本《巴菲特之道》中。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><br><\/p><p style=\"margin: 20px 5.67%; text-align: center; line-height: 2em;\"><span style=\"color: rgb(63, 63, 63);\"><strong><span style=\"color: rgb(63, 63, 63); font-size: 18px;\">——· 本书金句 ·——<\/span><\/strong><\/span><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">1.我们的投资将基于价值，而不是市场的热点。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">2.衡量一家银行运营效率的指标是运营（例如非利息）成本对净收入之比。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">3.谨慎的投资决策能让你避免做傻事，并能帮助你致富；草率的投资决策，则会让你血本无归。 <\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">4.“把股票当作生意的一部分”是一个非常重要的概念。 <\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">5.巴菲特所有成功的投资标的，都是在市场上充斥利空消息时买入的——他喜欢在股价跌到谷底时买入。 <\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">6.一个投资者最大的敌人不是股市，而是自己。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><br><\/p><p style=\"margin: 20px 5.67%; line-height: 2em; text-align: center;\"><span style=\"color: rgb(63, 63, 63);\"><strong><span style=\"color: rgb(63, 63, 63); font-size: 18px;\">——·核心内容 ·——<\/span><\/strong><\/span><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>一、知根知底，做个勤快的投资者<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">巴菲特有一套独特的筛选工具，能够筛选出高质量的企业，这种方法被称为“十二准则”。这些准则是巴菲特管理伯克希尔公司的原则，也是他价值投资方法的核心。这些准则可以归纳为四个方面：3个企业准则、3个管理准则、4个财务准则和2个市场准则。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>1.企业准则<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">巴菲特对于企业准则的要求，主要有三条，简单易懂、具有持续稳定的经营历史，还要有良好的长期前景。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>2.管理准则<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">巴菲特对管理层的评价标准有三条：理性、坦诚和独立思考。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>3.财务准则<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">这是巴菲特用来衡量管理水平和财务表现的准则，包括净资产回报率、股东盈余、高利润率以及留存利润等等。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>4.市场准则<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">包括企业的价值和股票的价格。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>二、从长计议，做个耐心的投资者<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">时间和耐心，是巴菲特投资的精华之一。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>1.耐心要用对地方<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">通过“十二准则”筛选出来的股票都是成长性好、价值型的潜力股。要把你的投资集中在这几只可以超越平均表现的、提供最高回报的公司上，即使在遭遇短期市场漩涡波动时，也要忍耐坚持。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>2.长期持有<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">这种看似懒惰的行为，除了确定超越平均的增长率之外，还能减少交易费用。但长期持有的目的并不是不交易，总的大原则是调整范围在10%~20%。对于持有十年的组合保持10%的调整范围，对于五年的组合有20%的调整范围<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>三、三思而行，做个理性的投资者<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>1.克服过分自信<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">自信本身并不是坏事，但是过度自信却容易造成错误的决定。要避免这种心理现象，最好的办法就是投资股票，然后不要随时查看股票行情，无论是用电脑、手机还是其他设备。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>2.短视损失厌恶<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">损失厌恶是指人们面对同样数量的收益和损失时，认为损失更加令他们难以忍受。而短视损失厌恶是指，如果损失厌恶的投资者不去频繁评估他们的投资绩效，则会更愿意承担风险。一年看一次大盘是最佳的时间间隔。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><strong>3.避免旅鼠悖论<\/strong><\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\">旅鼠悖论又被称为投资从众行为，是一种从众心理的表现。当他人基于短期的贪婪与恐惧做决策时，理性更为重要，这就是赚钱的秘密。<\/p><p style=\"margin: 20px 5.67%; line-height: 2em;\"><br><\/p><\/section><\/section><section class=\"js-block block-item gorse-editor\" data-margin=\"5.66\"><section class=\"block-content\" style=\"margin: 0px auto; width: 100%; overflow: hidden; clear: both; display: block; position: relative;\"><p style=\"margin: 5px 5.66%; text-align: justify; line-height: 2em;\"><span style=\"color: rgb(63, 63, 63);\"><strong style=\"color: rgb(63, 63, 63);\">撰稿：<\/strong>咪猫发财<\/span><\/p><p style=\"margin: 5px 5.66%; text-align: justify; line-height: 2em;\"><span style=\"color: rgb(63, 63, 63);\"><strong style=\"color: rgb(63, 63, 63);\">讲述：<\/strong>杨枪枪<\/span><\/p><p style=\"margin: 5px 5.66%; text-align: justify; line-height: 2em;\"><strong>绘图：<\/strong>洛思思<\/p><\/section><\/section><section class=\"js-block block-item gorse-editor\"><section class=\"block-content\" style=\"margin: 0px auto; width: 100%; overflow: hidden; clear: both; display: block; position: relative;\"><p style=\"text-align: center; line-height: 2em; margin-top: 5px; margin-bottom: 5px;\"><span style=\"color: rgb(63, 63, 63); font-size: 16px;\">- END -<br><\/span><\/p><\/section><\/section><section class=\"js-block block-item gorse-editor js-block-first\"><section class=\"block-content\" style=\"display:block;clear:both;position:relative;width:100%;margin:0 auto;overflow:hidden;\"><p><br><\/p><\/section><\/section>";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(context, "Html"),
      body: ListView(
        children: [
          Html(
            data: content,
            onImageTap: (url, context, attributes, element) {
              print("url =====>  $url");
              print("attributes =====>  $attributes");
              print("element =====>  $element");
            },
          )
        ],
      ),
    );
  }
}
