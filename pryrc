Pry.config.color = true

def a_list
  (0..6).to_a
end

def a_hash
  { cat: "bunbun", handsome: true, father: "Ryan" }
end

def load_all!
  Rails.application.eager_load!
end

def seed_db_with_fixtures!
  require 'active_record/fixtures'
  fixtures_dir = File.join(Rails.root, '/test/fixtures')
  Dir.glob(File.join(fixtures_dir,'*.yml')).each do |file|
    base_name = File.basename(file, '.*')
    ActiveRecord::FixtureSet.create_fixtures(fixtures_dir, base_name)
  end
end
