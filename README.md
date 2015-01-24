### About

This is a simple shell script that automatically installs latest version of PhpMyAdmin
on a Laravel Homestead box.

### Usage

1. SSH into your Homestead box and `cd` to your code/projects directory

2. `curl -sS https://raw.githubusercontent.com/grrnikos/pma/master/pma.sh | sh`

3. Open the `/etc/hosts` file on your host machine and add
```127.0.0.1 phpmyadmin.app```

4. Go to [http://phpmyadmin.app:8000](http://phpmyadmin.app:8000)