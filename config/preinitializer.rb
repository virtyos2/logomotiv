bundler_gems = File.expand_path('~/vendor/bundler_gems/gems', __FILE__)
if File.exist?(bundler_gems)
Dir["#{bundler_gems}/*/lib"].each { |path| $:.unshift(path) }
end

ENV["GEM_HOME"] = File.expand_path('/Users/andreika/vendor/bundler_gems', __FILE__)
