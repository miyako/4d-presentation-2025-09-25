Class extends Entity

exposed Function get 黒字/*計算属性*/: Boolean
	
	return This:C1470.販売価格>This:C1470.原価
	
Function query 黒字/*計算属性*/($e : Object) : Object
	
	var $operator : Text
	$operator:=$e.operator
	
	var $黒字 : Boolean
	Case of 
		: (["="; "=="; "==="].includes($operator))
			$黒字:=$e.value
		: (["#"; "!="; "<>"].includes($operator))
			$黒字:=Not:C34($e.value)
	End case 
	
	var $query : 4D:C1709.Function
	$query:=$黒字 ? Formula:C1597(This:C1470.販売価格>This:C1470.原価) : Formula:C1597(This:C1470.販売価格<=This:C1470.原価)
	
	return {query: ":1"; parameters: [$query]}
	
/*
	
ここからR10
	
*/
	
Function event touched 販売価格($e : Object)
	
	If (This:C1470[$e.attributeName]>This:C1470.原価)
		This:C1470.赤字:=False:C215
	Else 
		This:C1470.赤字:=True:C214
	End if 
	
Function event touched 原価($e : Object)
	
	If (This:C1470.販売価格<=This:C1470[$e.attributeName])
		This:C1470.赤字:=True:C214
	Else 
		This:C1470.赤字:=False:C215
	End if 