require 'application_system_test_case'

class MainPathTest < ApplicationSystemTestCase
  test 'viewing the index' do
    visit root_path
    assert_selector 'h1', text: 'Runlogs'
  end
end
