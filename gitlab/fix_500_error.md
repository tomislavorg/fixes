# First, access the database console

gitlab-rails dbconsole

## In the database console, clean the application settings

DELETE FROM application_settings;
\q

## Now restart GitLab

gitlab-ctl restart

## Then set a new root password

gitlab-rails console -e production

## In the Rails console

user = User.find_by(username: 'root')
user.password = ''
user.password_confirmation = ''
user.save!
quit

# Restart Gitlab

<https://www.turnkeylinux.org/forum/support/sat-20240504-1704/error-500-cannot-login-gitlab-18>
