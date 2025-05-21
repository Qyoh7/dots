generate the key
```ssh-keygen -t ed25519 -C "USERNAME@gmail.com"```

check if shits running
```eval "$(ssh-agent -s)"```

add key
```ssh-add ~/.ssh/id_ed25519```

add output of this command to github via settings
```cat ~/.ssh/id_ed25519.pub```

ssh into the thing and add github as known host
```ssh -T git@github.com```

add the remote repo (change origin name if no work)
```git remote add origin git@github.com:Qyoh7/dots.git```
