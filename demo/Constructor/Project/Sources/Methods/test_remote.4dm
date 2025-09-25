//%attributes = {"invisible":true}
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
	$ws.start()
End if 
var $demo : 4D:C1709.DataStoreImplementation
$demo:=ds:C1482("demo")
If ($demo=Null:C1517)
	var $connectionInfo : Object
	$connectionInfo:={hostname: "127.0.0.1"; tls: False:C215}
	$demo:=Open datastore:C1452($connectionInfo; "demo")
	//%W-550.2
	If ($demo.authentify("demo"))
		$demo:=ds:C1482("demo")
	End if 
	//%W+550.2
End if 

var $status : Object
var $product : 4D:C1709.Entity
$product:=$demo.Product.new()
$status:=$product.save()