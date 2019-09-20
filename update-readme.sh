#!/bin/bash

# 不显示 PNG、GIF、WEBP、PDF 格式的文件，最大深度为 3 层
#tree -I "*.png|*.gif|*.webp" -v -L 3 --ignore-case | awk 'BEGIN{print "```bash"} {print} END{print "```"}' > README.md

# 这种方式只能正确显示根目录的连接
# 子目录的连接，因为连接中不包含父目录，所以会造成连接的 404
#tree -I "*.png|*.gif|*.webp|*.pdf" -v --ignore-case | sed "/md/s|─\ \(.*\)|[\1](https://github.com/opsxin/markdown-notes/blob/master/\1)|" | sed "s/$/\ \ /" > README.md

# 这种方式不能树形显示
find .  -type f -name "*.md" | sed "s|.|https://github.com/opsxin/markdown-notes/blob/master|" | sed "s|.*/\(.*\)|[\1](\0)|" | sed "s/$/\ \ /" > README.md
