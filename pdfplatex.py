# -*- coding: sjis -*-
import os
import sys
import logging
from logging import getLogger, StreamHandler, Formatter, DEBUG
import codecs
from glob import glob
from subprocess import call


class MyArgsErrors(Exception):
    def __init__(self, ):
        pass


class MyCodecs():
    codecstypes = ('utf_8', 'euc_jp', 'euc_jis_2004', 'euc_jisx0213',
            'shift_jis', 'shift_jis_2004','shift_jisx0213',
            'iso2022jp', 'iso2022_jp_1', 'iso2022_jp_2', 'iso2022_jp_3',
            'iso2022_jp_ext','latin_1', 'ascii')
    def __init__(self, _file, ):
        self.logger = getLogger(self.__class__.__name__)
        self.log_handler = StreamHandler()
        self.log_handler.formatter = Formatter('%(levelname)s : %(name)s.%(funcName)s() : %(message)s')
        self.logger.addHandler(self.log_handler)
        self.__file = _file

    def check_codecs(self, ):
        """
        fileの文字コードを調べるメソッド
        """
        for codec in self.codecstypes:
            try:
                f = open(self.__file, 'r').read().decode(codec)
                self.logger.debug('Encoding is \"{0}\"'.format(codec))
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


class PDFPLaTEX:
    def __init__(self, *argv):
        """
        コンストラクタ
        """
        self.logger = getLogger(self.__class__.__name__)
        self.log_handler = StreamHandler()
        self.log_handler.setFormatter()
        self.args = argv
        self.mainfile = ''

    def check_args(self, ):
        """
        引数をチェックするメソッド
        """
        if len(self.args) != 1:
            raise MyArgsErrors, 'Number of arguments is 1 ! ({0} given)'.format(len(self.args))
        else:
            self.mainfile = self.args

    def check_Bibtex(self, ):
        """
        BiBTeXを使っているかチェックするメソッド
        """
        __main = open(self.mainfile, 'r')


def main():
    mainfile = sys.argv[1]
    logging.basicConfig(level=DEBUG)
    c = MyCodecs(mainfile)
    c.enc('u8')
    exit(0)
    p = PDFPLaTEX(logging.DEBUG, mainfile)
    p.check_args()
    p.check_Bibtex()

if __name__ == '__main__':
    main()
