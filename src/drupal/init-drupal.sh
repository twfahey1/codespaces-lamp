# Copy over local settings to Drupal codebase.
cp /workspaces/$(echo $RepositoryName)/.devcontainer/src/drupal/settings.local.php /workspaces/$(echo $RepositoryName)/sites/default/settings.local.php

PROJECT_NAME="/workspaces/$(echo $RepositoryName)"
# Configure Apache
sudo cat > /etc/apache2/sites-available/000-default.conf <<EOF
<VirtualHost *:8080>
  DocumentRoot $PROJECT_NAME
  <Directory $PROJECT_NAME>
    Options FollowSymLinks
    AllowOverride All
    DirectoryIndex index.php
    Require all granted
  </Directory>
  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
sudo apachectl restart