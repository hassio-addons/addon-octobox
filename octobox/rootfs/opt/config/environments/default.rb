Rails.application.configure do
    config.cache_classes = true
    config.eager_load = true
    config.consider_all_requests_local = false
    config.action_controller.perform_caching = true
    config.assets.js_compresspr = :uglifier
    config.assets.css_compressor = :sass
    config.assets.compile = true
    config.force_ssl = ENV.fetch("FORCE_SSL") { false }
    config.log_level = :info
    config.active_support.deprecation = false
    config.active_record.migration_error = :page_load
    config.active_record.verbose_query_logs = false
    config.assets.debug = false
    config.assets.quiet = true
end
