# 4d-presentation-2025-09-25

* 01 - WP_SemanticSearch
* 02 - SemanticImageFiltering
* 03 - AI 4D Customers Similarities detection

`PROJECT`と同階層にある`OpenAI.token`ファイルにOpen AIのAPIキーを登録してください。

4D 20 R10の**ベータ版**は[7月10日](https://blog.4d.com/ja/4d-20-r10-beta-starts-today/)に開始し，10月第1週のリリースに向けて順調に準備が進められてきました。**公式ブログ**には，[R10のタグ記事](https://blog.4d.com/tag/20-r10/)が19個，[例題](https://github.com/4D-JP/HDI/releases/tag/20r10)が14個が公開されています。[フォーラム](https://discuss.4d.com/c/beta/13)で特に反響が多く寄せられている新機能は①AI連携と②ORDAイベントです。

R10では，新しいタイプのオブジェクト，[ベクター型](https://blog.4d.com/ja/4d-ai-discover-the-power-of-4d-vectors/)が使えます。使い方はとても簡単で，埋め込みに変換したいピクチャまたはテキストをAIKitコンポーネントに渡せば，OpenAIからベクターが返されます。同じコードで，OpenAIの代わりにOllamaを使うこともできます。埋め込みが返されたら，あとは4Dでベクトル同士を比較することができます。もっとも多用される埋め込みの計算は，コサイン類似度で，セマンティック検索や画像認識に使われます。ドット積は，ベクトルの方向性だけでなく、強さも計るもので，推薦システムに使われます。ユークリッド距離は，ベクターが空間の中でどれだけ離れているかを示すもので異常検知に使われます。

R10では，[Qodly Pro](https://blog.4d.com/ja/4d-qodly-pro-whats-new-in-4d-20-r10/)にも改良が施されています。まず，4Dと同じくR9から，QodlyでもHTTP Handlerが設定できるようになりましたが，この設定画面がより直感的で使い易いものになりました。さらに，ブラウザのタブとお気に入りに表示されるページ名や，URLの各部にアクセスするための名前空間ができました。4Dのサブフォームに相当するマトリックコンポーネントのデータソースをクエリなどで更新した場合，直後にどの行を選択するのか，どこまでスクロールするのか，しないのか，というプロパティも追加されています。また，日付ピッカーコンポーネントも改良されています。検索窓コンポーネントの外観をカスタマイズできるようになり，ネットワーク接続が失われたり，回復したりしたときには画面上に通知が表示されるようになりました。

R10では，[コンポーネント依存関係マネージャーにバージョン情報を再帰的に解析する仕組み](https://blog.4d.com/ja/recursive-dependency-management-smarter-deeper-safer/)が追加されています。また，フォームオブジェクトのデータソース（変数または式）は，ポインター経由でしか設定できないという制約がなくなり，[どんなフォーミュラでもバインドできる](https://blog.4d.com/ja/building-forms-on-the-fly-with-new-data-source-commands/)ようになりました。多くのデベロッパーから要望のあった，この改良により，ORDAがさらに使いやすくなりました。[エンティティのコンストラクターが定義できる](https://blog.4d.com/ja/orda-get-started-with-the-entity-constructor/)ようになった点も見逃せません。







