import easyocr
import glob
reader=easyocr.Reader(['ko','en'],gpu=False)
pngs=glob.glob("frames/*.png")
text=reader.readtext_batched(pngs,detail=0)
res=[]
[res.append(x) for x in text if x not in res]
with open ('ocr.txt','w') as f:
    for line in res:    
         f.write(" ".join(line) + "\n")