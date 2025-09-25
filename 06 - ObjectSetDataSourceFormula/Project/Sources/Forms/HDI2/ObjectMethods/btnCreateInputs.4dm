var $l_x1; $l_y1; $l_x2; $l_y2; $i_x1; $i_y1; $i_x2; $i_y2 : Integer
var $item : Text
var $formula : 4D:C1709.Function

OBJECT GET COORDINATES:C663(*; "Label"; $l_x1; $l_y1; $l_x2; $l_y2)
OBJECT GET COORDINATES:C663(*; "Input"; $i_x1; $i_y1; $i_x2; $i_y2)

OBJECT SET VISIBLE:C603(*; "Label@"; False:C215)
OBJECT SET VISIBLE:C603(*; "Input@"; False:C215)

If (Form:C1466.trace)
	TRACE:C157
End if 

var $index:=0
For each ($item; Form:C1466.attributes)
	$l_y1+=30
	$l_y2+=30
	$i_y1+=30
	$i_y2+=30
	
	$index+=1
	
	// ラベルを作成します
	OBJECT DUPLICATE:C1111(*; "Label"; "Label_"+String:C10($index))
	OBJECT SET VISIBLE:C603(*; "Label_"+String:C10($index); True:C214)
	OBJECT SET COORDINATES:C1248(*; "Label_"+String:C10($index); $l_x1; $l_y1; $l_x2; $l_y2)
	OBJECT SET TITLE:C194(*; "Label_"+String:C10($index); $item)
	
	// 入力オブジェクトを作成します
	OBJECT DUPLICATE:C1111(*; "Input"; "Input_"+String:C10($index))
	OBJECT SET VISIBLE:C603(*; "Input_"+String:C10($index); True:C214)
	OBJECT SET COORDINATES:C1248(*; "Input_"+String:C10($index); $i_x1; $i_y1; $i_x2; $i_y2)
	OBJECT SET PLACEHOLDER:C1295(*; "Input_"+String:C10($index); $item)
	
	// 入力オブジェクトにデータソースフォーミュラを設定します
	$formula:=Formula from string:C1601("Form.currentItem."+$item)
	OBJECT SET DATA SOURCE FORMULA:C1851(*; "Input_"+String:C10($index); $formula)
End for each 

If ($index>Form:C1466.nbInputs)
	Form:C1466.nbInputs:=$index
End if 