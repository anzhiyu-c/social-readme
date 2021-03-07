# social-readme

Social feeds in your repo's Readme

在你的项目readme中自动构建社交feed流

![image](https://user-images.githubusercontent.com/12383106/110250943-18ff6480-7fb9-11eb-8f27-daa027a3c3f1.png)

## 目前支持

- Atom标准文档格式，比如 [我的博客](https://zylele.github.io/) atom链接是https://zylele.github.io/atom.xml
- 豆瓣（想看、在看和看过的书和电影，想听、在听和听过的音乐）

## 更新你的项目readme

根据你的需要，在你的readme中增加以下内容

博客:
```html
<!-- START_SECTION:blog -->
<!-- END_SECTION:blog -->
```

豆瓣:
```html
<!-- START_SECTION:douban -->
<!-- END_SECTION:douban -->
```

这些是构建feed信息的识别点

## Profile Repository(`<username>/<username>`)

_如果你在Profile Repository上构建workflow_
> 那你就不需要GitHub Access Token，因为GitHub Action已经为你生成了一个

- 在你项目的根目录，新建`.github/workflows/social-readme.yml`，或者编辑其他已有的workflow文件

- 拷贝以下代码到上一步的文件中，根据你的需要，选填博客atom链接`BLOG_RSS_LINK`，豆瓣用户名`DOUBAN_NAME`（豆瓣个人主页地址可以看到douban.com/people/username/）

```yml
name: Social Readme

on:
  schedule:
    - cron: '0 0 * * *'
  workflow_dispatch:
  push:
    branches:
      - master

jobs:
  update-social:
    runs-on: ubuntu-latest
    steps:
      - uses: zylele/social-readme@master
        with:
          BLOG_RSS_LINK: your blog rss link
          DOUBAN_NAME: your douban username
```

## 其他仓库（not `<username>/<username>`）

_如果你在其他仓库构建workflow_

那你需要先获取[GitHub Access Token](https://docs.github.com/en/actions/configuring-and-managing-workflows/authenticating-with-the-github_token) 并且保存在Repo Secrets `GH_TOKEN = <Your GitHub Access Token>`

下面是运行它的示例workflow文件：

```yml
name: Social Readme

on:
  schedule:
    - cron: '0 0 * * *'
  workflow_dispatch:
  push:
    branches:
      - master

jobs:
  update-social:
    runs-on: ubuntu-latest
    steps:
      - uses: zylele/social-readme@master
        with:
          BLOG_RSS_LINK: your blog rss link
          DOUBAN_NAME: your douban username
          REPOSITORY: <username/reponame> #可选，默认将会自动使用执行workflow的存储库
```

## 可选配置

如果你想定制更多构建细节，在workflow文件中的`with`有如下可选参数

```yml
- uses: zylele/social-readme@master
  with:
    BLOG_RSS_LINK: your blog rss link
    BLOG_LIMIT: 5 # blog数量
    DOUBAN_NAME: your douban username
    DOUBAN_LIMIT: 5 # 豆瓣最新动态数量
    COMMIT_MESSAGE: Updated social rss by social-readme # commit说明
```

