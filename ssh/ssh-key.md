
# Instructions

## copy key

ssh-copy-id -i ~/.ssh/git_tomislav.pub tculo@10.88.0.113

## generate key

ssh-keygen -f ~/tculo-ecdsa -t ecdsa -b 521
ssh-keygen -f ~/.ssh/tculo-ed -t ed25519 -b 521
