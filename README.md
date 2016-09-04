# Rscrap

Ruby Web Scraper [Telegram](https://telegram.org/) Bot.

# Setup

First, you need to obtain a Telegram Bot token, by following this guide: [Telegram Bot How-To](https://core.telegram.org/bots).

After that, obtain your personal Telegram ID. Put both of these into their respective environment variables:

```bash
export RSCRAP_TOKEN=xxxxxxxx:ASDFffwf34444
export RSCRAP_USER_ID=111111111
```

Than run `bundle install` in the ruby folder to install all the gems. Once that's finished, setup the db with `bundle exec ruby init_db.rb`.

# Creating a Cron Job for running

Create a crontab if you don't have any:
```bash
crontab -e
```

And add this line:

```bash
0,45 * * * * cd /home/<user>/rubyproj/rscrap; /home/<user>/.rvm/gems/ruby-2.3.1@main_gems/wrappers/bundle exec ruby -C /home/<user>/rubyproj/rscrap/ scripts/reddit.rb
```

For reddit, I'd recommend a 45 minute refresh rate based on how many subreddits you are following. You don't want to spam yourself too much. And the bot does handle bulk updates.

# Example

After the scrip runs you should see something like this from your bot:

![rscrap1](rscrap1.png)
![rscrap2](rscrap2.png)


# Contribute

Contributions, issues, and PRs are very welcomed.
