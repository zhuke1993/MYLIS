/*----------------------------------------------------------------
// Copyright (C) 2010 
// 版权所有。 
//
// 文件名：js验证
// 文件功能描述：验证
//
// 
// 创建标识：
//
// 修改标识：
// 修改描述：
//
// 修改标识：
// 修改描述：
//----------------------------------------------------------------*/



//公共方法
function isNullPublic(content, geuiz) {
    //判断是否为空
    if (content.value.toString().length == 0) {
        //如果为空显示提示信息
        document.getElementById(content.id + "Error").innerHTML = "";
        return true;
    }
    else {
        //验证电话
        if (geuiz == 'Phone') {
            return Phone(content);
        }
        //验证传真
        if (geuiz == 'Fox') {
            return Fox(content);
        }      //验证邮编
        if (geuiz == 'YB') {
            return YB(content);
        }
        //验证数字
        if (geuiz == 'Num') {
            return Num(content);
        }
        //验证网址
        if (geuiz == 'Line') {
            return Line(content);
        }
        //验证电子邮箱
        if (geuiz == 'Email') {
            return Email(content);
        }
        //ID
        if (geuiz == 'ID') {
            return ID(content);
        }
        if (geuiz == 'DropDownSelect') {
            return DropDownSelect(content);
        }
        if (geuiz == 'Bank') {
            return Bank(content);
        }
        if (geuiz == 'PWD') {
            return PWD(content);
        }
        if (geuiz == 'ZNum') {
            return ZNum(content);
        }
    }
}
//可填可不填选项
function isNull(content, geuiz, length) {

    if (typeof (undefined) == typeof (length)) {
        return isNullPublic(content, geuiz);
    }
    else {

        //判断是否为空
        if (content.value.toString().length == 0) {
            //如果为空显示提示信息
            document.getElementById(content.id + "Error").innerHTML = "";
            return true;
        }
        else {

            //验证电话
            if (geuiz == 'EName') {
                return EName(content, length);
            }
            if (geuiz == 'UserName') {
                return UserName(content, length);
            }
            if (geuiz == 'Length') {
                return Length(content, length);
            }
            if (geuiz == 'RePWD') {
                return RePWD(content, length);
            }
            if (geuiz == 'UpFile') {
                return UpFile(content, length);
            }
        }
    }
}
//登陆名
function UserName(content, length) {
    //验证是否为空
    if (IsEmpty(content)) {
        if (Length(content, length)) {
            //是否含有非法字符
            var myReg = /^^(?:[\u4e00-\u9fa5]*\w*\s*)+$/;
            var myRegh = /^[A-Za-z0-9]+$/;
            if (!myRegh.test(content.value)) {
                ShowMsg(content.id, "<font color='red'>只能输入由数字和 26 个英文字母组成的字符串！</font>");
                return false;
            }

            //匹配表达式
            if (!myReg.test(content.value)) {
                ShowMsg(content.id, "<font color='red'>不能含有非法字符！</font>");
                return false;
            }
            else {
                ShowMsg(content.id);
                return true;
            }
        }
    }
}
//长度验证
function Length(content, num) {
    //判断是否为空
    if (content.value.toString().length > parseInt(num)) {
        //如果为空显示提示信息
        ShowMsg(content.id, "<font color='red'>超出规定长度" + num + "！</font>");
        return false;
    }
    else {
        ShowMsg(content.id);
        return true;
    }
}
//年龄验证
function Age(content, begin, end) {
    if (IsZNum(content)) {
        var startAge = parseInt(begin);
        var endAge = parseInt(end);
        var age = parseInt(content.value)
        if (age > endAge || age < startAge) {
            ShowMsg(content.id, "<font color='red'>年龄有问题！</font>");
            return false;
        }
        else {
            ShowMsg(content.id);
            return true;
        }
    }
}
//下拉列表验证
function DropDownSelect(content) {
    if (content.value.lastIndexOf('-') < 0) {
        ShowMsg(content.id);
        return true;
    }
    else {
        ShowMsg(content.id, "<font color='red'>请选择合法的项！</font>");
        return false;
    }
}
//姓名只能是a-z或中文汉字6-10个字符 
function Name(content){
    var myReg =/^[u4e00-u9fa5]{2,5}|(^[a-zA-Z]+[s.]?([a-zA-Z]+[s.]?){0,4}[a-zA-Z]$)/;
 //判断是否为空
    if (content.value.toString().length == 0) {
        //如果为空显示提示信息

        ShowMsg(content.id, "<font color='red'>不能为空！</font>");
        return false;
    }
    else {
        if(!myReg .test (content.valueOf))
        {
            ShowMsg(content.id, "<font color='red'>只能输入 26 个英文字母或汉字组成的字符串！</font>");
            return false;
        }
         else{
            ShowMsg(content.id);
            return true;
        }
    }
}
//为空验证
function IsEmpty(content) {
    //判断是否为空
    if (content.value.toString().length == 0) {
        //如果为空显示提示信息

        ShowMsg(content.id, "<font color='red'>不能为空！</font>");
        return false;
    }
    else {

        ShowMsg(content.id);
        return true;
    }

}
//电话号码
function Phone(content) {
    //电话号码正则表达式
    var myReg = /^(\d{3,4}\-)?[1-9]\d{6,7}$|(\d{11})/;
    //匹配表达式
    if (!myReg.test(content.value)) {
        ShowMsg(content.id, "<font color='red'>电话号码格式不正确！</font>");
        return false;
    }
    else {
        ShowMsg(content.id);
        return true;
    }
}
//英文姓名
function EName(content, num) {
    if (Length(content, num)) {
        //英文姓名正则表达式
        var myReg = /^[A-Za-z]+$/;
        if (!myReg.test(content.value)) {
            ShowMsg(content.id, "<font color='red'>只能输入 26 个英文字母组成的字符串！</font>");
            return false;
        }
        else {
            ShowMsg(content.id);
            return true;
        }
    }
}
//传真
function Fox(content) {
    //传真正则表达式
    var myReg = /^(\(\d{3}\)|\d{3}-)?\d{8}/;
    //匹配表达式
    if (!myReg.test(content.value)) {
        ShowMsg(content.id, "<font color='red'>传真格式不正确！</font>");
        return false;
    }
    else {
        ShowMsg(content.id);
        return true;
    }
}
//邮编
function YB(content) {
    //邮编正则表达式
    var myReg = /^\d{6}/;
    if (!myReg.test(content.value)) {
        ShowMsg(content.id, "<font color='red'>邮编格式不正确！</font>");
        return false;
    }
    else {
        ShowMsg(content.id);
        return true;
    }
}
//开户银行
function Bank(content) {
    //为空验证
    if (IsEmpty(content)) {
        //银行规则正则表达式
        var myReg = /^(?:[\u4e00-\u9fa5]*\w*\s*)+$/;
        if (!myReg.test(content.value)) {
            ShowMsg(content.id, "<font color='red'>开户银行不能含有特殊字符！</font>");
            return false;
        }
        else {
            ShowMsg(content.id);
            return true;
        }
    }

}
//pwd
function PWD(content) {
    //密码规则正则表达式
    var myReg = /^[\x01-\xfe]{6,18}$/;
    if (!myReg.test(content.value)) {
        ShowMsg(content.id, "<font color='red'>长度在6～18之间！</font>");
        return false;
    }
    else {
        ShowMsg(content.id);
        return true;
    }
}
function RePWD(content, pwdid) {
    //密码规则正则表达式
    var myReg = /^[\x01-\xfe]{6,18}$/;

    if (!myReg.test(content.value)) {
        ShowMsg(content.id, "<font color='red'>长度在6～18之间！</font>");
        return false;
    } else {
        //密码
        var pwdrContent = document.getElementById(pwdid).value;
        //重复密码
        var pwdcontent = content.value;
        if (pwdcontent.toString() != pwdrContent.toString()) {
            ShowMsg(content.id, "<font color='red'>两次密码不一致！</font>");
            return false;
        }
        else {
            ShowMsg(content.id);
            return true;

        }
    }
}
//数字验证
function IsNum(content) {
    //为空验证
    if (IsEmpty(content)) {
        //数字规则正则表达式

        var myReg = /^^\d*$/;
        if (!myReg.test(content.value)) {
            ShowMsg(content.id, "<font color='red'>只能输入数字！</font>");
            return false;
        }
        else {
            ShowMsg(content.id);
            return true;
        }
    }
}
//正整数验证
function IsZNum(content) {
    //正整数规则正则表达式
    var myReg = /^\+?[1-9][0-9]*$/;
    if (!myReg.test(content.value)) {
        ShowMsg(content.id, "<font color='red'>只能输入非零的正整数！</font>");
        return false;
    }
    else {
        ShowMsg(content.id);

        return true;
    }
}
//网址验证
function Line(content) {
    //网址规则正则表达式
    var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
    + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@  
    + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184  
    + "|" // 允许IP和DOMAIN（域名） 
    + "([0-9a-z_!~*'()-]+\.)*" // 域名- www.  
    + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名  
    + "[a-z]{2,6})" // first level domain- .com or .museum  
    + "(:[0-9]{1,4})?" // 端口- :80  
    + "((/?)|" // a slash isn't required if there is no file name  
    + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
    var myReg = new RegExp(strRegex);
    if (!myReg.test(content.value)) {
        ShowMsg(content.id, "<font color='red'>网址格式不正确！</font>");
        return false;
    }
    else {
        ShowMsg(content.id);

        return true;
    }
}
//电子邮件验证
function Email(content) {
    //邮箱规则正则表达式
    var myReg = /^^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    if (!myReg.test(content.value)) {
        ShowMsg(content.id, "<font color='red'>邮箱格式不正确！</font>");
        return false;
    }
    else {
        ShowMsg(content.id);
        return true;
    }
}
//身份证验证
function ID(content) {
    //身份证规则正则表达式
    var myReg = /^(^\d{15}$)|(\d{17}(?:\d|x|X)$)/;
    if (!myReg.test(content.value)) {
        ShowMsg(content.id, "<font color='red'>身份证格式不正确！</font>");
        return false;
    }
    else {
        ShowMsg(content.id);
        return true;
    }

}
//银行帐号
function BankCode(obj)
{
    var myReg= /^\d{19}$/g;
     if (!myReg.test(content.value)) {
        ShowMsg(content.id, "<font color='red'>账号位数不对！</font>");
        return false;
    }
    else {
        ShowMsg(content.id);
        return true;
    }
}
//价格： (保留两位小数) 
function Money(obj)
{
    var myReg=/^[0-9]+([.]\d{1,2})?$/;
    if (!myReg.test(obj.value)) {
        ShowMsg(obj.id, "<font color='red'>保留两位小数！</font>");
        return false;
    }
    else {
        ShowMsg(obj.id);
        return true;
    }

}
//上传文件格式验证
function UpFile(content, compare) {
    //当为空时不判断
    if (content.value.toString().length != 0) {
        //标记
        var tag = false;
        //文件上传的类型
        var compareU = content.value.substring(content.value.lastIndexOf('.') + 1, content.value.length).toLowerCase();
        //要上传的类型
        var compareD = compare.split(',');

        for (var i = 0; i < compareD.length; i++) {
            //是否有一项匹配
            if (compareU == compareD[i].toLowerCase()) {
                tag = true;
                break;
            }
        }
        if (!tag) {
            ShowMsg(content.id, "<font color='red'>上传文件格式不正确,必须是" + compare + "格式！</font>");
            return false;
        }
        else {
            ShowMsg(content.id);

            return true;
        }
    }
    else {
        document.getElementById(content.id + "Error").innerHTML = "";
        return true;
    }
}
//错误提示
function ShowMsg(id, content) {
    if (typeof (content) != typeof (undefined)) {
        return $('#' + id + 'Error').html("<img alt='' src='images/error.png' />"+content);
    }
    else {
        return $('#' + id + 'Error').html("<img alt='' src='images/done.png' />");
    }
}
//表单事件
function Formsubmit() {
    //定义标记
    var tag = false;
    $('.Error').each(function() {
        var value = $.trim($(this).text());
        if (value == null || value == "") {
            return tag = true;
        } else {
            return tag = false;
        }
    });

    return tag;
}
//绑定表单submit事件
$(function() {
    $('form').bind("submit", function() { return Formsubmit() });
});
$(function() {
    $('input').hover(
  function() {
      $(this).addClass("hover");
  },
  function() {
      $(this).removeClass("hover");
  }

);
});
/*
6.有效期验证待定....
7.互换码验证待定....
9.传真验证  非空 整数 格式
10.BP机验证  非空 整数 格式
12.简称与拼音代码(字母)、五笔代码(拼音、正确性)   长度相同  非空  
15.账号 非空 位数  数字
16.税号  非空  格式

票据：*(按格式输入如“k001-2008-01-01”) 

工资 数字验证（只输入数字，范围规定：0-100）是否为数字


时间格式验证（格式如：2000-02-02） 日期  情况一 不能大于当前日期 情况二 区间查询那种 前面的时间要小于后面的时间 后面的药大于前面的



 */