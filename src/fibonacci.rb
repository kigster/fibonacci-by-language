#!/usr/bin/env ruby # encoding: utf-8 Author: Konstantin Gredeskoul

module FibRecursive
  @@mem = {}
  def self.fib(index)
    return index if index <= 1
    puts @@mem[index] if @@mem[index]
    @@mem[index] ||= fib(index-1) + fib(index-2)
  end
end

module FibClosure
  def self.fib(index)
    f = fibonacci
    index.times { f.call }
    f.call
  end

  def self.fibonacci
    first, second = 1, 0
    Proc.new {
      first, second = second, first + second
      puts first
      first
    }
  end
end

METHODS = %w[closure recursive]

def parse_args(argv)
  require 'optparse'

  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: echo N | fibonacci.rb [options]"

    opts.on("-a", "--algorithm ALGO", "One of: #{METHODS.join(', ')}") do |v|
      options[:algo] = v.to_s
      raise "Invalid algorithm! Allowed values: #{METHODS}" unless METHODS.include?(v.to_s)
    end

    opts.on("-h", "--help", "Prints this help") do
      puts opts
      exit
    end
  end.parse!

  options
end

def main(argv)
  srand(Time.now.to_i)
  options = parse_args(argv)

  puts "Please enter a number for which to compute Fibonacci:"
  number = Integer(STDIN.gets)

  method_argument = options[:algo] || "recursive"
  module_name = "Fib#{method_argument.capitalize}"
  puts "Using Module: #{module_name}"

  eval "#{module_name}.fib(#{number})"
end

main(ARGV.dup) if __FILE__ == $0
