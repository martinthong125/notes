# Setting up ssh config file to use multiple ssh keys for different github accounts

1. Generate ssh keys

   ```
   ssh-keygen -t ed25519 -C "martinthong125@gmail.com"
   ```

1. Enter the filename: \<local-machine-name\>-\<remote-machine-name\>

1. Setup the 2 accounts in .ssh/config

   \# Account A

   Host github.com

   HostName github.com

   User git

   IdentityFile ~/.ssh/local-accountA

   IdentitiesOnly yes

   \# Account B

   Host github.com-accountB

   HostName github.com

   User git

   IdentityFile ~/.ssh/local-accountB

   IdentitiesOnly yes

1. Setup the remote links in each repo

   git remote add origin git@github.com:accountA/accountA-repo.git

   git remote add origin git@github.com-accountB:accountB/accountB-repo.git
