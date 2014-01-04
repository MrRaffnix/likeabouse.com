#!/bin/bash -e
/bin/su - angelo -c "cd /home/angelo/www/www.likeabouse.com/current && bundle exec puma -e production -b unix:/home/angelo/www/www.likeabouse.com/current/tmp/sockets/puma.sock"
