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
  - rspec-rails
  - factory-bot-rails
  - faker
  - hirb-unicode

- 建立 
  - `PagesController` 及 `index.html.erb`
  - 設定首頁到 `pages#index`

by eddie@5xruby.tw
