var $event : Object
$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		Form:C1466.Table_1:={col: Null:C1517; item: Null:C1517; pos: Null:C1517; sel: Null:C1517}
		
		Form:C1466.canonical:=Formula:C1597(canonical)
		
	: ($event.code=On Clicked:K2:4)
		
		Case of 
			: ($event.objectName="restartProject")
				
				RESTART 4D:C1292
				
			: ($event.objectName="UUID v4")
				
				var $col : Collection
				$col:=[]
				var $i : Integer
				For ($i; 1; 100)
					$col.push({UUID: Generate UUID:C1066(4); Sequence: $i})
				End for 
				
				Form:C1466.Table_1.col:=$col
				
				OBJECT SET VALUE:C1742("Header1"; 0)
				OBJECT SET VALUE:C1742("Header2"; 0)
				
			: ($event.objectName="UUID v7")
				
				$col:=[]
				For ($i; 1; 100)
					$col.push({UUID: Generate UUID:C1066(7); Sequence: $i})
				End for 
				
				Form:C1466.Table_1.col:=$col
				
				OBJECT SET VALUE:C1742("Header1"; 0)
				OBJECT SET VALUE:C1742("Header2"; 0)
				
			: ($event.objectName="createRecords")
				
				TRUNCATE TABLE:C1051([Table_1:1])
				SET DATABASE PARAMETER:C642([Table_1:1]; Table sequence number:K37:31; 0)
				For ($i; 1; 100)
					ds:C1482.Table_1.new().save()
				End for 
				
				Form:C1466.Table_1.col:=ds:C1482.Table_1.all()
				
				OBJECT SET VALUE:C1742("Header1"; 0)
				OBJECT SET VALUE:C1742("Header2"; 0)
				
			: ($event.objectName="openDatabaseSettings")
				OPEN SETTINGS WINDOW:C903("/Database/Database/Data storage"; True:C214)
		End case 
		
End case 