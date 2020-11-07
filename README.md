# Railsアプリのデフォルト設定からの変更

- config/environments/development.rbにおける`config.file_watcher`の値を変更

macOSにおいてDocker Composeを使った開発において、デフォルト値ではファイルの変更をうまく検出されないため、ここの値を`ActiveSupport::FileUpdateChecker`に変更。
