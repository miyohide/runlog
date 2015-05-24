require "factory_girl"

YAML.load_file(Rails.root.join("db", "seeds", "nike_run_logs.yml")).each do |run_log|
  Runrecord.create(runned_at: run_log[:start_time],
                   distance:  run_log[:distance].to_f.round(3),
                   run_time:  run_log[:duration][0..-5])  # 最後のコンマ秒数は削除
end

Dir[Rails.root.join("spec", "factories", "*.rb")].each { |f| require f }

Ability.delete_all
Role.delete_all
RolesAbility.delete_all

FactoryGirl.create(:admin_role)
FactoryGirl.create(:user_role)
FactoryGirl.create(:runrecord_role)

