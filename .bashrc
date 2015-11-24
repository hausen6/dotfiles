# bash setting
alias edbash="vim ~/.bashrc"
alias rebash="source ~/.bashrc"

# msys2 環境上だと，python などのインタラクティブ環境が上手く動作しないので，
# wrapper をかませる alias を貼る
alias python="winpty python"
alias ipython="winpty ipython"
