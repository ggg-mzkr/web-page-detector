# web-page-detector
レスポンスを返すURLを受け取り、そのページのURL、タイトル、Encodingを取得します。
```
-> % ./webpage-detector https://satori.marketing https://google.co.jp
url: https://satori.marketing
encoding: UTF-8
title: マーケティングオートメーションツール SATORI

url: https://google.co.jp
encoding: utf-8
title: 301 Moved
```

# Dependency
- ruby2.5.1

# Setup
以下を参照。

https://www.ruby-lang.org/ja/documentation/installation/

# Usage
コマンドライン引数でURLを渡してください。スペース区切りで複数のURLを渡すことが可能です。

UTF-8、EUC-JP、Shift-JIS以外の文字コードは「判別対象外」と表示されます。また、URLに接続できなかった場合は「接続に失敗」と表示されます。
```
./webpage-detector https://satori.marketing https://google.co.jp http://foobar.jp/
url: https://satori.marketing
encoding: UTF-8
title: マーケティングオートメーションツール SATORI

url: https://google.co.jp
encoding: utf-8
title: 301 Moved

url: http://foobar.jp/
接続に失敗
```



# Licence
This software is released under the MIT License, see LICENSE.

# Authors
堀内哲煕

# References
- https://docs.ruby-lang.org/ja/latest/library/net=2fhttp.html