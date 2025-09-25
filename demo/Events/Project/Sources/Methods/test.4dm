//%attributes = {"invisible":true}
var $product : cs:C1710.ProductEntity
$product:=ds:C1482.Product.new()
$product.name:="白いきつね"
$product.原価:=50
$product.販売価格:=100
$product.save()

$product:=ds:C1482.Product.new()
$product.name:="黒いたぬき"
$product.原価:=500
$product.販売価格:=100
$product.save()

var $stats : Text
var $products : cs:C1710.ProductSelection
$products:=ds:C1482.Product.query("黒字 == :1"; True:C214)
$stats:=[$products.length; ds:C1482.Product.getCount()].join("/")

$products:=ds:C1482.Product.query("赤字 != :1"; True:C214)
$stats:=[$products.length; ds:C1482.Product.getCount()].join("/")
