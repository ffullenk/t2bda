# Load the rails application
require File.expand_path('../application', __FILE__)

# Patch Mysql adapter to default to MyISAM instead of InnoDB
require 'active_record/connection_adapters/mysql_adapter'
module ActiveRecord
  module ConnectionAdapters
    class MysqlAdapter
      def create_table(table_name, options = {}) #:nodoc:
        super(table_name, options.reverse_merge(:options => "ENGINE=MyISAM"))
      end
    end
  end
end

# Initialize the rails application
T2bda::Application.initialize!
