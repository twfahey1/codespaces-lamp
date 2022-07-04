# Copy over wordpress settings
cp /workspaces/$(echo $RepositoryName)/.devcontainer/src/wordpress/wp-config-local.php /workspaces/$(echo $RepositoryName)/wp-config-local.php

# Copy over .htaccess
cp /workspaces/$(echo $RepositoryName)/.devcontainer/src/wordpress/.htaccess /workspaces/$(echo $RepositoryName)/.htaccess

# Configure Apache
PROJECT_NAME="/workspaces/$(echo $RepositoryName)"
sudo cat > /etc/apache2/sites-available/000-default.conf <<EOF
<VirtualHost *:8080>
  DocumentRoot $PROJECT_NAME
  <Directory $PROJECT_NAME>
    Options FollowSymLinks
    AllowOverride All
    DirectoryIndex index.php
    Require all granted
  </Directory>
  <Directory $PROJECT_NAME/wp-content>
      Options FollowSymLinks
      Require all granted
  </Directory>
  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
sudo apachectl restart