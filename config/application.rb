require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    ## エラーがある入力項目に対してuk-form-dangerクラスを追加して目立たせる
    ## ための処理を行う
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      if html_tag =~ /<(input|textarea|select)/
        p html_tag
        html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
        html_field.children.add_class 'uk-form-danger'
        html_field.to_s.html_safe
      else
        html_tag
      end
    end
  end
end
