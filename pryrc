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

def do_a_benchmark(&block)
  require 'benchmark'
  puts Benchmark.measure(&block)
end
