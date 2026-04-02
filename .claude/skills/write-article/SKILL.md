# Skill: write-article — 3言語記事執筆

## 概要
リサーチエージェントが出力したJSONをもとに、英語・タガログ語・ベトナム語の3言語でHTML記事を作成し、各言語の `index.html` にカードリンクを追加する。
3言語は**同時並行**で作業する。

---

## 各言語ライターの担当

| エージェント | フォルダ | `lang` 属性 | nav「ホーム」文言 |
|---|---|---|---|
| 英語ライター | `en/` | `en` | Home / Topics / Articles |
| タガログ語ライター | `tl/` | `tl` | Home / Mga Paksa / Mga Artikulo |
| ベトナム語ライター | `vi/` | `vi` | Trang chủ / Chủ đề / Bài viết |

---

## 記事HTMLテンプレート

```html
<!DOCTYPE html>
<html lang="{en|tl|vi}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="{150〜160文字の説明文}">
  <title>{記事タイトル} | Dating in Japan Guide</title>
  <link rel="stylesheet" href="../style.css">
  <link rel="icon" href="../favicon.svg" type="image/svg+xml">
</head>
<body>

<header>
  <div class="header-inner">
    <div class="site-logo"><a href="../{lang}/index.html" style="color:#fff;text-decoration:none;">Dating in Japan <span>Guide</span></a></div>
    <nav>
      <ul>
        <li><a href="../{lang}/index.html">{Home}</a></li>
        <li><a href="../{lang}/index.html#topics">{Topics}</a></li>
        <li><a href="../{lang}/index.html#articles">{Articles}</a></li>
        <li><a href="../index.html">🌐 {Language}</a></li>
      </ul>
    </nav>
  </div>
</header>

<div class="article-header">
  <div class="container">
    <span class="badge">{バッジカテゴリ}</span>
    <h1>{記事タイトル}</h1>
    <p class="article-meta">Last updated: {月 年} &nbsp;|&nbsp; {X} min read</p>
  </div>
</div>

<!-- ===== ARTICLE BODY ===== -->
<article class="article-body">

  <p>{冒頭段落 — 読者が共感できる状況から始める}</p>

  <h2>1. {セクションタイトル}</h2>
  <p>{本文}</p>

  <div class="tip-box">
    <strong>Tip</strong>
    {実践的なアドバイス}
  </div>

  <div class="warning-box">
    <strong>Warning</strong>
    {避けるべき行動・誤解}
  </div>

  <table class="key-table">
    <thead>
      <tr><th>カラムA</th><th>カラムB</th></tr>
    </thead>
    <tbody>
      <tr><td>...</td><td>...</td></tr>
    </tbody>
  </table>

  <h2>{番号}. まとめ</h2>
  <p>{締めの段落 — 読者を励ます内容}</p>

</article>

<footer>
  <div class="container">
    <p>&copy; 2026 Dating in Japan Guide. For informational purposes only.</p>
  </div>
</footer>

</body>
</html>
```

---

## index.htmlへのカード追加

各言語の `{lang}/index.html` を読み、`#articles` セクションの `card-grid` に以下のカードを追加する。
**英語は最新カードをcard-gridの先頭、タガログ語・ベトナム語も同様に先頭**に挿入する。

```html
<div class="card">
  <div class="card-body">
    <span class="card-badge">{バッジカテゴリ}</span>
    <h3><a href="{slug}.html">{記事タイトル}</a></h3>
    <p>{記事の1〜2文説明}</p>
    <a href="{slug}.html" class="card-link">{Read Article →（言語別）}</a>
  </div>
</div>
```

| 言語 | カードリンク文言 |
|---|---|
| 英語 | Read Article → |
| タガログ語 | Basahin ang Artikulo → |
| ベトナム語 | Đọc bài viết → |

---

## ライティングガイドライン

- **分量:** 英語1200〜2000語、タガログ語・ベトナム語は同等の内容量
- **H2セクション:** 5〜8個、番号付き（1. / 2. / ...）
- **必須コンポーネント:** `tip-box` / `warning-box` / `key-table` 各1個以上
- **日本語用語:** 初出時は必ず日本語＋ローマ字を付ける（例: 告白 / kokuhaku）
- **トーン:** 誠実・実用的・共感的。ステレオタイプや objectifying な表現を避ける
- **style.css:** 必ず `../style.css` で参照する

---

## バッジカテゴリ一覧
`Culture` / `First Dates` / `Communication` / `Relationships` / `Etiquette` / `Where to Meet` / `Language` / `Tips & Warnings`
