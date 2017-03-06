require "active_support/inflector"

class MonthlyPageGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :test_suite, type: :string, default: 'rspec', desc: 'Test framework to generate test. (rspec or minitest)'

  def copy_monthly_page_file
    template 'monthly_page.rb', "app/monthly_page/#{file_name}.rb"
  end

  def copy_service_test_file
    if options.test_suite == 'rspec'
      template 'service_spec.rb', "spec/services/#{file_name}_spec.rb"
    elsif options.test_suite == 'minitest'
      template 'service_test.rb', "test/services/#{file_name}_test.rb"
    end
  end

  private

  def class_name
    file_name.classify
  end
end
