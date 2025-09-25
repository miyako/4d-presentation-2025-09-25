//%attributes = {}
// 入力オブジェクトを非表示にします
OBJECT SET VISIBLE:C603(*; "Label_@"; False:C215)
OBJECT SET VISIBLE:C603(*; "Input_@"; False:C215)

// フォーミュラをクリアします
For ($i; 1; Form:C1466.nbInputs)
	OBJECT SET DATA SOURCE FORMULA:C1851(*; "Input_"+String:C10($i); Null:C1517)
End for 

// 既存のリストボックス列をすべて消去します
LISTBOX DELETE COLUMN:C830(*; "ListBox"; 1; LISTBOX Get number of columns:C831(*; "ListBox"))