Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.text:="input"
		Form:C1466.number:=10
		Form:C1466.true:=True:C214
		Form:C1466.false:=False:C215
		
		Form:C1466.list:=New object:C1471
		Form:C1466.list.values:=New collection:C1472("apples"; "nuts"; "pears"; "oranges"; "carrots")
		Form:C1466.list.index:=-1  // currentValue is a placeholder
		Form:C1466.list.currentValue:="Select a fruit"
		
		Form:C1466.document:=WP New:C1317("blabla")
		Form:C1466.subform:={text1: "aaaa"; text2: "zzzz"}
		
		Form:C1466.collection:=["a"; "b"; "c"; "d"; "e"]
		Form:C1466.colObject:=[{value: "f"}; {value: "g"}; {value: "h"}; {value: "i"}; {value: "j"}]
		
		
		Form:C1466.mylist:=New list:C375
		APPEND TO LIST:C376(Form:C1466.mylist; "a"; 1)
		APPEND TO LIST:C376(Form:C1466.mylist; "b"; 2)
		APPEND TO LIST:C376(Form:C1466.mylist; "c"; 3)
		APPEND TO LIST:C376(Form:C1466.mylist; "d"; 4)
		
		
		
End case 