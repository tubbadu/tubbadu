# .zshrc and .bashrc

create a symlink in the home directory:
```sh
ln -s "$(pwd)/bashrc" "/home/$(whoami)/.bashrc"
ln -s "$(pwd)/zshrc" "/home/$(whoami)/.zshrc"

ln -s "$(pwd)/aliases" "/home/$(whoami)/.aliases"
ln -s "$(pwd)/path" "/home/$(whoami)/.path"
```
copy in the `/root/` directory the root ones, renaming them `.zshrc` and `.bashrc`:
```sh
sudo cp bashrc_root /root/.bashrc
sudo cp zshrc_root /root/.zshrc
```
