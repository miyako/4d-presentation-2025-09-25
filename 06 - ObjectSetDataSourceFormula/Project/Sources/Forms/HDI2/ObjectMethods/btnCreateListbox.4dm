If (Form:C1466.attributes=Null:C1517)
	return 
End if 

If (Form:C1466.trace)
	TRACE:C157
End if 

// 既存のリストボックス列をすべて消去します
LISTBOX DELETE COLUMN:C830(*; "ListBox"; 1; LISTBOX Get number of columns:C831(*; "ListBox"))

// リストボックス列を作成します
For each ($item; Form:C1466.attributes)
	LISTBOX INSERT COLUMN FORMULA:C970(*; "ListBox"; 1; "col_"+$item; "This."+$item; Is text:K8:3; "header_"+$item; abc)
	OBJECT SET TITLE:C194(*; "header_"+$item; $item)
End for each 
