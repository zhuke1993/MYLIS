
//返回到主页
function Back() {
    window.location.href = "LogIndex.htm";
}

//关闭窗体
function Closed() {
    window.close();
}

//打开详细列表窗体
function Details() {
    window.showModalDialog("Details.htm", window, "dialogWidth:400px;dialogHeight:220px;status:no;");
}

//全选按钮(全选或全不选)
function CheckAll(Obj) {
    var allInput = document.getElementsByTagName("input");
    var inputLength = allInput.length;
    var allChkBox = 0;
    var allChecked = 0;

    for (var i = 0; i < inputLength; i++) {
        if (allInput[i].type == "checkbox") {
            allInput[i].checked = Obj.checked;
            if (allInput[i].checked == true) {
                allChecked++;
            }
            allChkBox++;
        }
    }
}

//实现多选按钮至少一个未选中时,全选按钮不选中.多选按钮全部选中时,全选按钮自动选中
function IsCheckAll() {
    var allInput = document.getElementById("tabData").getElementsByTagName("input");
    var isChecked = document.getElementById("CheckAll");
    var inputLength = allInput.length;
    var allChkBox = 0;
    var allChecked = 0;
    var flag = true;
    for (var i = 0; i < inputLength; i++) {
        if (allInput[i].type == "checkbox") {
            if (allInput[i] != isChecked) {
                if (!allInput[i].checked) {
                    flag = false;
                    break;
                }
            }
        }
    }
    if (flag) {
        isChecked.checked = true;
    } else {
        isChecked.checked = false;
    }
}

/*
******利用获取全部页面checkbox与全部选中checkbox比较.判断全选按钮是否选中
function IsCheckAll()
{
var allInput = document.getElementsByTagName("input");
var isChecked = document.getElementById("CheckAll");
var inputLength = allInput.length;
var allChkBox = 0;
var allChecked = 0;
            
if(isChecked.checked == true)
{
for(var i = 0 ; i < inputLength ; i++)
{
if(allInput[i].type == "checkbox")
{
if(allInput[i].checked == true)
{
allChecked++;
}
allChkBox++;
}
}
if(allChecked != allChkBox)
{
isChecked.checked = false;
}
}
            
else
{
for(var i = 0 ; i < inputLength ; i++)
{
if(allInput[i].type == "checkbox")
{
if(allInput[i].checked == true)
{
allChecked++;
}
allChkBox++;
}
}
if(allChecked == (allChkBox-1))
{
isChecked.checked = true;
}
}
}
*/


/*
**********利用JQuery实现全选及全选按钮是否选中
$(function (){
$('#tabData :checkbox').each(function(index,obj) {
if ($(this ).attr('id')!='checkall')
{
$(this).bind("click", function() {
//判断是否以全选    
var flag=true;
$('#tabData :checkbox').each(function(index,obj) {
if ($(this ).attr('id')!='checkall')
{
if(!$(this).attr('checked')){
flag = false;
return;
}
}
});
if(flag){
$("#checkall").attr('checked',true);
} else {
$("#checkall").attr('checked',false);
}
});
}
});
          
$('#checkall').click( function (){
$(':checkbox').attr('checked',$('#checkall').attr('checked') );
});
});
*/