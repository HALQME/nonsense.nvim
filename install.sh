# bin/bash
repo_dir="$(cd .. && pwd)/nonsense.nvim"
if [ -d ${HOME}/.config/nvim ]; then
  # rename and backup
  mv ${HOME}/.config/nvim ${HOME}/.config/nvim.bak
else
  echo "${HOME}/.config/nvim ディレクトリが存在しません。"
fi

# make symbolic link
  ln -s "$repo_dir/nvim" ${HOME}/.config/nvim
