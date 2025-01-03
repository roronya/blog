top:
	pandoc --template templates/top.html entries.md -o docs/index.html

# usage: make article slug=202501011525
# slugに指定した記事のhtmlを作り直す。templateのhtmlに変更が入ったときに使う。
article:
	pandoc --template=templates/article.html --filter=pandoc/filter.py markdown/${slug}.md -o docs/${slug}.html

# usage: make articles
# markdown配下のすべての記事を作り直す。
articles:
	ls -1 markdown | xargs -I {} basename {} .md | xargs -I {} make article slug={}

# 変換タスク
entries:
	@echo "---" > "entries.md"
	@echo "entries:" >> "entries.md"
	@for file in markdown/*.md; do \
	  slug=$$(awk -F': ' '/^slug:/ {print $$2}' $$file); \
	  title=$$(awk '/^# / {sub("^# ", ""); print; exit}' $$file | sed 's/"/\\"/g'); \
	  year=$$(echo $$slug | cut -c1-4); \
	  month=$$(echo $$slug | cut -c5-6); \
	  day=$$(echo $$slug | cut -c7-8); \
	  createdAt="$$year-$$month-$$day"; \
	  echo "  - {createdAt: \"$$createdAt\", path: \"./$$slug.html\", title: \"$$title\"}" >> "entries.md"; \
	done
	@echo "---" >> "entries.md"
