Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		
		Form:C1466.trace:=True:C214
		Form:C1466.nbInputs:=0
		Form:C1466.attribute1:="Value 1"
		Form:C1466.attribute2:="Value 2"
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Application info:C1599().SDIMode)
			QUIT 4D:C291
		Else 
			CANCEL:C270
		End if 
		
End case 

