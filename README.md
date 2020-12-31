# ppa

```bash
curl -s --compressed "https://tada-team.github.io/ppa/dist/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/my_list_file.list "https://tada-team.github.io/ppa/dist/my_list_file.list"
sudo apt update
```
