sudo mysql -u root<<EOFMYSQL
    CREATE USER 'user'@'localhost' IDENTIFIED BY '1234'; 
    GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost' WITH GRANT OPTION;
    CREATE DATABASE IF NOT EXISTS drupal;
EOFMYSQL
