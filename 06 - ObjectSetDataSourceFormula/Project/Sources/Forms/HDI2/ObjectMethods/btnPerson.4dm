clearForm

If (Form:C1466.trace)
	TRACE:C157
End if 

// テーブルの構造を取得します
Form:C1466.attributes:=OB Keys:C1719(ds:C1482.Person.new())

// エンティティセレクションを取得します
Form:C1466.dataPerson:=ds:C1482.Person.all()

// リストボックスのデータソースフォーミュラを設定します
OBJECT SET DATA SOURCE FORMULA:C1851(*; "ListBox"; Formula:C1597(Form:C1466.dataPerson))

LISTBOX SET PROPERTY:C1440(*; "ListBox"; lk current item expression:K53:79; "Form.currentItem")