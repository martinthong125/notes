# Useful aliases

https://pastebin.com/kuSr3bCA

## My aliases for zsh

alias k='kubectl'

alias mkdir='mkdir -pv'

alias ping='ping -c 5'

alias untar='tar -zxvf '

alias update='sudo apt-get update && sudo apt-get upgrade'

alias wget='wget -c '

alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

alias cpu5='ps aux | sort -nrk 3 | head -5'

<!-- alias mem5='ps aux | sort -nrk 4 | head -5' -->

mem5() {
ps auxf | sort -nr -k 4 | head -5
}

alias reload='echo "source zshrc and zprofile" && source ~/.zshrc && source ~/.zprofile'

# My aliases for git

alias gamend='echo "git add changes to current folder, no amend commit and push force..." && git add ./ && git commit --amend --no-edit && git push -f'

## My aliases for Terraform

alias tf1='echo "terraform init ..." && terraform init'

alias tf2='echo "terraform fmt & validate ..." && terraform fmt && terraform validate'

alias tf3='echo "terraform plan ..." && terraform plan'

alias tf4='echo "terraform apply ..." && terraform apply'

alias tf4a='echo "terraform apply --auto-approve ..." && terraform apply --auto-approve'

alias tf5='echo "terraform destroy ..." && terraform destroy'

## My aliases for Terragrunt

alias tg1='echo "terragrunt init ..." && terragrunt init'

alias tg2='echo "terragrunt hclfmt & Terragrunt hclvalidate ..." && terragrunt hclfmt && terragrunt hclvalidate'

alias tg3='echo "terragrunt plan ..." && terragrunt plan'

alias tg4='echo "terragrunt apply ..." && terragrunt apply'

alias tg4a='echo "terragrunt apply --auto-approve ..." && terragrunt apply --auto-approve'

alias tg5='echo "terragrunt destroy ..." && terragrunt destroy'
