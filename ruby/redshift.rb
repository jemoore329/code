# Redshift database connector
#
# Author::    Jari Otranen  (mailto:jari.otranen@gmail.com)
# Copyright:: Copyright (c) 2015 ShopAdvisor, Inc.

require 'pg'

module SA
  class Redshift
    def initialize
    end

    def open
      file = File.new("database.redshift")
      db = file.gets
      db = db.strip unless db.nil?
      puts "Db host: #{db}"

      @conn = PGconn.connect( :host=> db, :port=>5439, :dbname=>"analytics", :user=>"sa", :password=>'Valaskala1000')
    end

    def query(statement)
      begin
        res = @conn.exec(statement)
      rescue => e
        puts e
      end

      return res unless res.nil?
    end
    end
end



