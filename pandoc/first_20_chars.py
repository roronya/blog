import panflute as pf

def extract_first_20_chars(doc):
    # 全てのPara要素を取得して最初の20文字を抽出
    text = ''.join(pf.stringify(block) for block in doc.blocks)
    first_20_chars = text[:20]
    # メタデータに追加
    doc.metadata['first_20_chars'] = first_20_chars

def main(doc=None):
    return pf.run_filter(extract_first_20_chars, doc=doc)

if __name__ == "__main__":
    main()

