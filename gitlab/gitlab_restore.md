# Gitlab restore

<!-- scp /mnt/c/temp/gitlab_all_repos.tar.gz  root@10.88.0.230:/tmp/

mkdir -p /tmp/gitlab_repos

cd /tmp/gitlab_repos

tar -xzf /tmp/gitlab_all_repos.tar.gz

ls -la
mkdir -p /var/opt/gitlab/git-data/repositories/@hashed/

cp -r @hashed/* /var/opt/gitlab/git-data/repositories/@hashed/

chown -R git:git /var/opt/gitlab/git-data/repositories/@hashed/

gitlab-ctl restart -->

<!-- ## OLD 

 gitlab-backup create

 scp /var/opt/gitlab/backups/1733480257_2024_12_06_13.11.4_gitlab_backup.tar root@10.88.0.230:/var/opt/gitlab/backups/
 scp /etc/gitlab/gitlab.rb root@10.88.0.230:/etc/gitlab/
 scp /etc/gitlab/gitlab-secrets.json root@10.88.0.230:/etc/gitlab/

## New must be same version

 gitlab-ctl reconfigure

chown git:git /var/opt/gitlab/backups/1733480257_2024_12_06_13.11.4_gitlab_backup.tar
chmod 600 /var/opt/gitlab/backups/1733480257_2024_12_06_13.11.4_gitlab_backup.tar
gitlab-backup restore BACKUP=1733480257_2024_12_06_13.11.4

chown -R git:git /var/opt/gitlab/git-data/repositories/
chown root:root /etc/gitlab/gitlab.rb /etc/gitlab/gitlab-secrets.json
chmod 600 /etc/gitlab/gitlab.rb /etc/gitlab/gitlab-secrets.json

gitlab-ctl reconfigure

gitlab-ctl restart -->

Gitlab export Project <https://docs.gitlab.com/ee/user/project/import/>
