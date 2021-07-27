# PHP Application (app1_php)

This is repo for PHP application, created for [Andersen DevOps Course May-July`2021 exam](https://github.com/mariohs22/andersen-devops-course/tree/main/exam).

## Description

This is simple `Hello world` dockerized PHP application. On every push or pull request on main branch of this repo GitHub runs action script to perform:

- Static analysis of php files (by PHPStan);
- Unit tests (by PHPUnit)
- Build docker container and deploy it to [Heroku](https://heroku.com).

**Final result** (if CI/CD job is success) is available on [https://mario-app12355.herokuapp.com/](https://mario-app12355.herokuapp.com/).

You will receive a telegram message if CI/CD job has succeeded or failed.

### Secret management

CI/CD job uses GitHub secrets, which you can setting up on `Settings / Secrets` section:

`HEROKU_APP_NAME` - App name, which you can set up in Heroku dashboard (currently `mario-app12355`)
`HEROKU_API_KEY` - API key for app (provided by Heroku)
`TELEGRAM_TOKEN` - Telegram Bot token. To use notifications you need to create a Telegram bot by talking to [@BotFather](https://t.me/botfather) bot. See official guide here: [https://core.telegram.org/bots#6-botfather](https://core.telegram.org/bots#6-botfather).
`TELEGRAM_TO` - Your telegram channel (`@channelname`) or user id. You can find your user id, for example by talking to [@jsondumpbot](https://t.me/jsondumpbot)

### LOGS

You can see logs of every CI/CD job in Actions section of GitHub current repo. Also Heroku logs available via command:

`heloku log -a mario-app12355 --tail`

#### Repository structure

- 📁.github/workflow:
  `workflow.yml` - GitHub action CI/CD job file
- 📁app
  `ClassExample.php` - example file for Greeter class
  `Greeter.php` - example of PHP class Greeter
  `index.html` - HTML template
  `info.php` - shows `phpinfo()`
- 📁test
  `GreeterTest.php` - test file for Greeter class
  `phpunit.xml` - PHPUnit test settings
- `composer.json` - Composer PHP file
- `Dockerfile` - Dockerfile for create docker container
- `run-apache2.sh` - Bash script used by Dockerfile for Heroku deploy
