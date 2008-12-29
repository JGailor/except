require 'rubygems'
require 'activerecord'

module Except
  def self.included(base)
    class << base
      def find_with_except(*args)
        options = args.last.is_a?(::Hash) ? args.pop : {}
        if exceptions = options.delete(:except)
          options[:select] = (self.column_names - exceptions.split(/,\s?/)).join(", ")
        end
        args << options
        find_without_except(*args)
      end

      alias_method :find_without_except, :find
      alias_method :find, :find_with_except
    end
  end
end

ActiveRecord::Base.send(:include, Except)
