# plumOS-jz47xx
custom firmware based on opendingux  
[Click here for the English version of the explanation page](./README_EN.md)  
  
  <img src="./docs/website/images/plumOS-jz47xx.png" width="240">  
  
## ●謝辞
- オリジナルのOPENDINGUX開発チームに感謝と敬意を表します。
- オリジナルのplumOSロゴ＆スプラッシュ画像の提供者 [ Xアカウント : JLさん @JL_0w0] ありがとうございます！

## ●ダウンロード
画面右側のメニューの「Releases」からダウンロードできます。  
 
## ●特徴
- plumOS-jz47xxはOpenDingux(VERSION_ID=2023.11)がベースで作られています
    - Anbernic RG300XとRG280Vで動作します
- retroarchは最新版の「1.17.0」を採用
    - 98個のコアが利用可能
- RG300Xの特徴
    - OTGポートにてUSB-DACとBluetooth-Audioデバイスが利用可能
        - 動作確認が取れているBluetooth-Audio
            - Creative BT-W2
            - GuliKit ROUTE AIRBluetoothオーディオUSBトランスミッター
        - 注意！　ゲーム動作時にUSBデバイスを抜き差しするとハングアップする可能性がありますので、gmenu2xの画面が表示されている状態でデバイスの抜き差しをしてください
        - 全てのUSBデバイスの動作を保証するものではありません
    - OTGポートにてWifiデバイスが利用可能
        - 対応しているドライバーはrtl8192cu
        - 使い方はページ下記にある「wifi接続方法」を参照してください
    - USBネットワーク(RNDIS)が利用可能
        - 使い方はページ下記にある「USBネットワーク(RNDIS)接続方法」を参照してください
- RG280Vの特徴
    - 現時点ではUSB-DAC、Bluetooth-Audio、Wifiは利用できません
    - USBネットワーク(RNDIS)が利用可能
        - 使い方はページ下記にある「USBネットワーク(RNDIS)接続方法」を参照してください

## ●仕様
- SD1側のexFAT領域とSD2側の領域は「/media/data」ディレクトリ配下にマウントされます
    - マウントされるディレクトリ名はSDカードに名付けられた「ラベル名」になります
- CPUクロックを1200MHzにすると動作が不安定になる場合があります
- スリープ機能はありません
- ゲーム動作時にUSBデバイスを抜き差しするとハングアップする可能性がありますので、gmenu2xの画面が表示されている状態でデバイスの抜き差しをしてください

## ●既知の問題
- picoarchのメニューが表示されない
    - ゲームはプレイできますがメニューが表示されないため終了させることができません
    ホットキー「POW+Y」でOSを再起動してください
- RG350やRG280V用にビルドされたアプリケーションの一部は利用できません
    - コマンダーやgmuやffplayなど
- 全てのエミュレータの動作確認は取れていません

## ●USBネットワーク(RNDIS)接続方法
- RG300XとRG280Vに接続可能
- 最大転送速度はおよそ「3MB/s(24Mbps)」です
- データ通信が可能なUSBケーブルを使ってUSBポート(OTGポートではない方)とwindowsもしくはMacOSに接続します
    - 注意！　windowsのバージョンによってはRNDISドライバーのインストールが必要になります
- 接続情報
    - デバイス側のIPアドレスは「10.1.1.2」
    - ポート番号は「22」
    - ユーザ名は「od」
    - パスワードは入力せずに空欄にします
- SSHで接続することも可能です
    - odユーザでログイン後「sudo su -」コマンド実行して、パスワードは空欄でエンターキーを押します
- ファイルを転送したい場合はwinSCPやFileZillaなどのアプリを使ってください

## ●wifi接続方法
- 対応しているドライバーはrtl8192cu
    - jz47xxの仕様によりUSB転送速度は11Mbpsに制限されます(実行速度は5Mbps程度)
    - IEEE802.11n/g/bに対応したwifiルーターを準備してください
- RNDISでplumOSに接続して「/media/data/wlan/wlan.txt」ファイルを開きます
- SSIDとパスフレーズを入力して保存します
```
例)
# Please set the SSID and passphrase.
SSID="hogehoge-AccessPoint"
PASS="fugafuga-password"
```
- wifiデバイスを接続した後にgmenu2xの「settings」セクションにある「WlanON」を実行します
    - wifiデバイスのLEDライトが点灯すればデバイスは認識されています
    - WifiのIPアドレスは「settings」セクションの「System info」を実行して確認できます


## ●OS側ホットキー一覧
| Button Combo | Action | 
|:-----------|------------:|
| POW+Y       |        OS再起動 |
| POW+X       |        スクリーンショット(/media/data/local/home/screenshots/　ディレクトリに保存されます) |
| POW+B       |        マウスモード？(十字キーが効かなくなるので元に戻す場合は再度POW+Bを押してください) |
| POW＋ 十字キーの左右       |        画面輝度の変更 |


## ●retroarchのホットキー
| Button Combo | Action | 
|:-----------|------------:|
| POW       |        メニュー表示 |
| SELECT＋DOWN       |        retroarchの終了 |
| SELECT+R       |        ステートセーブ |
| SELECT+L     |      ステートロード |
| SELECT+R2     |      fastforward |
| SELECT+L2     |      スローモーション |

以上