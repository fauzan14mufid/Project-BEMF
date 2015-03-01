<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'bemftif');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '+s8ZvS`hi<)X<~:&w0;9Lc9S+%bV&F#4XaL.`]K]:]h_)v[p*WY,4k1HE.;AFtas');
define('SECURE_AUTH_KEY',  '>P_L9)yCrJ<^=:X;BiAO!c<}+i~zqoJ]NMR~@Va<:m)_L6+zK4yQ,+kmKV;S}B,X');
define('LOGGED_IN_KEY',    '<B#WJGMXj;=_9>tG,5&h /K)!344:d!>JTFVjt]=N`}eVWrmf9Y,+yoXc!n*7G,!');
define('NONCE_KEY',        '5{XcF6?*vbzqaf!2Y,@BF^$SBgx^{?B}PnkY<CEwn,FOfrdM$nVmH&E1VK/Wm~IW');
define('AUTH_SALT',        'FjpQbRA%,FaJO]qfN1 Db<U}ofm</&AA`3R.yXh>Pg9,DL gsL{cj]>d`+m7hfD:');
define('SECURE_AUTH_SALT', 'tzfv?%wA_&u,U2ofI>`]5}rp(C~]5lb7K9cC%TmOg^IFnGI7Bi=Hz$rnFl1[~5mH');
define('LOGGED_IN_SALT',   'v(dmHL),j8ch|ac}C~W6o^C2n!JogPYf$5o@JHo16F?hrb~d!<*=^iMenBtp<> )');
define('NONCE_SALT',       'Kn&dqZkGnET$to]KH+V+KC&+jIkTAW8HZ^yIOw:yVfD&yt_G46({4X`4P_5 YMz7');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
