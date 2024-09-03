# Useful aliases

https://pastebin.com/kuSr3bCA

## My aliases for Ubuntu

alias kub='kubectl'

alias mkdir='mkdir -pv'

alias ping='ping -c 5'

alias untar='tar -zxvf '

alias update='sudo apt-get update && sudo apt-get upgrade'

alias wget='wget -c '

alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

alias mem5='ps auxf | sort -nr -k 4 | head -5'

alias cpu5='ps auxf | sort -nr -k 3 | head -5'

alias reload="source ~/.bashrc"

## My aliases for Terraform

alias tf1='echo "terraform init ..." && terraform init'

alias tf2='echo "terraform fmt & validate ..." && terraform fmt && terraform validate'

alias tf3='echo "terraform plan ..." && terraform plan'

alias tf4='echo "terraform apply --auto-approve ..." && terraform apply --auto-approve'

alias tf5='echo "terraform destroy ..." && terraform destroy'

## My aliases for Terragrunt

alias tg1='echo "terragrunt init ..." && terragrunt init'

alias tg2='echo "terragrunt hclfmt & Terragrunt hclvalidate ..." && terragrunt hclfmt && terragrunt hclvalidate'

alias tg3='echo "terragrunt plan ..." && terragrunt plan'

alias tg4='echo "terragrunt apply --auto-approve ..." && terragrunt apply --auto-approve'

alias tg5='echo "terragrunt destroy ..." && terragrunt destroy'

# My aliases for git

alias gamend='echo "git add changes to current folder, no amend commit and push force..." && git add ./ && git commit --amend --no-edit && git push -f'
