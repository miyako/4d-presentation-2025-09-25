//%attributes = {"invisible":true}
var $response : Object
var $ws : 4D:C1709.WebServer
$ws:=WEB Server:C1674
If (Not:C34($ws.isRunning))
	var $options : Object
	$options:={\
		HTTPEnabled: True:C214; \
		HTTPSEnabled: False:C215; \
		HTTPPort: 80; \
		keepSession: False:C215; \
		debugLog: 7}
	$ws.start($options)
End if 
If (True:C214)
	var $URL : Text
	var $status : Integer
	ARRAY TEXT:C222($names; 0)
	ARRAY TEXT:C222($values; 0)
End if 
If (Storage:C1525.cookie=Null:C1517)
	$URL:=["http:"; ""; "127.0.0.1"; "rest"; "$catalog"; "authentify"].join("/")
	$status:=HTTP Request:C1158(HTTP POST method:K71:2; $URL; ["demo"]; $response; $names; $values)
	If ($status=200)
		Use (Storage:C1525)
			var $cookie : Text
			$cookie:=$values{Find in array:C230($names; "Set-Cookie")}
			ARRAY LONGINT:C221($pos; 0)
			ARRAY LONGINT:C221($len; 0)
			If (Match regex:C1019("([^=]+=[:hex_digit:]{32})"; $cookie; 1; $pos; $len))
				$cookie:=Substring:C12($cookie; $pos{1}; $len{1})
				Storage:C1525.cookie:=New shared object:C1526("value"; $cookie)
			End if 
		End use 
	End if 
End if 
If (Storage:C1525.cookie#Null:C1517)
	APPEND TO ARRAY:C911($names; "Cookie")
	APPEND TO ARRAY:C911($values; Storage:C1525.cookie.value)
End if 

$URL:=["http:"; ""; "127.0.0.1"; "rest"; "Product?$method=update"].join("/")
//$status:=HTTP Request(HTTP POST method; $URL; {name: Null}; $response; $names; $values)
$status:=HTTP Request:C1158(HTTP POST method:K71:2; $URL; {comment: "ぎゃあああ"; name: "あかいきつね"; price: 100}; $response; $names; $values)
