# Rails Application Templates

## 新增專案可省略選項

- `--skip-test-unit` 
- `--skip-sprockets`
- `--skip-turbolinks`
- `--skip-action-cable`
- `--skip-active-storage`
- `--skip-action-text`
- `--skip-action-mailbox`
- `--skip-action-mailer`

範例：

    $ rails new my_project -m TEMPLATE_PATH --skip-turbolinks --skip-active-storage

### `basic` 基本版 

- 連結 <https://raw.githubusercontent.com/kaochenlong/rails-template/master/basic.rb>
- 安裝 gem 
  - [rspec-rails](https://github.com/rspec/rspec-rails)
  - [factory-bot-rails](https://github.com/thoughtbot/factory_bot_rails)
  - [faker](https://github.com/faker-ruby/faker)
  - [hirb-unicode](https://rubygems.org/gems/hirb-unicode)
  - [foreman](https://github.com/ddollar/foreman)

- 建立 
  - `PagesController` 及 `index.html.erb`
  - 設定首頁到 `pages#index`

### `tailwind` 版 

- 連結 <https://raw.githubusercontent.com/kaochenlong/rails-template/master/tailwind.rb>
- 安裝 Gem
  - 同 `basic` 基本版
- 安裝 [Tailwind CSS](https://tailwindcss.com)
- 安裝 [Purgecss](https://www.purgecss.com/) 移除不必要的 CSS 定義
- 把 `app/javascript` 目錄換成 `app/frontend`

by eddie@5xruby.tw

