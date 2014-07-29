# -*- coding: sjis -*-
import os
import sys
import logging
from logging import getLogger, StreamHandler, Formatter, DEBUG
import codecs
import re
from glob import glob
import subprocess


class MyArgsErrors(Exception):
        pass


class MyCodecs():
    codecstypes = ('utf_8', 'euc_jp', 'euc_jis_2004', 'euc_jisx0213',
            'shift_jis', 'shift_jis_2004','shift_jisx0213',
            'iso2022jp', 'iso2022_jp_1', 'iso2022_jp_2', 'iso2022_jp_3',
            'iso2022_jp_ext','latin_1', 'ascii')
    def __init__(self, _file, ):
        self.logger = getLogger(self.__class__.__name__)
        self.__file = _file
        self.file_encode = ''

    def check_codecs(self, ):
        """
        fileの文字コードを調べるメソッド
        """
        for codec in self.codecstypes:
            try:
                f = open(self.__file, 'r').read().decode(codec)
                self.logger.debug('Encoding is \"{0}\"'.format(codec))
                self.file_encode = codec
                return codec
            except:
                pass

    def enc(self, toEnc):
        """
        fileのエンコーディングを変換するメソッド
        """
        dec = self.check_codecs()
        lines = []
        for line in codecs.open(self.__file, 'r', dec):
            lines.append(line)
        with codecs.open(self.__file, 'w', toEnc) as f:
            f.write(''.join(lines))


class LatexCompile:
    def __init__(self, _args):
        """
        コンストラクタ
        """
        self.logger = getLogger(self.__class__.__name__)
        self.args = _args
        self.mainfile = ''
        self.bibFrag = False

    def check_args(self, ):
        """
        引数をチェックするメソッド
        """
        if len(self.args) != 2:
            raise MyArgsErrors, 'Number of arguments is 1 ! ({0} given)'.format(len(self.args))
        else:
            self.logger.debug(type(self.args))
            if not (isinstance(self.args, list) or isinstance(self.args, tuple)):
                raise MyArgsErrors, 'Give \'list\' or \'tupple\' argument (\'{0}\' given)'.format(type(self.args))
            self.mainfile = self.args[1]

    def check_Bibtex(self, ):
        """
        BiBTeXを使っているかチェックするメソッド
        """
        self.logger.debug(self.mainfile)
        myc = MyCodecs(self.mainfile)
        myc.check_codecs()
        __main = codecs.open(self.mainfile, 'r', myc.file_encode)
        bibre = re.compile(r'^\\bibliography')
        for line in __main:
            check = bibre.search(line)
            if check:
                self.logger.debug(line)
                self.bibFrag = True
                return

    def pdflatex(self, ):
        """ Tex のメイン・ソースをコンパイルするメソッド """
        jobname, extra = os.path.splitext(self.mainfile)
        self.logger.debug(jobname)
        cmds = []
        cmds.append('pdflatex')
        cmds.append('-synctex=1')
        cmds.append('-jobname={0}'.format(jobname))
        cmds.append('-kanji=utf8')
        cmds.append('-guess-input-enc')
        cmds.append('{0}'.format(self.mainfile))
        cmd = ' '.join(cmds)
        self.logger.debug(cmd)
        return subprocess.call(cmd)

    def bibtex(self, ):
        """ bibtex コンパイルメソッド """
        jobname, extra = os.path.splitext(self.mainfile)
        cmds = []
        cmds.append('jbibtex')
        cmds.append('{0}.aux'.format(jobname))
        cmd = ' '.join(cmds)
        return subprocess.call(cmd)

    def makePDF(self, ):
        """ pdf を作るメソッド """
        jobname, extra = os.path.splitext(self.mainfile)
        cmds = []
        cmds.append('dvips')
        cmds.append('{0}.dvi'.format(jobname))
        cmd = ' '.join(cmds)
        subprocess.call(cmd)
        cmds = []
        cmds.append('ps2pdf')
        cmds.append('{0}.ps'.format(jobname))
        cmd = ' '.join(cmds)

    def compile(self, ):
        """ 全てコンパイルするメソッド """
        self.check_args()
        if self.pdflatex():
            if self.check_Bibtex():
                if self.bibtex():
                    self.pdflatex()
                    self.pdflatex()
            self.makePDF()


def main():
    l = LatexCompile(sys.argv)
    l.compile()


if __name__ == '__main__':
    logging.basicConfig(level=DEBUG)
    main()
