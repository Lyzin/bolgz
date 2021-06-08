var navEle = document.getElementsByClassName('sidebar');
var alinks = navEle[0].getElementsByTagName('li');
var cardLists = document.querySelectorAll('.card');

// 排他思想处理按钮点击变色
for (var i = 0; i < alinks.length; i++){
    // 设置自定义属性，index索引
    alinks[i].setAttribute('index',i);

    alinks[i].onclick = function (){
        for (var j = 0; j < alinks.length; j++){
            alinks[j].className = '';
        }
        this.className = 'active';

        // 查看card索引值
        var indexVal = this.getAttribute('index');

        // 先用排他思想去除其他crad，然后根据索引值显示对应card里的内容
        for (var k = 0; k < cardLists.length; k++){
            cardLists[k].style.display = 'none';
        }
        cardLists[indexVal].style.display = 'block';

    }
}