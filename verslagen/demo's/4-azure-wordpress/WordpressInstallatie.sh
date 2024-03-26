#!/bin/bash
sudo apt update
sudo apt install apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
touch /etc/apache2/sites-available/wordpress.conf
touch << EOF > /etc/apache2/sites-available/wordpress.conf
<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
EOF
sudo a2ensite wordpress
sudo a2enmod rewrite
sudo a2dissite 000-default
sudo service apache2 reload
mysql -h kvdb-wordpressdb.mysql.database.azure.com -u wordpressdb -p
sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
touch << EOF > /srv/www/wordpress/wp-config.php
<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wordpress' );
define( 'DB_PASSWORD', 'wordpresspwd' );
define( 'DB_HOST', 'kvdb-wordpressdb.mysql.database.azure.com' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('AUTH_KEY',         '6E=a`6+v<EuNIa }%M0YVQo=:}/mZvdojU@et-g?mSIU-7s*|&PM(^|ez&T@+57(');
define('SECURE_AUTH_KEY',  's(&+*m_-0Wq>*<f9+bk!Yr4}yY`u%Z@b|38^I7@Fv1@Y>fSS?[t-+U`y3Gm#d5LH');
define('LOGGED_IN_KEY',    '?Z;#wXUjB$NQ<<gk9cgi36FX|y5YQBvgRa@Q6c*17H.3GXuf4*Xq5lYgrL5Q7-iM');
define('NONCE_KEY',        '/+z-Q3xCz1Uc`j|Rx_JsDQ-]JAzLHH-o/_h-q7GA/i-m`V>=+1Ph(Vh2r.I|ce,?');
define('AUTH_SALT',        '0b!,5*i0F`RoV/.jJonCfCnmQyNBSw:PeN+=5Cqz5DAhYBNklC`s-TK2>f~FQ&5S');
define('SECURE_AUTH_SALT', 'q&|dJ_7r-ghK[Y8`xeV5J0jV@-?WqW?pO:4I4!07,J$XWYYnCg4m~u,:T<c3?Ce-');
define('LOGGED_IN_SALT',   'v$tF-EJ6b[J5+l-V@}8$MUNfA%&-X?|_}rw/tu_]5s<k)n*J/f~VzaSg69RwY|_C');
define('NONCE_SALT',       'xRv0J@j4r{e/|9ou9vGW-?rJ7!MT*S~G<.,s~+YX7H8PM1_N<ngV)?nU `J%Ydk ');
$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
define('MYSQL_CLIENT_FLAGS', MYSQLI_CLIENT_SSL);
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
EOF