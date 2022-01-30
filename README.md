# 🏗️ Demo: Product API

This is a demo product service using Ruby on Rails as an API.

## 💎 Gems

1. `ruby 3.0.3`
1. `rails 6.1.4`
1. `sqlite 1.4`
1. `rspec-rails 5.1`
1. `factory_bot_rails 6.2`
1. `faker 2.19`

## 🚧 Preparation

1. Install gems & dependencies

    `bundle install`

1. Run all pending migrations

    `rails db:migrate`

1. Seeding products & users (products owner) into database

    `rails db:seed`

1. Install MailCatcher for catch any mail in local development (optional)

    `gem install mailcatcher`

## 🚚 Execution

1. Launch the app

    `rails server`

1. Launch MailCatcher

    `mailcatcher`

    Open `http://127.0.0.1:1080` in the browser

## 🧪 Test

1. Launch the test

    `rspec`

1. Open `converage/index.html` in the browser

    **macOS**<br>
    `open coverate/index.html`

    **linux**<br>
    `xdg-open coverage/index.html`

## 📑 Documentation

Postman Documentation: [demo_product_api](https://documenter.getpostman.com/view/8596816/UVeCRTx8)
