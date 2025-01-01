top:
	pandoc --template templates/top.html entries.html -o docs/index.html

# usage: make article slug=202501011525
# slugに指定した記事のhtmlを作り直す。templateのhtmlに変更が入ったときに使う。
article:
	pandoc --template=templates/article.html --filter=pandoc/filter.py markdown/${slug}.md -o docs/${slug}.html

# usage: make articles
# markdown配下のすべての記事を作り直す。
articles:
	ls -1 markdown | xargs -I {} basename {} .md | xargs -I {} make article slug={}
