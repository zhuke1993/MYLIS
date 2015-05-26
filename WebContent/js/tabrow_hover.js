/**
 * 表格的光棒效果
 * @param tab_id (可选参数)表格的id。默认id为tab_data
 * @param hover_color (可选参数)当鼠标移上行时，需要设置的行背景色。默认值：#F2FAFA
 * @param out_color (可选参数)当鼠标移出行时，需要设置的行背景色。默认值：当前行的初始背景色。
 * 
 * 请注意：适用于第一行为标题的表格。
 */
function tabrow_hover(tab_id, hover_color, out_color) {
	if (tab_id == null) {
		tab_id = "tab_data";
	}
	if (hover_color == null) {
		//hover_color = "#F2FAFA";
		hover_color = "#FFFFE1";
	}
	var tab = document.getElementById(tab_id);
	if (tab != null) {
		for ( var i = 1; i < tab.rows.length; i+=1) {
			// 若没有传递out_color参数，则采用该行的当前的背景色
			if (out_color==null) {
				tab.rows[i]._$bg = tab.rows[i].style.backgroundColor;
			} 
			tab.rows[i].onmouseover = function() {
				this.style.backgroundColor = hover_color;
			}
			tab.rows[i].onmouseout = function() {
				this.style.backgroundColor = (this._$bg==null) ? out_color : this._$bg;
			}
		}
	}
}