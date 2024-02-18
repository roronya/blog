import panflute as pf

def extract_description(doc):
    text = ''.join(pf.stringify(block) for block in doc.content)
    description = text[:40]
    # メタデータに追加
    doc.metadata['description'] = pf.MetaString(description)

def main(doc=None):
    doc = pf.load(input_stream=None)
    extract_description(doc)
    pf.dump(doc)

if __name__ == "__main__":
    main()

