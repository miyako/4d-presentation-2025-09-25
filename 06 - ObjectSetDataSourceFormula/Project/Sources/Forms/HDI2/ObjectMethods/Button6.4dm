If (Form:C1466.trace)
	TRACE:C157
End if 

var $formula : 4D:C1709.Function

// "InputTest" フォームオブジェクトに関連づいているデータソースフォーミュラを取得します 
$formula:=OBJECT Get data source formula:C1852(*; "InputTest")

// フォーミュラの文字列を表示します
ALERT:C41($formula.source)