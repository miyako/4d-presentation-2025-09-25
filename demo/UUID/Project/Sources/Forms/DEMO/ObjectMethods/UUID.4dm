var $event : Object
$event:=FORM Event:C1606

Case of 
	: ($event.code=On Header Click:K2:40)
		
		Case of 
			: ($event.headerName="Header2")
				
				var $order : Integer
				$order:=OBJECT Get value:C1743($event.headerName)
				
				If ($order=1)
					LISTBOX SORT COLUMNS:C916(*; $event.objectName; 3; <)
				Else 
					LISTBOX SORT COLUMNS:C916(*; $event.objectName; 3; >)
				End if 
				
				OBJECT SET VALUE:C1742($event.headerName; $order=1 ? 2 : 1)
				
				$0:=-1
				
		End case 
		
End case 