# UIPageViewController

## 概要
PageViewControllerは、画面遷移に使われるコントローラーです。フリックにより画面間を移動することができます。

## 関連クラス
UIViewController

## 主要定数
| 定数名 | 説明 | 取りうる値 |
|:-----------:|:------------|:------------|
| UIPageViewControllerNavigationOrientation | トランジションの向き | .Horizontal or .Vertical | 
| UIPageViewControllerTransitionStyle | トランジションのスタイル | .Scroll or .PageCurl | 

## 主要プロパティ
| プロパティ名 | 説明 | サンプル |
|:-----------:|:------------|:------------|
| navigationOrientation | トランジションの向きを取得する | pageViewControler.navigationOrientation |
| transitionStyle | トランジションのスタイルを取得する | pageViewControler.transitionStyle |
| dataSource | dataSourceを指定する<br> UIPageViewControllerDataSource | pageViewController.dataSource = self |
| delegate | delegateを指定する <br>UIPageViewControllerDelegate | pageViewController.delegate = self |
| viewControllers | ページビューコントローラーが管理しているViewControllerを取得する | - |

## 主要メソッド
| メソッド名 | 説明 | サンプル |
|:-----------:|:------------|:------------|
| setViewControllers | 表示するViewControllerを設定する | pageViewController.setViewControllers([currentViewController],direction: .Forward, animated: false, completion: nil) |

### UIPageViewControllerDataSourceのメソッド
| メソッド名 | 説明 | 必須 |
|:-----------:|:------------|:------------|
| viewControllerAfterViewController | 順方向にスワイプしたときのViewControllerを返す | ○ |
| viewControllerBeforeViewController | 逆方向にスワイプしたときのViewControllerを返す | ○ |

### UIPageViewControllerDelegateのメソッド
| メソッド名 | 説明 | 必須 |
|:-----------:|:------------|:------------|
| didFinishAnimating  | 画面遷移ジェスチャーが完了したときに呼ばれる | - |

## フレームワーク
UIKit.framework

## 開発環境
| Category | Version |
|:-----------:|:------------:|
| Swift | 3.0.2 |
| Xcode | 8.2.1 |
| iOS | 10.0~ |

## 参考
https://developer.apple.com/reference/uikit/uipageviewcontroller
