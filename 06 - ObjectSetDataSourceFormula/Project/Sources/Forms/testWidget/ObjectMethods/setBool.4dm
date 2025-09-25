If (OBJECT Get data source formula:C1852(*; "bool_@").source="Form.true")
	OBJECT SET DATA SOURCE FORMULA:C1851(*; "bool_@"; Formula:C1597(Form:C1466.false))
Else 
	OBJECT SET DATA SOURCE FORMULA:C1851(*; "bool_@"; Formula:C1597(Form:C1466.true))
End if 