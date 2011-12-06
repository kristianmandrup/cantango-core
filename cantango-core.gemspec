# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cantango-core}
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Kristian Mandrup}, %q{Stanislaw Pankevich}]
  s.date = %q{2011-12-06}
  s.description = %q{Define your permission rules as role- or role group specific permits.
Integrates well with multiple Devise user acounts.
Includes rules caching.
Store permissions in yaml file or key-value store}
  s.email = %q{kmandrup@gmail.com, s.pankevich@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.mdown"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.mdown",
    "Rakefile",
    "VERSION",
    "cantango-core.gemspec",
    "lib/cantango/ability.rb",
    "lib/cantango/ability/base.rb",
    "lib/cantango/ability/cache.rb",
    "lib/cantango/ability/cache/simple_key.rb",
    "lib/cantango/ability/callbacks.rb",
    "lib/cantango/ability/executor.rb",
    "lib/cantango/ability/executor/base.rb",
    "lib/cantango/ability/executor/modal.rb",
    "lib/cantango/ability/helper.rb",
    "lib/cantango/ability/helper/account.rb",
    "lib/cantango/ability/helper/engine.rb",
    "lib/cantango/ability/helper/user.rb",
    "lib/cantango/ability/mode.rb",
    "lib/cantango/ability/mode/base.rb",
    "lib/cantango/ability/mode/finder.rb",
    "lib/cantango/ability/mode/no_cache.rb",
    "lib/cantango/ability/rules.rb",
    "lib/cantango/adaptor.rb",
    "lib/cantango/adaptor/active_record.rb",
    "lib/cantango/adaptor/data_mapper.rb",
    "lib/cantango/adaptor/generic.rb",
    "lib/cantango/adaptor/mongo.rb",
    "lib/cantango/adaptor/mongo_mapper.rb",
    "lib/cantango/adaptor/mongoid.rb",
    "lib/cantango/adaptor/relational.rb",
    "lib/cantango/can_can.rb",
    "lib/cantango/can_can/rule.rb",
    "lib/cantango/can_can/rule_class.rb",
    "lib/cantango/core.rb",
    "lib/cantango/engine.rb",
    "lib/cantango/filter.rb",
    "lib/cantango/filter/base.rb",
    "lib/cantango/helpers.rb",
    "lib/cantango/helpers/debug.rb",
    "lib/cantango/loader.rb",
    "lib/cantango/loader/yaml.rb",
    "lib/cantango/model.rb",
    "lib/cantango/model/guest.rb",
    "lib/cantango/rspec.rb",
    "lib/cantango/rspec/config.rb",
    "lib/cantango/rspec/matchers.rb",
    "lib/cantango/rspec/matchers/be_allowed_to.rb",
    "lib/cantango/scope.rb",
    "lib/cantango/scope/ability.rb",
    "lib/generators/cantango/install/install_generator.rb",
    "lib/generators/cantango/install/templates/cantango.rb",
    "lib/generators/cantango/install/templates/categories.yml",
    "lib/generators/cantango/install/templates/permissions.yml",
    "spec/active_record/001_create_posters.rb",
    "spec/active_record/002_create_users.rb",
    "spec/cantango/ability/base_spec.rb",
    "spec/cantango/ability/cache/simple_key_spec.rb",
    "spec/cantango/ability/callbacks_spec.rb",
    "spec/cantango/ability/executor/base_spec.rb",
    "spec/cantango/ability/executor/custom_spec.rb",
    "spec/cantango/ability/executor/modal_spec.rb",
    "spec/cantango/ability/executor_spec.rb",
    "spec/cantango/ability/helper/account_spec.rb",
    "spec/cantango/ability/helper/engine_spec.rb",
    "spec/cantango/ability/helper/user_spec.rb",
    "spec/cantango/ability/mode/base_example.rb",
    "spec/cantango/ability/mode/base_spec.rb",
    "spec/cantango/ability/mode/no_cache_spec.rb",
    "spec/cantango/ability/rules_spec.rb",
    "spec/cantango/adaptor/active_record_spec.rb",
    "spec/cantango/adaptor/data_mapper_spec.rb",
    "spec/cantango/adaptor/mongo_mapper_spec.rb",
    "spec/cantango/adaptor/mongoid_spec.rb",
    "spec/cantango/cancan/rule_class_spec.rb",
    "spec/cantango/cancan/rule_spec.rb",
    "spec/cantango/core_spec.rb",
    "spec/cantango/engine_spec.rb",
    "spec/cantango/filter/base_spec.rb",
    "spec/cantango/helpers/debug_spec.rb",
    "spec/cantango/loader/yaml_spec.rb",
    "spec/cantango/model/guest_spec.rb",
    "spec/cantango/rspec/be_allowed_to_spec.rb",
    "spec/cantango/scope/ability_spec.rb",
    "spec/cantango_spec.rb",
    "spec/db/database.yml",
    "spec/fixtures/models.rb",
    "spec/fixtures/models/account.rb",
    "spec/fixtures/models/admin.rb",
    "spec/fixtures/models/admin_account.rb",
    "spec/fixtures/models/items.rb",
    "spec/fixtures/models/user.rb",
    "spec/fixtures/test.yml",
    "spec/generators/cantango/install_generator_spec.rb",
    "spec/migration_helper.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/kristianmandrup/cantango}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{CanCan extension with role oriented permission management and more}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.1"])
      s.add_runtime_dependency(%q<cancan>, [">= 1.4"])
      s.add_runtime_dependency(%q<sugar-high>, [">= 0.6.0"])
      s.add_runtime_dependency(%q<sweetloader>, ["~> 0.1.5"])
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 2.6.1"])
      s.add_development_dependency(%q<forgery>, [">= 0.3"])
      s.add_development_dependency(%q<factory_girl>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 2.6.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.6.4"])
      s.add_development_dependency(%q<bundler>, [">= 1.1.rc"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0.9.2.2"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.1"])
      s.add_dependency(%q<cancan>, [">= 1.4"])
      s.add_dependency(%q<sugar-high>, [">= 0.6.0"])
      s.add_dependency(%q<sweetloader>, ["~> 0.1.5"])
      s.add_dependency(%q<hashie>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 2.6.1"])
      s.add_dependency(%q<forgery>, [">= 0.3"])
      s.add_dependency(%q<factory_girl>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2.6.0"])
      s.add_dependency(%q<jeweler>, [">= 1.6.4"])
      s.add_dependency(%q<bundler>, [">= 1.1.rc"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0.9.2.2"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.1"])
    s.add_dependency(%q<cancan>, [">= 1.4"])
    s.add_dependency(%q<sugar-high>, [">= 0.6.0"])
    s.add_dependency(%q<sweetloader>, ["~> 0.1.5"])
    s.add_dependency(%q<hashie>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 2.6.1"])
    s.add_dependency(%q<forgery>, [">= 0.3"])
    s.add_dependency(%q<factory_girl>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2.6.0"])
    s.add_dependency(%q<jeweler>, [">= 1.6.4"])
    s.add_dependency(%q<bundler>, [">= 1.1.rc"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0.9.2.2"])
  end
end

