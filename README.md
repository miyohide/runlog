# Railsアプリのデフォルト設定からの変更

- config/environments/development.rbにおける`config.file_watcher`の値を変更

macOSにおいてDocker Composeを使った開発において、デフォルト値ではファイルの変更をうまく検出されないため、ここの値を`ActiveSupport::FileUpdateChecker`に変更。

- config/application.rbにおける`field_error_proc`の追加

バリデーションエラー発生時にエラーが有った項目に対して目立たせるための処理を実装。
使うCSSフレームワークに応じて設定する値を変える必要がある。
