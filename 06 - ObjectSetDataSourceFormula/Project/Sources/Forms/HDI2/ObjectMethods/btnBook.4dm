clearForm

If (Form:C1466.trace)
	TRACE:C157
End if 

// テーブルの構造を取得します
Form:C1466.attributes:=OB Keys:C1719(ds:C1482.Book.new())

// エンティティセレクションを取得します
Form:C1466.dataBook:=ds:C1482.Book.all()

// リストボックスのデータソースフォーミュラを設定します
OBJECT SET DATA SOURCE FORMULA:C1851(*; "ListBox"; Formula:C1597(Form:C1466.dataBook))

LISTBOX SET PROPERTY:C1440(*; "ListBox"; lk current item expression:K53:79; "Form.currentItem")