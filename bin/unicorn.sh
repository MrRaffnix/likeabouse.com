#!/bin/bash
export HOME=/home/angelo
export PATH=${HOME}/.rbenv/bin:${PATH}
export APP_PATH=${HOME}/www/www.likeabouse.com/current
eval "$(rbenv init -)"

main(){
  case $1 in
    start)
      cd ${APP_PATH} && RAILS_ENV=production bundle exec unicorn -c config/unicorn.conf
    ;;
    stop)
      cd ${APP_PATH} && kill -9 $(cat tmp/pids/unicorn.pid)
    ;;
  esac

}
main "$@"
