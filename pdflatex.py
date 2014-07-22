# -*- coding: sjis -*-
import os
import sys
import subprocess
import shutil
from glob import glob

def main():
    if len(sys.argv) != 2:
        print('invalid argument!!!')
        return
    absname = os.path.abspath(sys.argv[1])
    base = os.path.basename(absname)
    filename, ext = os.path.splitext(base)
    cmds = []
    cmds.append('platex')
    cmds.append('-synctex=1')
    cmds.append('-jobname={0}'.format(filename))
    cmds.append('-kanji=utf8')
    cmds.append('-guess-input-enc')
    cmds.append('{0}'.format(absname))
    cmd = ' '.join(cmds)
    code = subprocess.call(cmd)     # 実行及びエラーコード受け取り
    if code != 0:
        exit('Error! platex!')

    cmds = []
    cmds.append('dvips')
    cmds.append('{0}.dvi'.format(absname.replace(ext, '')))
    cmd = ' '.join(cmds)
    code = subprocess.call(cmd)     # 実行及びエラーコード受け取り
    if code != 0:
        exit('Error! dvips!')

    cmds = []
    cmds.append('ps2pdf')
    cmds.append('{0}.ps'.format(absname.replace(ext, '')))
    cmd = ' '.join(cmds)
    code = subprocess.call(cmd)     # 実行及びエラーコード受け取り
    if code != 0:
        exit('Error! ps2pdf!')

if __name__ == '__main__':
    main()
