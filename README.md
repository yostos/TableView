TableView
=========

StoryBoardを使った場合のTableViewの設定がわからなかったので、作ってみました。

いくつか方法があるようですが、XCodeが作ってくれるテンプレートベースで一番うまくいったやり方です。

## データ用にクラスを用意する

必須ではありませんが、今回は曲のデータとして曲名と曲の長さを持つようなクラスをTableViewに表示したいと思います。

```swift:Song.swift
class Song: NSObject {
    var title : String = "A Song"
    var duration : NSTimeInterval = 0.0
   
}

extension Song {
    
    func durationString() -> String {
        return NSString(format:"%i:%02i",Int(self.duration) / 60, Int(self.duration) % 60)
    }
}
```

## TableViewを作る
StoryBoard上にTableViewをおきます。
![2014-12-14_14-39-10.png](https://qiita-image-store.s3.amazonaws.com/0/43255/98a3e758-8ea1-7d8b-0091-84446c7130fe.png)

以下の手順で設定します。

1. １列目の名前をTitle、２列目のタイトルをDurationにします。
2. Identity Inspectorで、１列目のIdentifierをTitle、２列目のIdentifierをDurationに設定します。いくつかのコンポーネントから構成されていますから、Outlineで間違えないように選んでください。
3. OutlineでTable Viewを選択して、Attribute Inspectorを開いて、Content ModeをCell Basedにします。
4. TableViewを選択したまま、Connections Inspectorを開いて dataSourceとdelegateとViewControllerを接続します。
4. StoryBoard上のTable Viewをコードエディタ上のViewControllerにドラッグして、NSTableViewのOutletを作成します。

## TableView用の実装コード
NSTableViewのために２つのメソッドをViewController上に実装する必要があります。

```swift:ViewController.swift
    var songs : [Song] = []
    func numberOfRowsInTableView(aTableView: NSTableView) -> Int
    {
        return songs.count
    }
```
numberOfRowsInTableView()では、songsにSongクラスの配列が格納されている前提でその数を返しています。

```swift:ViewController.swift
   func tableView(aTableView: NSTableView,
        objectValueForTableColumn aTableColumn: NSTableColumn?,
        row rowIndex: Int) -> AnyObject?
    {
        let titleOfSong = songs[rowIndex].title as NSString
        let durationOfSong = songs[rowIndex].durationString()
        let columnName = aTableColumn?.identifier
        
        if columnName == "Title" {
            return titleOfSong
        }
        else if columnName == "Duration" {
            return durationOfSong
        }
        return ""              
    }
```
まず、各行と対応する配列内のSongオブジェクトを取り出しています。
次に渡ってきたTableColumn.identifierを元にどの列をデータが求められているか判断し、曲名と曲の時間を返すようにしています。

```swift:ViewController.swift
   func tableViewSelectionDidChange(aNotification: NSNotification)
    {
        let row = tableView.selectedRow
        if row >= 0
        {
            let selected = songs[row].title as String
            NSLog("Selected: \(selected)")
        }
    }
```
どうせならTableView上のカーソルの位置に従って曲を選択したアクションをしたいので、tablViewSelectionDidChange()を実装しました。コード例ではログに書き出しているだけですが。

[GitHub : yostos/TableView](https://github.com/yostos/TableView)

